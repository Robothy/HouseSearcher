package edu.housesearcher.crawler.lianjia;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;

import edu.housesearcher.crawler.entity.EntHouse;
import edu.housesearcher.crawler.getter.AWebPageGetter;
import edu.housesearcher.crawler.getter.IWebPageGetter;
import edu.housesearcher.crawler.hrefprovider.DBHrefProvider;
import edu.housesearcher.crawler.manager.AWebpageManager;
import edu.housesearcher.crawler.parser.IWebPageParser;
import edu.housesearcher.crawler.saver.CommonPageDataDBSave;
import edu.housesearcher.crawler.saver.IPageDataSaver;



/**
 * @功能 爬取房屋信息
 * @author robothy
 *
 */
@Component
public class LianJiaHouseMessageCrawler extends AWebpageManager implements Serializable {

    private static final long serialVersionUID = 1L;

    private static final DBHrefProvider hrefProvider = new DBHrefProvider("EntHouse", "HHref");
    
    @Override
    public void run() {
	IWebPageGetter getter = new AWebPageGetter() {
	    
	    @Override
	    public Boolean isValidPage(Document document) {
		
		//判断是否已下架
		if(document.select("div[class=tag tag_yixiajia]").size()==0){
		    CRAWLER_LOGGER.info("该房子已下架！ "+document.baseUri());
		    return false;
		}
		//根据页面的标题判断是否跳转到首页（当链接无效时网站会自动跳转）
		if(Arrays.stream(new String[]{"上海租房","链家网上海站","上海租房网"}).parallel().anyMatch(document.title()::contains)) {
		    CRAWLER_LOGGER.debug("该链接无效！ " + document.baseUri());
		    return false;
		}
		//简单盘判断页面是否包含房屋的基本信息
		if(document.select("div[class=content forRent]").size()==0) {
		    CRAWLER_LOGGER.debug("该房屋不包含房屋的基本信息！" + document.baseUri());
		    return false;
		}
		
		return true;
	    }
	};
	
	IWebPageParser parser = new IWebPageParser() {
	    
	    @Override
	    public List<Map<String, String>> doParse(Document document) {
		
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		
		//获取包含房屋基本信息的节点
		try {
		    Element contentForRent = document.select("div[class=content forRent]").first();
		    //租金
		    String Price = contentForRent.select("div[class=price]").first()
			    .select("div[class=mainInfo bold]").first().ownText();
		    //户型 json 格式
		    String HType = "{\"room\":"+contentForRent.select("div[class=room]").first()
			    .select("div[class=mainInfo]").first().text()
			    .replace("室", ",\"hall\":").replace("厅", "}");
		    String Area = contentForRent.select("div[class=area]").select("div").first().ownText();
		    
		    String PubDate = null;
		    String HLevel = null;
		    String HOrientation = null;
		    
		    String CHref = null;
		    
		    Elements tds = contentForRent.select("td[class=title]");
		    for(Element td : tds){ 
			String text = td.text();
			Element next = td.nextElementSibling();
			if (td.attr("class").equals("title")) {
			    if(td.text().contains("楼层")) HLevel = next.text().replaceAll("[^0-9]", "");//楼层
			    else if (td.text().contains("朝向")) HOrientation = next.text().replace("朝", "");//朝向
			    else if(td.text().contains("上架")) PubDate = next.text().replace(".", "-");//上架日期
			    else if(text.contains("小区")) CHref = "http://sh.lianjia.com" + next.select("a").first().attr("href");//小区
			}
		    }
		    String AHref =  contentForRent.select("div[class=brokerName]").first().select("a").first().attr("href");//经纪人
		    AHref = AHref.contains("lianjia") ? AHref : "http://sh.lianjia.com" + AHref ;
		    
		    Map<String, String> node = new HashMap<String, String>();
		    node.put("Price", Price);
		    node.put("HType", HType);
		    node.put("PubDate",PubDate);
		    node.put("HLevel", HLevel);
		    node.put("HOrientation", HOrientation);
		    node.put("CHref", CHref);
		    node.put("AHref", AHref);
		    node.put("Area", Area);
		    result.add(node);
		    
		} catch (Exception e) {
		    CRAWLER_LOGGER.error("未能解析页面！ " + document.baseUri() );
		    return null;
		}
		return result;
	    }
	};
	
	IPageDataSaver saver = new CommonPageDataDBSave(EntHouse.class);
	
	
	do{
	    String[] hrefs = hrefProvider.getHrefs(30);
	    for(String href : hrefs){
		super.setHref(href);
		CRAWLER_LOGGER.debug("正在处理 " + super.getHref());
		
		Document document = get(getter);
		
		/**
		 * 统计连续获取到的空页面的次数
		 */
		if (document == null) {
		    CRAWLER_LOGGER.debug("获取到一个不合法的页面!" + href);
		}else {
		    super.setDocument(document);
		}
		
		List<Map<String, String>> data = parse(parser);
		for(Map<String, String> map : data) map.put("HHref", href);//把链接添加进去，才能更新。
		
		
		/**
		 * 统计连续获取到的不包含目标数据的页面的数量
		 */
		if(data.size()==0){
		    CRAWLER_LOGGER.debug("获取到一个不包含目标数据的页面!" + href );
		}else {
		    super.setData(data);
		}
		save(saver);
	    }
	}while(hrefProvider.getIsContinueProvide());
	
	
    }

}

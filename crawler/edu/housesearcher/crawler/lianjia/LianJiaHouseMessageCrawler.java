package edu.housesearcher.crawler.lianjia;

import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.springframework.stereotype.Component;

import edu.housesearcher.crawler.entity.EntAgent;
import edu.housesearcher.crawler.entity.EntCommunity;
import edu.housesearcher.crawler.entity.EntHouse;
import edu.housesearcher.crawler.getter.AWebPageGetter;
import edu.housesearcher.crawler.getter.IWebPageGetter;
import edu.housesearcher.crawler.hrefprovider.DBHrefProvider;
import edu.housesearcher.crawler.manager.AWebpageManager;
import edu.housesearcher.crawler.parser.IWebPageParser;
import edu.housesearcher.crawler.saver.APageDataDBSaver;
import edu.housesearcher.crawler.saver.CommonPageDataDBSave;
import edu.housesearcher.crawler.saver.IPageDataSaver;
import edu.housesearcher.crawler.utils.DateTimeUtil;
import edu.housesearcher.crawler.utils.HibernateUtil;
import edu.housesearcher.crawler.utils.StatusValueUtil;



/**
 * @功能 爬取房屋信息
 * @author robothy
 *
 */
@Component
public class LianJiaHouseMessageCrawler extends ALianJiaCrawlerManager implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 定义一个来源于数据表中的hrefProvider
     */
    private static final DBHrefProvider hrefProvider = new DBHrefProvider("EntHouse", "HHref");
    
    
    IWebPageGetter getter = new AWebPageGetter() {
	
	@Override
	public Boolean isValidPage(Document document) {
	    
	    /**
	     * 遇到反扒机制
	     */
	    if(isMeetCrawlerForbider(document)){
		hrefProvider.setIsContinueProvide(false);
		return false;
	    }
	    
	    //判断是否已下架
	    if(document.select("div[class=tag tag_yixiajia]").size()!=0){
		CRAWLER_LOGGER.info("该房子已下架！ "+document.baseUri());
		return false;
	    }
	    //根据页面的标题判断是否跳转到首页（当链接无效时网站会自动跳转）
//		if(Arrays.stream(new String[]{"上海租房","链家网上海站","上海租房网"}).parallel().anyMatch(document.title()::contains)) {
//		    CRAWLER_LOGGER.debug("该链接无效！ " + document.baseUri());
//		    return false;
//		}
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
	    
	    if(document == null){
		CRAWLER_LOGGER.warn("Document 对象为空");
		return null;
	    }
	    
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
		String Area = contentForRent.select("div[class=area]").select("div").first().text().replace("平", "");
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
		AHref = (AHref.contains("lianjia") ? AHref : "http://sh.lianjia.com").replaceAll("\\?.{1,}$", "");
		
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
    
    IPageDataSaver saver = new IPageDataSaver(){
	
	@Override
	public void doSave(Map<String, String> data) {
	}
	
	@Override
	public void doSave(List<Map<String, String>> datas) {
	    Session session = HibernateUtil.getSession();
	    Transaction transaction = session.beginTransaction();
	    for(Map<String, String> data : datas){
		String hqlUpdate = "update EntHouse set "
			+ "price = :Price, "
			+ "HType = :HType, "
			+ "pubDate = :PubDate, "
			+ "HLevel = :HLevel, "
			+ "HOrientation = :HOrientation, "
			+ "CHref = :CHref,"
			+ "AHref = :AHref,"
			+ "area = :Area,"
			+ "createTime = :CreateTime,"
			+ "isGetMsg = 'Y' "
			+ "where HHref = :HHref";
		int updateEntities = session.createQuery(hqlUpdate)
			.setString("Price", data.get("Price"))
			.setString("HType", data.get("HType"))
			.setString("PubDate", data.get("PubDate"))
			.setString("HLevel", data.get("HLevel"))
			.setString("HOrientation", data.get("HOrientation"))
			.setString("CHref", data.get("CHref"))
			.setString("AHref", data.get("AHref"))
			.setString("Area", data.get("Area").equals("")?null:data.get("Area"))
			.setString("HHref", data.get("HHref"))
			.setString("CreateTime", DateTimeUtil.getNowAsString())
			.executeUpdate();
		CRAWLER_LOGGER.info("更新了" + updateEntities + "条数据！");
		if(updateEntities>1){
		    CRAWLER_LOGGER.warn("警告： 更新了 " + updateEntities + " 条数据！");
		}
		
		/**
		 * 将 A_Href 插入到 Ent_Agent 表中, 插入之前判断是否村存在相同的数据
		 */
		Criteria criteria = session.createCriteria(EntAgent.class);
		criteria.add(Restrictions.eq("AHref", data.get("AHref")));
		if(criteria.list().size()<=0){
		    EntAgent agent = new EntAgent();
		    agent.setIsGetMsg("N");
		    agent.setAHref(data.get("AHref"));
		    session.saveOrUpdate(agent);
		}		    
		
		
		/**
		 * 将 C_Href 插入到 Ent_Community 表中。
		 */
		criteria = session.createCriteria(EntCommunity.class);
		criteria.add(Restrictions.eq("CHref", data.get("CHref")));
		if(criteria.list().size()<=0){
		    EntCommunity community = new EntCommunity();
		    community.setIsGetMsg("N");
		    community.setCHref(data.get("CHref"));
		    session.saveOrUpdate(community);
		}
		
		
	    }
	    transaction.commit();
	    session.close();
	}
	
    };
    @Override
    public void run() {
	    
	
	
	
	do{
	    String[] hrefs = hrefProvider.getHrefs(20);
	    for(String href : hrefs){
		super.setHref(href);
		CRAWLER_LOGGER.debug("正在处理 " + super.getHref());
		
		Document document = get(getter);
		
		/**
		 * 统计连续获取到的空页面的次数
		 */
		
		List<Map<String, String>> datas = null;
		if (document == null) {
		    CRAWLER_LOGGER.debug("获取到一个不合法的页面!" + href);
		}else {
		    super.setDocument(document);
		    datas = parse(parser);
		    for(Map<String, String> map : datas) map.put("HHref", href);//把链接添加进去，才能更新。
		}
		
		
		/**
		 * 统计连续获取到的不包含目标数据的页面的数量
		 */
		if(datas==null){
		    CRAWLER_LOGGER.debug("未能解析页面!" + href );
		}else if(datas.size()<1){
		    CRAWLER_LOGGER.debug("页面中不包含目标数据！ " + href);
		}else {
		    super.setData(datas);
		    save(saver);
		}
		if(!hrefProvider.getIsContinueProvide()) break;
	    }
	}while(hrefProvider.getIsContinueProvide());
	
	
    }


    @Override
    public Boolean appendDataByHref(String href) {

	Document document = getter.doGet(href);
	List<Map<String, String>> datas = parser.doParse(document);
	saver.doSave(datas);
	return true;
    
    }

    

}

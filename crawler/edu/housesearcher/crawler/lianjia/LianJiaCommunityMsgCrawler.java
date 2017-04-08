package edu.housesearcher.crawler.lianjia;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import edu.housesearcher.crawler.getter.AWebPageGetter;
import edu.housesearcher.crawler.getter.IWebPageGetter;
import edu.housesearcher.crawler.hrefprovider.DBHrefProvider;
import edu.housesearcher.crawler.parser.IWebPageParser;
import edu.housesearcher.crawler.saver.CommonPageDataDBUpdate;
import edu.housesearcher.crawler.saver.IPageDataSaver;
import edu.housesearcher.crawler.utils.DateTimeUtil;

public class LianJiaCommunityMsgCrawler extends ALianJiaCrawlerManager implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 从数据库中获取href
     */
    private static final DBHrefProvider hrefProvider = new DBHrefProvider("EntCommunity", "CHref");
    
    
    
    IWebPageGetter getter = new AWebPageGetter() {
	
	@Override
	public Boolean isValidPage(Document document) {
	    if(isMeetCrawlerForbider(document)){
		hrefProvider.setIsContinueProvide(false);
		return false;
	    }
	    if(document.title().contains("页面没有找到")) return false;
	    return true;
	}
    };
    
    IWebPageParser parser = new IWebPageParser() {
	
	@Override
	public List<Map<String, String>> doParse(Document document) {
	    
	    List<Map<String, String>> datas = new ArrayList<Map<String, String>>();
	    Map<String, String> data = new HashMap<String, String>();
	    try {		    
		String CName = document.select("h1").text();
		String CLocation = document.select("span[class=adr]").attr("title");
		CLocation = CLocation.length()<200?CLocation:CLocation.substring(0, 199);
		Element coordElement = document.select("div[class=zone-map js_content]").first();
		String coord = coordElement.attr("longitude") + "," + coordElement.attr("latitude");
		data.put("CName", CName);
		data.put("CLocation",CLocation);
		data.put("coord",coord);
		data.put("isGetMsg", "Y");
		data.put("createTime", DateTimeUtil.getNowAsString());
		datas.add(data);
	    } catch (Exception e) {
		CRAWLER_LOGGER.debug("文档解析出错!"+document.baseUri(),e);;
	    }
	    return datas;
	}
    };
    
    CommonPageDataDBUpdate saver = new CommonPageDataDBUpdate("EntCommunity");
    
    @Override
    public void run() {
	Map<String, String> restrictions = new HashMap<String, String>();
	
	do{
	    String[] hrefs = hrefProvider.getHrefs(20);
	    for(String href : hrefs){
		Document document = getter.doGet(href);
		
		List<Map<String, String>> datas = null;
		
		if(document==null){
		    CRAWLER_LOGGER.debug("其获取文本失败！" + href);
		    continue;
		}else{
		    datas = parser.doParse(document);
		}
		
		if(datas == null){
		    CRAWLER_LOGGER.debug("文件解析失败");
		}else{
		    restrictions.put("CHref", href);
		    saver.setRestrictions(restrictions);
		    saver.doSave(datas);
		}
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

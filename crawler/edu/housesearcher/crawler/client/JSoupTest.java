package edu.housesearcher.crawler.client;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;

import edu.housesearcher.crawler.utils.ICrawlerLogger;

public class JSoupTest implements ICrawlerLogger {
    
    
    
    
    
    
    
    @Test
    public void test2017031301(){
	
	Document document = null;
	try {
	    document= Jsoup.connect("http://sh.lianjia.com/zufang/shz1001059.html").get();
	} catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
	
	
	
	if(document == null){
	    CRAWLER_LOGGER.warn("Document 对象为空");
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
	}
	
	for(Map<String, String> map : result){
	    System.out.println(map);
	}
    
    }
    
    
    public static void main(String[]args) throws Exception{
	
	Document doc = Jsoup.connect("http://sh.lianjia.com/zufang/shz3734040.html").get();
	Element contentForRent = doc.select("div[class=content forRent]").first();
	
	//户型
	String HType = "{\"room\":"+contentForRent.select("div[class=room]").first()
		.select("div[class=mainInfo]").first().text()
		.replace("室", ",\"hall\":").replace("厅", "}");//户型
	
	String PubDate = null;
	String HLevel = null;
	String HOrientation = null;
	
	String CHref = null;
	
	Elements tds = contentForRent.select("td[class=title]");
	for(Element td : tds){ 
	    String text = td.text();
	    Element next = td.nextElementSibling();
	    if (td.attr("class").equals("title")) {
		if(td.text().contains("楼层")) HLevel = next.text().replaceAll("[^0-9]", "");
		else if (td.text().contains("朝向")) HOrientation = next.text().replace("朝", "");
		else if(td.text().contains("上架")) PubDate = next.text().replace(".", "-");
		else if(text.contains("小区")) CHref = "http://sh.lianjia.com" + next.select("a").first().attr("href");
	    }
	}
	
	
	
	
	String AHref =  contentForRent.select("div[class=brokerName]").first().select("a").first().attr("href");
	AHref = AHref.contains("lianjia") ? AHref : "http://sh.lianjia.com" + AHref ;
	
	
	
	System.out.println(HLevel+HOrientation+PubDate);
	
	System.out.println(AHref);
	System.out.println(CHref);
	System.out.println(HType);
    }
    
    public void test2017031102(){
	try {
	    Document document = Jsoup.connect("http://sh.lianjia.com/fdsafasd").get();
	    System.out.println(document.baseUri());
	    System.out.println(document.baseUri().replaceAll("[^\\d]", ""));
	} catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }
    
    
    public void test(){
	System.out.println("一层/12放到".replaceAll("[^0-9]", ""));
    }
    
    public void test2017031101(){
	try {
	    Document document = Jsoup.connect("http://sh.lianjia.com/fdsafasd").get();
	    System.out.println(document.html());
	} catch (IOException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }
    
    
    
    
}

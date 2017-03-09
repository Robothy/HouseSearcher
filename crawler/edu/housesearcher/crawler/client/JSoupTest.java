package edu.housesearcher.crawler.client;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;

public class JSoupTest {
    
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
    
    @Test
    public void test(){
	System.out.println("一层/12放到".replaceAll("[^0-9]", ""));
    }
    
}

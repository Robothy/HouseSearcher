package edu.housesearcher.crawler.lianjia;


import java.io.Serializable;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import edu.housesearcher.crawler.getter.AWebPageGetter;
import edu.housesearcher.crawler.getter.IWebPageGetter;
import edu.housesearcher.crawler.hrefprovider.AHrefProvider;
import edu.housesearcher.crawler.manager.AWebpageManager;
import edu.housesearcher.crawler.parser.IWebPageParser;
import edu.housesearcher.crawler.saver.IPageDataSaver;

public class LianJiaHrefListCrawler extends AWebpageManager implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 初始化块。 定义url的产生规则。
     */
    private static AHrefProvider hrefProvider = new AHrefProvider() {
	    private static final long serialVersionUID = 1L;
	    
	    private Integer seqNum = 0;
	    
	    /**
	     * 获取一条url，包含生成序列化url的规则。
	     * 当本类run方法中采用一次性获取多条href的时候，此方法不需要同步，可以提高程序运行的效率。
	     * 当本类run方法中采用一次性获取一条href的时候，此方法必须带有synchronized关键字。
	     */
	    @Override
	    public synchronized String getHref() {
		if(seqNum>99) super.setIsContinueProvide(false);
		seqNum++;
		return "http://sh.lianjia.com/zufang/d"+seqNum.toString();
	    }
	};
    
    @Override
    public void run() {
	
	IWebPageGetter getter = new AWebPageGetter() {
	    
	    @Override
	    public Boolean isValidPage(Document document) {
		
		Boolean result = true;
		
		/**
		 * 该页面没有房屋信息列表，即 class = 'house-lst' 的 ul 标签下的子节点个数为 0 。
		 */
		if(document.select("ul[id=house-lst]").isEmpty()) result = false ;
		
		return result;
	    }
	};
	
	IWebPageParser parser = new IWebPageParser() {
	    
	    @Override
	    public Map<String, String> doParse(Document document) {
		if(document==null) return null;
		Map<String, String> result = new HashMap<>();
		Elements elements = document.select("a[name=selectDetail]");
		Iterator<Element> iterator = elements.iterator();
		while(iterator.hasNext()){
		    Element element = iterator.next();
		    String key = element.attr("href");
		    String value = "http://sh.lianjia.com" + key;
		    result.put(key, value);
		}
		
		return result;
	    }
	};
	
	IPageDataSaver saver = new IPageDataSaver() {
	    
	    @Override
	    public void doSave(Map<String, String> data) {
		if(data == null) return;
		
	    }
	};
	
	
	
	do{
	    super.setHref(hrefProvider.getHref());
	    CRAWLER_LOGGER.debug(super.getHref());
	    //get(getter);
	    parse(parser);
	    save(saver);
	}while(hrefProvider.getIsContinueProvide());
	
	
    }

}

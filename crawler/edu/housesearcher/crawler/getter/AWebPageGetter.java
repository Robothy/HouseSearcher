package edu.housesearcher.crawler.getter;

import java.io.IOException;

import org.jsoup.Connection;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;


public abstract class AWebPageGetter implements IWebPageGetter {

    @Override
    public Document doGet(String href) {
	
	Response response = null;
	
	Document document = null;
	Connection connection = null;
	connection = Jsoup.connect(href);
	
	try {
	    response = connection.ignoreHttpErrors(true).execute();
	} catch (IOException e) {
	    CRAWLER_LOGGER.error("IO 异常,未能获取到页面");
	    e.printStackTrace();
	}
	
	/**
	 * 检查获取到的页面内容是否符合要求，
	 * 若符合要求，则正常返回document对象
	 * 否则，使document指向bull，再返回，即返回null
	 */
	if (response!=null && response.statusCode()==200) {
	    
	    try {
		document = connection.get();
	    } catch (IOException e) {
		e.printStackTrace();
		CRAWLER_LOGGER.error("获取文档内容错误  href = " + href);
	    }
	    
	    if (document!=null) {
		CRAWLER_LOGGER.debug("获取到了文档!" + href);
		if (!isValidPage(document)) {
		    document = null;
		}
	    }
	    
	}else{
	    CRAWLER_LOGGER.error("未能获取到文档 :" + href);
	    if (response!=null) {
		CRAWLER_LOGGER.info("statusCode = " + response.statusCode() + "\tStatusMessage = " + response.statusMessage());
	    }
	}
	return document;
    }
    
}

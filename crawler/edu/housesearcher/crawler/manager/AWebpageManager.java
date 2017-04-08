package edu.housesearcher.crawler.manager;


import java.util.List;
import java.util.Map;

import org.jsoup.nodes.Document;

import edu.housesearcher.crawler.getter.IWebPageGetter;
import edu.housesearcher.crawler.hrefprovider.AHrefProvider;
import edu.housesearcher.crawler.parser.IWebPageParser;
import edu.housesearcher.crawler.saver.IPageDataSaver;
import edu.housesearcher.crawler.utils.ICrawlerLogger;

/**
 * @抽象类 控制一个页面抓取的整个流程，包括页面的获取，解析，数据存储功能
 * 
 * @接口	Runnable 实现多线程
 * 	ICrewlerLogger 实现日志记录
 * @author robothy
 * 
 */


public abstract class AWebpageManager implements Runnable,ICrawlerLogger {

    /**
     * 
     * @功能 根据 href 新增一条数据，一般用于当需要使用到某条数据，而数据库
     * 	中不存在数据时，直接从站点获取数据。
     * @param href 超链接
     * @return 若更新成功，则返回 true ， 否则返回 false
     */
    public abstract Boolean appendDataByHref(String href);
    
    /**
     * 当前需要获取HTML文本的URL
     */
    private String href=null;
    
    /**
     * 获取得到的JSoup Document对象
     */
    private Document document=null;
    
    /**
     * 解析得到的数据
     */
    private List<Map<String, String>> data = null;

    /**
     * 执行获取页面文本操作
     */
    protected Document get(IWebPageGetter getter){
	return getter.doGet(href);
    }
    
    /**
     * 执行页面解析操作
     * @return 
     */
    protected List<Map<String, String>> parse(IWebPageParser parser){
	return parser.doParse(document);
    }
    
    /**
     * 执行保存页面数据操作
     */
    protected void save(IPageDataSaver pds){
	pds.doSave(data);
    }
    
    /**
     * Getters and setters. 
     */
    public String getHref() {
        return href;
    }

    public void setHref(String url) {
        this.href = url;
    }

    public Document getDocument() {
        return document;
    }

    public void setDocument(Document document) {
        this.document = document;
    }

    public List<Map<String, String>> getData() {
        return data;
    }

    public void setData(List<Map<String, String>> data) {
        this.data = data;
    }
    
}

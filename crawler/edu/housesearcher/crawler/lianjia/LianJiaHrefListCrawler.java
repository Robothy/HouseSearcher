package edu.housesearcher.crawler.lianjia;


import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;

import edu.housesearcher.crawler.entity.EntHouse;
import edu.housesearcher.crawler.getter.AWebPageGetter;
import edu.housesearcher.crawler.getter.IWebPageGetter;
import edu.housesearcher.crawler.hrefprovider.AHrefProvider;
import edu.housesearcher.crawler.parser.IWebPageParser;
import edu.housesearcher.crawler.saver.CommonPageDataDBSave;
import edu.housesearcher.crawler.saver.IPageDataSaver;
import edu.housesearcher.crawler.utils.StatusValueUtil;
@Component
public class LianJiaHrefListCrawler extends ALianJiaCrawlerManager implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 初始化块。 定义url的产生规则。
     */
    private static AHrefProvider hrefProvider = new AHrefProvider() {
	    private static final long serialVersionUID = 1L;
	    
	    private Integer seqNum = Integer.parseInt(StatusValueUtil.getStatusValue("edu.housesearcher.crawler.lianjia.LianJiaHrefListCrawler.seqNum")) - 5; 
	    
	    public Integer getSeqNum(){
		return seqNum;
	    }
	    
	    /**
	     * 获取一条url，包含生成序列化url的规则。
	     * 当本类run方法中采用一次性获取多条href的时候，此方法不需要同步，可以提高程序运行的效率。
	     * 当本类run方法中采用一次性获取一条href的时候，此方法必须带有synchronized关键字。
	     */
	    @Override
	    public synchronized String getHref() {
		if(seqNum>=3500) setIsContinueProvide(false);
		seqNum++;
		return "http://sh.lianjia.com/zufang/d"+seqNum.toString();
	    }
	};
    
	IWebPageGetter getter = new AWebPageGetter() {
	    
	    @Override
	    public Boolean isValidPage(Document document) {
		
		Boolean result = true;
		
		/**
		 * 遇到反扒机制
		 */
		if(isMeetCrawlerForbider(document)){
		    hrefProvider.setIsContinueProvide(false);
		    return false;
		}
		
		/**
		 * 该页面没有房屋信息列表，即 class = 'house-lst' 的 ul 标签下的子节点个数为 0 。
		 */
		if(document.select("ul[id=house-lst]").isEmpty()) {
		    CRAWLER_LOGGER.debug(document.html());
		    CRAWLER_LOGGER.debug("没有房屋列表！");
		    result = false ;
		}
		
		/**
		 * 判断是否因为访问过于频繁，而导致服务器返回不正常的页面！
		 * 如果返回了不正常的页面，则停止进行数据的爬取！
		 */
		Elements elements = document.select("p[class=errorMessageInfo]");
		if(elements!=null){
		    if(elements.size()!=0&&elements.get(0).text().contains("服务器开小差了，请稍后重试哦")){
			//保存运行时的数据状态
			String value = "" ;
			Method getSeqNum = null ;
			try {
			    getSeqNum = hrefProvider.getClass().getMethod("getSeqNum");//获取无参数方法 getSeqNum
			} catch (NoSuchMethodException | SecurityException e) {
			    CRAWLER_LOGGER.error("获取 getSeqNum 方法失败!", e);
			    e.printStackTrace();
			}
			if(getSeqNum!=null){
			    try {
				value = ((Integer) getSeqNum.invoke(hrefProvider)).toString() ;
			    } catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
				CRAWLER_LOGGER.error("调用 getSeqNum 失败！", e);
				e.printStackTrace();
			    }
			}
			if(!value.equals("")){
			    StatusValueUtil.setStatusValue("edu.housesearcher.crawler.lianjia.LianJiaHrefListCrawler.seqNum",value );
			}
			hrefProvider.setIsContinueProvide(false);
		    }
		}
		return result;
	    }
	};
	
	IWebPageParser parser = new IWebPageParser() {
	    
	    @Override
	    public List<Map<String, String>> doParse(Document document) {
		if(document==null) {
		    CRAWLER_LOGGER.debug("文档为空！");
		    return null;
		}
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		Elements elements = document.select("ul[id=house-lst] li");
		Iterator<Element> iterator = elements.iterator();
		while(iterator.hasNext()){
		    Element element = iterator.next();
		    String key = element.select("a[class=rent]").attr("href");
		    String value = "http://sh.lianjia.com" + key;//住房超链接
		    String title = element.select("img").attr("alt");//标题
		    String tags = element.select("div[class=chanquan] span[class=fang-subway-ex] span").text()+",";//标签
		    Map<String, String> e = new HashMap<String,String>();
		    e.put("HTitle",title);
		    e.put("HTags",tags);
		    e.put("HHref", value);
		    e.put("IsGetMsg", "N");
		    result.add(e);
		}
		return result;
	    }
	};
	
	IPageDataSaver saver = new CommonPageDataDBSave(EntHouse.class);
    @Override
    public void run() {
	
	
	Integer invalidPagesCount = 0;
	Integer emptyPagesCount = 0;
	
	do{
	    super.setHref(hrefProvider.getHref());
	    CRAWLER_LOGGER.debug("正在处理 " + super.getHref());
	    
	    Document document = get(getter);
	    
	    /**
	     * 统计连续获取到的空页面的次数
	     */
	    if (document == null) {
		CRAWLER_LOGGER.debug("获取到一个不合法的页面!"+super.getHref());
		invalidPagesCount ++;
		if(invalidPagesCount>=5) {
		    CRAWLER_LOGGER.info("连续获取到了 " + invalidPagesCount + " 个不合法的页面！");
		    hrefProvider.setIsContinueProvide(false);
		}
	    }else {
		invalidPagesCount = 0;
		super.setDocument(document);
	    }
	    
	    List<Map<String, String>> data = parse(parser);
	    
	    /**
	     * 统计连续获取到的不包含目标数据的页面的数量
	     */
	    if(data.size()==0){
		CRAWLER_LOGGER.debug("获取到一个不包含目标数据的页面!");
		emptyPagesCount ++;
		if(emptyPagesCount>=5) hrefProvider.setIsContinueProvide(false);
	    }else {
		emptyPagesCount = 0;
		super.setData(data);
	    }
	    
	    save(saver);
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

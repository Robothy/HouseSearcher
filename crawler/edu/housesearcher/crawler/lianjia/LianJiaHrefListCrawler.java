package edu.housesearcher.crawler.lianjia;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.mapping.Constraint;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;

import edu.housesearcher.crawler.entity.EntHouse;
import edu.housesearcher.crawler.getter.AWebPageGetter;
import edu.housesearcher.crawler.getter.IWebPageGetter;
import edu.housesearcher.crawler.hrefprovider.AHrefProvider;
import edu.housesearcher.crawler.manager.AWebpageManager;
import edu.housesearcher.crawler.parser.IWebPageParser;
import edu.housesearcher.crawler.saver.APageDataDBSaver;
import edu.housesearcher.crawler.saver.CommonPageDataDBSave;
import edu.housesearcher.crawler.saver.IPageDataSaver;
import edu.housesearcher.crawler.utils.HibernateUtil;
@Component
public class LianJiaHrefListCrawler extends AWebpageManager implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 初始化块。 定义url的产生规则。
     */
    private static AHrefProvider hrefProvider = new AHrefProvider() {
	    private static final long serialVersionUID = 1L;
	    
	    private Integer seqNum = 450;
	    
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
    
    @Override
    public void run() {
	
	IWebPageGetter getter = new AWebPageGetter() {
	    
	    @Override
	    public Boolean isValidPage(Document document) {
		
		Boolean result = true;
		
		/**
		 * 该页面没有房屋信息列表，即 class = 'house-lst' 的 ul 标签下的子节点个数为 0 。
		 */
		if(document.select("ul[id=house-lst]").isEmpty()) {
		    CRAWLER_LOGGER.debug(document.data());
		    CRAWLER_LOGGER.debug("没有房屋列表！");
		    result = false ;
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
		Elements elements = document.select("a[class=rent]");
		Iterator<Element> iterator = elements.iterator();
		while(iterator.hasNext()){
		    Element element = iterator.next();
		    String key = element.attr("href");
		    String value = "http://sh.lianjia.com" + key;
		    Map<String, String> e = new HashMap<String,String>();
		    e.put("HHref", value);
		    e.put("IsGetMsg", "N");
		    result.add(e);
		}
		return result;
	    }
	};
	
	IPageDataSaver saver = new IPageDataSaver() {
	    @Override
	    public void doSave(List<Map<String, String>> datas) {

		Session session = HibernateUtil.getSession();
		Transaction transaction = session.beginTransaction();
		for(Map<String, String> data : datas){
		    Criteria criteria = session.createCriteria(EntHouse.class);
		    criteria.add(Restrictions.eq("HHref", data.get("HHref")));
		    List<EntHouse> houses = null;
		    try{
			houses = criteria.list();
		    }catch(Exception e){
			CRAWLER_LOGGER.error("从EntHouse表中查询数据失败！",e);
			e.printStackTrace();
			continue;
		    }
		    if(houses.size()>0) continue; //存在的对象,跳过
		    EntHouse obj = new EntHouse();
		    obj.setHHref(data.get("HHref"));
		    obj.setIsGetMsg(data.get("IsGetMsg"));
		    try{
			session.save(obj);
		    }catch(Exception e){
			CRAWLER_LOGGER.error("保存数据到EntHouse中失败",e);
			e.printStackTrace();
			continue;
		    }
		}
		transaction.commit();
		session.close();
		datas.clear();
	    }
	    
	    @Override
	    public void doSave(Map<String, String> data) {}
	};
	
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

}

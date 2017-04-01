package edu.housesearcher.crawler.controlcenter;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import edu.housesearcher.crawler.entity.CrawlerCfg;
import edu.housesearcher.crawler.threadcontroller.ThreadController;
import edu.housesearcher.crawler.utils.HibernateUtil;
import edu.housesearcher.crawler.utils.ICrawlerLogger;


/**
 * @类 爬虫控制中心(单例)
 * @author robothy
 *
 */
public class CrawlerControlcenter implements ICrawlerLogger {
    
    public static CrawlerControlcenter crawlerControlcenter = null;

    private List<String> websites = null;
    
    private CrawlerControlcenter(){
	/**
	 * 读取站点信息
	 */
	Session session = HibernateUtil.getSession();
	Transaction transaction = session.beginTransaction();
	Criteria criteria = session.createCriteria(CrawlerCfg.class);
	criteria.setProjection(Projections.distinct(Projections.property("website")));
	websites = criteria.list();
	transaction.commit();
	session.close();
    }
    
    public void run(){
	if(websites == null){
	    CRAWLER_LOGGER.error("未能获取到站点信息，请检查 CRAWLER_CFG 表是否存在相应配置信息！");
	    return;
	}
	
	List<Runnable> runnables = new ArrayList<Runnable>();
	
	for(String website :websites){
	    Runnable thread = new CrawlerDepartment(website); 
	    runnables.add(thread);
	}
	
	ThreadController controller = new ThreadController(runnables);
	controller.runThreads();
    }
    
    /**
     * @内部类 控制各个站点 crawler 的运行。
     * @author robothy
     *
     */
    private class CrawlerDepartment implements Runnable{
	
	private List<Runnable> runnables = new ArrayList<Runnable>();
	
	/**
	 * @param website 站点的名称，对应配置表 CRAWLER_CFG 表中的 website 字段
	 */
	public CrawlerDepartment(String website){
	    
	    List<String> crawlers = null;
	    Session session = HibernateUtil.getSession();
	    Transaction transaction = session.beginTransaction();
	    Criteria criteria = session.createCriteria(CrawlerCfg.class);
	    criteria.add(Restrictions.eq("website", website));
	    criteria.addOrder(Order.asc("priority"));
	    try{
		crawlers = criteria.list();
	    }catch(Exception e){
		CRAWLER_LOGGER.error("从数据库中获取站点 " + website + " 的模块信息失败 ！");
	    }
	    transaction.commit();
	    session.close();
	    	    
	    for(String crawler : crawlers){
		Class<?> object = null;
		try {
		    object = Class.forName(crawler);
		} catch (ClassNotFoundException e) {
		    CRAWLER_LOGGER.error("未能找到类: " + crawler + ", 请检查 CRAWLER_CFG 表中的配置信息！");
		    e.printStackTrace();
		    continue;
		}
		Runnable runnable = null;
		try {
		    runnable = (Runnable) object.newInstance();
		} catch (InstantiationException | IllegalAccessException e) {
		    CRAWLER_LOGGER.error("获取 " + crawler + " 对象失败！请检查类 ： " + crawler,e);
		    e.printStackTrace();
		    continue;
		}
		runnables.add(runnable);
	    }
	}

	@Override
	public void run() {
	    for(Runnable rnb : runnables){
		ThreadController controller = new ThreadController(rnb,5);
	    }
	}
    }
    
    public static CrawlerControlcenter getInstance(){
	if(crawlerControlcenter == null){
	    synchronized(CrawlerControlcenter.class){
		if(crawlerControlcenter == null){
		    crawlerControlcenter = new CrawlerControlcenter();
		}
	    }
	}
	return crawlerControlcenter;
    }
}

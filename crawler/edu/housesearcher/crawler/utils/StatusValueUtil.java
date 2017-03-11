package edu.housesearcher.crawler.utils;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.mapping.Constraint;
import org.junit.Test;

import edu.housesearcher.crawler.entity.StatusValue;
/**
 * @工具类 设置与获取状态参数，用于保存系统运行时的状态参数，是系统下次开启的时候能够恢复到原来的状态。
 * @author robothy
 *
 */
public class StatusValueUtil implements ICrawlerLogger {
    
    public static String getStatusValue(String key){
	String value = null;
	Session session = HibernateUtil.getSession();
	Transaction transaction = session.beginTransaction();
	Criteria criteria = session.createCriteria(StatusValue.class);
	criteria.add(Restrictions.eq("statusKey", key));
	criteria.add(Restrictions.eq("enabled", "Y"));
	List<StatusValue> values = null;
	try{
	    values = criteria.list();
	}catch(HibernateException he){
	    CRAWLER_LOGGER.error("未能获取到状态参数 " + key + " 的值！");
	    session.close();
	    return null;
	}
	
	if(values.size()>0){
	    value = values.get(0).getStatusValue();
	}else{
	    CRAWLER_LOGGER.error("不存在状态参数 " + key);
	    value = null;
	}
	transaction.commit();
	session.close();
	return value;
    }
    
    public static Boolean setStatusValue(String key,String value){
	Session session = HibernateUtil.getSession();
	Transaction transaction = session.beginTransaction();
	StatusValue sv = new StatusValue(key);
	sv.setStatusValue(value);
	sv.setEnabled("Y");
	try{
	    session.saveOrUpdate(sv);
	}catch(HibernateException he){
	    session.close();
	    CRAWLER_LOGGER.error("保存状态参数数"+ key +"失败！",he);
	    he.printStackTrace();
	}
	transaction.commit();
	session.close();
	return true;
    }
    
    @Test
    public void test(){
	StatusValueUtil.setStatusValue("lianjia", "不恋家");
	System.out.println(StatusValueUtil.getStatusValue("lianjia"));
    }
    
}

package edu.housesearcher.web.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import edu.housesearcher.crawler.entity.EntHouse;
import edu.housesearcher.crawler.entity.EntUser;
import edu.housesearcher.crawler.utils.HibernateUtil;
import edu.housesearcher.crawler.utils.ICrawlerLogger;

public class UserDao {
    public Boolean save(EntUser user){
	Session session = HibernateUtil.getSession();
	Boolean result = false;
	Transaction transaction = null;
	try{
	    transaction = session.beginTransaction();
	    session.save(user);
	    transaction.commit();
	    result = true;
	}catch(Exception exception){
	    exception.printStackTrace();
	    ICrawlerLogger.error("保存数据失败",exception);
	    result = false;
	}finally {
	    session.close();
	}
	return result;
    }
    
    public Boolean update(EntUser user){
	Session session = HibernateUtil.getSession();
	Boolean result = false;
	Transaction transaction = null;
	try{
	    transaction = session.beginTransaction();
	    session.saveOrUpdate(user);
	    transaction.commit();
	    result = true;
	}catch(Exception exception){
	    exception.printStackTrace();
	    ICrawlerLogger.error("保存数据失败",exception);
	    result = false;
	}finally {
	    session.close();
	}
	return result;
    }
    
    public EntUser find(EntUser user){
	return find(user.getPhone());
    }
    
    public EntUser find(String phone){
	Session session = HibernateUtil.getSession();
	Transaction transaction = session.beginTransaction();
	Criteria criteria = session.createCriteria(EntUser.class);
	criteria.add(Restrictions.eq("phone", phone));
	EntUser result = null;
	try {
	    List results = criteria.list();
	    if(results.size()>0){
		result = (EntUser) results.get(0);
	    }
	    transaction.commit();
	} catch (Exception e) {
	    e.printStackTrace();
	    ICrawlerLogger.error("数据查找失败！");
	}finally {
	    session.close();
	}
	return result;
    }
    
}

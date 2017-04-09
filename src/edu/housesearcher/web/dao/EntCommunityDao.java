package edu.housesearcher.web.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import edu.housesearcher.crawler.entity.EntCommunity;
import edu.housesearcher.crawler.utils.HibernateUtil;

public class EntCommunityDao {
    public EntCommunity getInstanceByCommunityHref(String href){
	EntCommunity house = null;
	String hql = "from EntCommunity where CHref = '" + href + "'";
	Session session = HibernateUtil.getSession();
	Transaction transaction = session.beginTransaction();
	Query query = session.createQuery(hql);
	try{
	    List resultSet = query.list();
	    if(resultSet.size()>0){
		house = (EntCommunity)resultSet.get(0);
	    }
	    transaction.commit();
	}catch(Exception e){
	    e.printStackTrace();
	}finally {
	    session.close();
	}
	return house;
    }
}

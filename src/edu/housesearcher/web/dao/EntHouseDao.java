package edu.housesearcher.web.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import edu.housesearcher.crawler.entity.EntHouse;
import edu.housesearcher.crawler.utils.HibernateUtil;

public class EntHouseDao {
    public EntHouse getInstanceByHouseHref(String href){
	EntHouse house = null;
	String hql = "from EntHouse where HHref = '" + href + "'";
	Session session = HibernateUtil.getSession();
	Transaction transaction = session.beginTransaction();
	Query query = session.createQuery(hql);
	try{
	    List resultSet = query.list();
	    house = (EntHouse)resultSet.get(0);
	    transaction.commit();
	}catch(Exception e){
	    e.printStackTrace();
	}finally {
	    session.close();
	}
	return house;
    }
}

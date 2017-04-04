package edu.housesearcher.web.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import edu.housesearcher.crawler.entity.EntAgent;
import edu.housesearcher.crawler.utils.HibernateUtil;

public class EntAgentDao {
    
    public EntAgent getInstanceByAgentHref(String agentHref){
	String hql = "from EntAgent where AHref = '" + agentHref + "'";
	EntAgent agent = null;
	Session session = HibernateUtil.getSession();
	Transaction transaction = session.beginTransaction();
	try {
	    List results = session.createQuery(hql).list();
	    agent = (EntAgent)results.get(0);
	} catch (Exception e) {
	    // TODO: handle exception
	}
	transaction.commit();
	session.close();
	return agent;
    }
}

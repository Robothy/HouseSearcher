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
	    if(results.size()>0){
		agent = (EntAgent)results.get(0);
	    }
	    transaction.commit();
	} catch (Exception e) {
	    e.printStackTrace();
	}finally{
	    session.close();
	}
	return agent;
    }
    
    public List<EntAgent> getAgentsByCommunityHref(String communityHref){
	String hql = "from EntAgent where CHref = '" + communityHref + "'";
	List<EntAgent> agents = null;
	Session session = HibernateUtil.getSession();
	Transaction transaction = session.beginTransaction();
	try {
	    List results = session.createQuery(hql).list();
	    agents = results;
	    transaction.commit();
	} catch (Exception e) {
	    e.printStackTrace();
	}finally{
	    session.close();
	}
	return agents;
    }
    
}

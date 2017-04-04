package edu.housesearcher.web.dao;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import edu.housesearcher.crawler.entity.EntAgent;
import edu.housesearcher.crawler.entity.EntCommunity;
import edu.housesearcher.crawler.entity.EntHouse;
import edu.housesearcher.crawler.utils.HibernateUtil;
import edu.housesearcher.web.beans.HouseDetails;

public class HouseDetailDaoImpl implements IHouseDetailDao {

    @Override
    public HouseDetails getInstanceByHouse(EntHouse house) {
	if(house==null){
	    CRAWLER_LOGGER.debug("EntHouse 实例不能为空!");
	    return null;
	}
	
	if(house.getDataId()==null||house.getHHref()==null){
	   CRAWLER_LOGGER.debug("EntHouse 实例中不存在任何一个带值的唯一建！");
	   return null;
	}
	
	if(house.getDataId()!=null){
	    return this.getInstanceByHouseId(house.getDataId().toString());
	}else{
	    return this.getInstanceByHouseHref(house.getHHref());
	}
    }

    @Override
    public HouseDetails getInstanceByHouseHref(String houseHref) {
	return null;
    }

    @Override
    public HouseDetails getInstanceByHouseId(String houseId) {
	return null;
    }
    
    private HouseDetails query(String hql){
	
	EntHouse house = null;
	EntAgent agent = null;
	EntCommunity community = null;
	
	Session session = HibernateUtil.getSession();
	Transaction transaction = session.beginTransaction();
	Query query = session.createQuery(hql);
	try{
	    List results = query.list();
	    if(results.size()==0){
		CRAWLER_LOGGER.debug("未能从数据库中查到数据。");
	    }else{
		house = (EntHouse)(results.get(0));
	    }
	    
	}catch(Exception e){
	    e.printStackTrace();
	    CRAWLER_LOGGER.debug("获取EntHouse实例出现异常！");
	}
	
	List agentLists = session.createQuery("from EntAgent where AHref = '" + house.getAHref() + "'").list();
	
	transaction.commit();
	session.close();
	
	return null;
    }

}

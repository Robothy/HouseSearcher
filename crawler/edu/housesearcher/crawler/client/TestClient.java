package edu.housesearcher.crawler.client;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import edu.housesearcher.crawler.entity.EntHouse;
import edu.housesearcher.crawler.entity.EntHouseHome;
import edu.housesearcher.crawler.utils.HibernateUtil;

public class TestClient {

    public static void main(String[] args) {
	
	
	
	// TODO Auto-generated method stub
	Session session = HibernateUtil.getSession();
	Transaction tx = session.beginTransaction();
	tx.begin();
	EntHouse house = new EntHouse("f", new Date(), '方' , 2, "", "", "", 120);
	
	EntHouseHome home = new EntHouseHome();
	home.persist(house);
	tx.commit();
	
	
	
	
    }

}

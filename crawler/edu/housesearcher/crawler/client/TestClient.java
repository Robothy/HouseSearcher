package edu.housesearcher.crawler.client;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import edu.housesearcher.crawler.entity.EntHouse;
import edu.housesearcher.crawler.hrefprovider.DBHrefProvider;
import edu.housesearcher.crawler.utils.HibernateUtil;

public class TestClient {

    public static void main(String[] args) {
	TestClient client = new TestClient();
	client.test2017030901();
	System.exit(0);
    }

    @Test
    public void test2017030901(){
	DBHrefProvider dbHrefProvider = new DBHrefProvider("EntHouse", "HHref");
	while(dbHrefProvider.getIsContinueProvide()){
	    dbHrefProvider.getHrefs(20);
	}
    }
    
    
    public void test(){
	String str ="setSetString";
	System.out.println(str.substring(3));
    }
    
    

}

package edu.housesearcher.crawler.client;

import java.util.Date;

import org.apache.logging.log4j.core.net.server.TcpXmlSocketServerTest;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.Test;

import edu.housesearcher.crawler.entity.EntHouse;
import edu.housesearcher.crawler.entity.EntHouseHome;
import edu.housesearcher.crawler.lianjia.LianJiaHrefListCrawler;
import edu.housesearcher.crawler.threadcontroller.ThreadController;
import edu.housesearcher.crawler.utils.HibernateUtil;

public class CrawlerClient {

    /**
     * @param args
     */
    public static void main(String[] args) {
	ThreadController controller = new ThreadController(new LianJiaHrefListCrawler(), 5);
	controller.runThreads();
	System.exit(0);
    }
    
    @Test
    public void test(){
	
	Session session = HibernateUtil.getSession();
	Transaction tx = session.beginTransaction();
	tx.begin();
	EntHouse house = new EntHouse("f", new Date(), '方' , 2, "", "", "", 120);
	
	EntHouseHome home = new EntHouseHome();
	home.persist(house);
	tx.commit();
    }

}

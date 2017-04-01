package edu.housesearcher.crawler.lianjia;

import org.junit.Test;

import edu.housesearcher.crawler.threadcontroller.ThreadController;
import edu.housesearcher.crawler.utils.HibernateUtil;

public class LianJiaTest {

    public static void main(String[] args) {
//	ThreadController controller = new ThreadController(new LianJiaHrefListCrawler(), 5);
//	
//	controller.runThreads();
//	
//	ThreadController controller = new ThreadController(new LianJiaHouseMessageCrawler(), 5);
//	controller.runThreads();
	

	ThreadController controller = new ThreadController(new LianJiaHrefListCrawler(), 2);
	controller.runThreads();
	
	HibernateUtil.closeSessionFactory();
	System.exit(0);
    }
    
    @Test
    public void TestLianJiaHresListCrawler(){
	ThreadController controller = new ThreadController(new LianJiaHrefListCrawler(), 5);
	controller.runThreads();
    }

}

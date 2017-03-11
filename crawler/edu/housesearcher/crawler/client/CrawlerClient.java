package edu.housesearcher.crawler.client;


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
	
//	ThreadController controller = new ThreadController(new LianJiaHouseMessageCrawler(), 5);
//	controller.runThreads();
	
	HibernateUtil.closeSessionFactory();
	System.exit(0);
    }
}

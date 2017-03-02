package edu.housesearcher.crawler.client;

import edu.housesearcher.crawler.lianjia.LianJiaHrefListCrawler;
import edu.housesearcher.crawler.threadcontroller.ThreadController;

public class CrawlerClient {

    /**
     * @param args
     */
    public static void main(String[] args) {
	ThreadController controller = new ThreadController(new LianJiaHrefListCrawler(), 5);
	controller.runThreads();
	System.exit(0);
    }

}

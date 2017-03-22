package edu.housesearcher.crawler.lianjia;

import edu.housesearcher.crawler.hrefprovider.DBHrefProvider;
import edu.housesearcher.crawler.hrefprovider.IHrefProvider;

public final class LianJiaAgentMessageCrawler extends ALianJiaCrawlerManager {

    private static final IHrefProvider hrefProvider = new DBHrefProvider("EntHouse", "AHref");
    
    
    
    @Override
    public void run() {
	
    }

}

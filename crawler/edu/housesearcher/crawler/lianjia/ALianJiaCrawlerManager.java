package edu.housesearcher.crawler.lianjia;

import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import edu.housesearcher.crawler.manager.AWebpageManager;

/**
 * @抽象类 链家站点处理抽象类,包含该站点公共信息处理的代码
 * @author robothy
 *
 */
public abstract class ALianJiaCrawlerManager extends AWebpageManager  {
    
    /**
     * 是否遭遇反扒机制的标志变量
     */
    private static Boolean isCrawlerForbided = false;
    
    /**
     * 检查是否遇到反爬虫机制
     * @param document
     * @return
     */
    protected Boolean isMeetCrawlerForbider(Document document){
	if(document==null) return false;
	
	Elements elements = document.select("p[class=errorMessageInfo]");
	if(elements!=null){
	    if(elements.size()!=0&&elements.get(0).text().contains("服务器开小差了，请稍后重试哦")){
		CRAWLER_LOGGER.info("反爬虫页面！");
		setIsCrawlerForbided(true);
		return true;
	    }
	}
	return false;
    }
    
    public static Boolean getIsCrawlerForbided() {
	return isCrawlerForbided;
    }

    public static void setIsCrawlerForbided(Boolean isCrawlerForbided) {
	ALianJiaCrawlerManager.isCrawlerForbided = isCrawlerForbided;
    }
    
}

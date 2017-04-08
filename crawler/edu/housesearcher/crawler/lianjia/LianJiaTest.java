package edu.housesearcher.crawler.lianjia;

import org.junit.Test;

import edu.housesearcher.crawler.threadcontroller.ThreadController;
import edu.housesearcher.crawler.utils.HibernateUtil;

public class LianJiaTest {

    public static void main(String[] args) {
	Integer a = new Integer(0);
	int b = 0;
	System.out.println("a = " + a);
	System.out.println("b = " + b);
    }
    
    public void test(){
	String href = "http://sh.lianjia.com/jingjiren/detail/190944.html?phone=4007675011,601784";
	href = href.replaceAll("\\?.{1,}$", "");
	System.out.println(href);
    }
    

    public void TestLianJiaCommunityMsgCrawler(){
	ThreadController controller = new ThreadController(new LianJiaCommunityMsgCrawler(), 5);
	controller.runThreads();
	HibernateUtil.closeSessionFactory();
	System.exit(0);
    }
    
    @Test
    public void TestLianJiaHrefListCrawler(){
	ThreadController controller = new ThreadController(new LianJiaHrefListCrawler(), 5);
	controller.runThreads();
	HibernateUtil.closeSessionFactory();
	System.exit(0);
    }
    
    public void TestLianJiaAgentMessageCrawler(){
	ThreadController controller = new ThreadController(new LianJiaAgentMessageCrawler(), 5);
	controller.runThreads();
	HibernateUtil.closeSessionFactory();
	System.exit(0);
    }
    
    public void TestLianjiaHouseMessageCrawler(){
	ThreadController controller = new ThreadController(new LianJiaHouseMessageCrawler(), 5);
	controller.runThreads();
	HibernateUtil.closeSessionFactory();
	System.exit(0);
    }

}

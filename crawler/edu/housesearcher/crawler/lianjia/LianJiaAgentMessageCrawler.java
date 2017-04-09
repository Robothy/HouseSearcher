package edu.housesearcher.crawler.lianjia;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.NamedAttributeNode;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import edu.housesearcher.crawler.entity.EntAgent;
import edu.housesearcher.crawler.entity.EntCommunity;
import edu.housesearcher.crawler.getter.AWebPageGetter;
import edu.housesearcher.crawler.getter.IWebPageGetter;
import edu.housesearcher.crawler.hrefprovider.DBHrefProvider;
import edu.housesearcher.crawler.hrefprovider.IHrefProvider;
import edu.housesearcher.crawler.parser.IWebPageParser;
import edu.housesearcher.crawler.saver.IPageDataSaver;
import edu.housesearcher.crawler.utils.DateTimeUtil;
import edu.housesearcher.crawler.utils.HibernateUtil;

public final class LianJiaAgentMessageCrawler extends ALianJiaCrawlerManager implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    /**
     * 从数据库中获取href
     */
    private static final DBHrefProvider hrefProvider = new DBHrefProvider("EntAgent", "AHref");
    
    IWebPageGetter getter = new AWebPageGetter() {
	@Override
	public Boolean isValidPage(Document document) {
	    /**
	     * 遇到反扒机制
	     */
	    if(isMeetCrawlerForbider(document)){
		hrefProvider.setIsContinueProvide(false);
		return false;
	    }
	    
	    if(document.title().contains("页面没有找到")) return false;
	    return true;
	}
    };
    
    IWebPageParser parser = new IWebPageParser() {
	
	@Override
	public List<Map<String, String>> doParse(Document document) {
	    
	    if(document == null){
		CRAWLER_LOGGER.warn("Document 对象为空");
		return null;
	    }
	    
	    List<Map<String, String>> result = new ArrayList<Map<String, String>>();
	    try{
		String aegntName = document.select("span[class=agentName]").first().text();//经纪人姓名
		String phoneNumber = document.select("span[class=tel]").first().text();//电话号码
		String cHref = document.select("div[class=majorProperty] a").first().attr("href");//小区
		String agentImg = document.select("div[class=clear userinfo] img").attr("src");//经纪人图片
		String praiseRate = "0";	//好评率
		Elements es =  document.select("p[class=subTitle]");//
		for (Element e : es){
		    if(e.text().contains("%")) praiseRate = e.text().replaceAll("[^0-9]", ""); 
		}
		Map<String,String> node = new HashMap<String,String>();
		node.put("agentName", aegntName);
		node.put("phoneNumber", phoneNumber);
		node.put("cHref", cHref);
		node.put("praiseRate", praiseRate);
		node.put("agentImg", agentImg);
		result.add(node);
	    }catch (Exception e) {
		CRAWLER_LOGGER.error("未能解析页面！ " + document.baseUri() );
		return null;
	    }
	    
	    return result;
	}
    };
    
    IPageDataSaver saver = new IPageDataSaver() {
	
	@Override
	public void doSave(List<Map<String, String>> datas) {
	    
	    Session session = HibernateUtil.getSession();
	    Transaction transaction = session.beginTransaction();
	    for(Map<String, String> data : datas){
		String hqlUpdate = "update EntAgent set "
			+ "name = :agentName, "
			+ "phone = :phoneNumber,"
			+ "praiseRate = :praiseRate,"
			+ "CHref = :CHref,"
			+ "createTime = :createTime,"
			+ "agentImg = :agentImg"
			+ "isGetMsg = 'Y' "
			+ "where AHref = :AHref";
		int updateEntities = session.createQuery(hqlUpdate)
			.setString("agentName", data.get("agentName"))
			.setString("phoneNumber", data.get("phoneNumber"))
			.setString("praiseRate", data.get("praiseRate"))
			.setString("CHref", data.get("CHref"))
			.setString("AHref", data.get("aHref"))
			.setString("agentImg", data.get("agentImg"))
			.setString("createTime", DateTimeUtil.getNowAsString())
			.executeUpdate();
		CRAWLER_LOGGER.info("更新了" + updateEntities + "条数据！");
		if(updateEntities>1){
		    CRAWLER_LOGGER.warn("警告： 更新了 " + updateEntities + " 条数据！");
		}
	    }
	    transaction.commit();
	    session.close();
	}
	
	@Override
	public void doSave(Map<String, String> data) {}
    };
    
    @Override
    public void run() {
	
	
	do{
	    String[] hrefs = hrefProvider.getHrefs(20);
	    for(String href : hrefs){
		super.setHref(href);
		CRAWLER_LOGGER.debug("正在处理 " + super.getHref());
		
		Document document = get(getter);
		
		List<Map<String, String>> datas = null;
		if (document == null) {
		    CRAWLER_LOGGER.debug("获取到一个不合法的页面!" + href);
		}else {
		    super.setDocument(document);
		    datas = parse(parser);
		    for(Map<String, String> map : datas) map.put("aHref", href);//把链接添加进去，才能更新。
		}
		
		
		if(datas==null){
		    CRAWLER_LOGGER.debug("未能解析页面!" + href );
		}else if(datas.size()<1){
		    CRAWLER_LOGGER.debug("页面中不包含目标数据！ " + href);
		}else {
		    super.setData(datas);
		    save(saver);
		}
		if(!hrefProvider.getIsContinueProvide()) break;
	    }
	}while(hrefProvider.getIsContinueProvide());
	
    }

    @Override
    public Boolean appendDataByHref(String href) {
	Document document = getter.doGet(href);
	List<Map<String, String>> datas = parser.doParse(document);
	saver.doSave(datas);
	return true;
    }

}

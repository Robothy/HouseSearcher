package edu.housesearcher.web.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.sun.org.apache.bcel.internal.generic.IF_ICMPGE;

import edu.housesearcher.crawler.entity.EntAgent;
import edu.housesearcher.crawler.entity.EntCommunity;
import edu.housesearcher.crawler.entity.EntHouse;
import edu.housesearcher.crawler.lianjia.LianJiaAgentMessageCrawler;
import edu.housesearcher.crawler.utils.HibernateUtil;
import edu.housesearcher.web.beans.HouseDetails;

public class HouseDetailDaoImpl implements IHouseDetailDao {

    @Override
    public HouseDetails getInstanceByHouse(EntHouse house) {
	if(house==null){
	    CRAWLER_LOGGER.debug("EntHouse 实例不能为空!");
	    return null;
	}
	
	if(house.getDataId()==null||house.getHHref()==null){
	   CRAWLER_LOGGER.debug("EntHouse 实例中不存在任何一个带值的唯一建！");
	   return null;
	}
	
	if(house.getDataId()!=null){
	    return this.getInstanceByHouseId(house.getDataId().toString());
	}else{
	    return this.getInstanceByHouseHref(house.getHHref());
	}
    }

    @Override
    public HouseDetails getInstanceByHouseHref(String houseHref) {
	
	Document document = null;
	try {
	    document = Jsoup.connect(houseHref).get();
	} catch (IOException e) {
	    e.printStackTrace();
	}
	if(document!=null){
	    
	    //获取图片
	    List<String[]> images = new ArrayList<String[]>();
	    Elements imgEles = document.select("div[class=album-view-wrap] li img");
	    for(Element e : imgEles){
		String[] img = new String[3];
		img[0] = e.attr("data-large");
		img[1] = e.attr("src");
		img[2] = e.attr("img-title");
		images.add(img);
	    }
	    
	    //标题
	    String houseTitle = document.select("h1").text();
	    
	    //价格
	    String price = document.select("div[class=price] div").text();
	    //户型
	    String type = document.select("div[class=room] div").text().replaceAll("[室|厅]", "-");
	    String room = type.split("-")[0];
	    String hall = type.split("-")[1];
	    //面积
	    String area = document.select("div[class=area] div").text();
	    //详情，这里为了简单起见直接把html弄下来了
	    String level = document.select("table[class=aroundInfo]").html();
	    //经济人超链接
	    String agentHref = document.select("div[class=brokerName] a").attr("href");
	    //经纪人图片
	    String agentImg = document.select("div[class=brokerInfo] img").attr("src");

	    EntAgentDao agentDao = new EntAgentDao();
	    EntAgent agent = agentDao.getInstanceByAgentHref(agentHref);
	    if(agent==null||agent.getIsGetMsg().equals("N")){
		(new LianJiaAgentMessageCrawler()).appendDataByHref(agentHref);
	    }
	    
	    agent = agentDao.getInstanceByAgentHref(agentHref);
	    
	    //经纪人姓名
	    String agentName = agent.getName();;
	    //经济人好评率
	    String favorateRate  = agent.getPraiseRate();
	    //经纪人电话
	    String phone = agent.getPhone();
	    
	    
	    //经纬度
	    String longitude = document.select("div[id=zoneMap]").attr("longitude");
	    String latitude = document.select("div[id=zoneMap]").attr("latitude");
	
	    return (new HouseDetails())
		    .setAgentHref(agentHref)
		    .setAgentImg(agentImg)
		    .setAgentName(agentName)
		    .setAgentPhone(phone)
		    .setPraiseRate(favorateRate)
		    .setArea(area)
		    .setHall(hall)
		    .setImages(images)
		    .setLatitude(latitude)
		    .setLevel(level)
		    .setLongitude(longitude)
		    .setPrice(price)
		    .setRoom(room)
		    .setHouseTitle(houseTitle)
		    .setHouseHref(houseHref);
	}else{
	    CRAWLER_LOGGER.debug("获取页面失败！");
	}
	return null;	
    }

    @Override
    public HouseDetails getInstanceByHouseId(String houseId) {
	return null;
    }
    
}

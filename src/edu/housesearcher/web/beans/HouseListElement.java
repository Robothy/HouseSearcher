package edu.housesearcher.web.beans;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.boot.jaxb.hbm.spi.PluralAttributeInfoPrimitiveArrayAdapter;
import org.hibernate.criterion.Restrictions;
import org.junit.experimental.theories.Theories;

import edu.housesearcher.crawler.entity.EntCommunity;
import edu.housesearcher.crawler.entity.EntHouse;
import edu.housesearcher.crawler.utils.HibernateUtil;
import edu.housesearcher.crawler.utils.ICrawlerLogger;

/**
 * @desc 房屋信息列表元素
 * @author robothy
 *
 */
public class HouseListElement implements ICrawlerLogger{

    private Integer dataId;
    private String HHref;
    private String HTitle;
    private String HTags;
    private String pubDate;
    private String area;
    private String price;
    private String HType;
    private String HLevel;
    private String HOrientation;
    private String imgHref;
    private String CHref;
    private String AHref;
    private String isGetMsg;
    private String createTime;
    private String CName;	//小区名称
    private String collectNum;	//收藏人数
    
    public HouseListElement() {
    }
    
    public HouseListElement(EntHouse house){
	this.HHref = house.getHHref();
	this.HTitle = house.getHTitle();
	this.HTags = house.getHTags();
	this.pubDate = house.getPubDate();
	this.area = house.getArea();
	this.price = house.getPrice();
	this.HType = house.getHType();
	this.HLevel = house.getHLevel();
	this.HOrientation = house.getHOrientation();
	this.imgHref = house.getImgHref();
	this.CHref = house.getCHref();
	this.AHref = house.getAHref();
	this.isGetMsg = house.getIsGetMsg();
	this.createTime = house.getCreateTime();
	this.getRelatedPropertiesValue();
    }
    
    public HouseListElement(String HHref, String HTitle, String HTags, String pubDate, String area, String price, String HType,
	    String HLevel, String HOrientation, String imgHref, String CHref, String AHref, String isGetMsg,
	    String createTime) {
	this.HHref = HHref;
	this.HTitle = HTitle;
	this.HTags = HTags;
	this.pubDate = pubDate;
	this.area = area;
	this.price = price;
	this.HType = HType;
	this.HLevel = HLevel;
	this.HOrientation = HOrientation;
	this.imgHref = imgHref;
	this.CHref = CHref;
	this.AHref = AHref;
	this.isGetMsg = isGetMsg;
	this.createTime = createTime;
    }

    /**
     * 获取相关变量的值
     */
    private void getRelatedPropertiesValue(){
	//获取小区名称的值
	Session session = HibernateUtil.getSession();
	Transaction transaction = session.beginTransaction();
	Criteria criteria = session.createCriteria(EntCommunity.class);
	criteria.add(Restrictions.eq("CHref", CHref));
	List<EntCommunity> result = null;
	try{
	    result = criteria.list();
	}catch(Exception e){
	    CRAWLER_LOGGER.error(e);
	}
	if(result!=null)
	if(result.size()!=0){
	    this.CName = ((EntCommunity)(result.get(0))).getCName();
	}
	transaction.commit();
	session.close();
	
	//获取收藏人数属性 collectNum 的值
	collectNum = "12";
    }
    
    public String getCName() {
        return CName;
    }

    public void setCName(String cName) {
        CName = cName;
    }

    public String getCollectNum() {
        return collectNum;
    }

    public void setCollectNum(String collectNum) {
        this.collectNum = collectNum;
    }

    public Integer getDataId() {
	return this.dataId;
    }

    public void setDataId(Integer dataId) {
	this.dataId = dataId;
    }

    public String getHHref() {
	return this.HHref;
    }

    public void setHHref(String HHref) {
	this.HHref = HHref;
    }

    public String getHTitle() {
	return this.HTitle;
    }

    public void setHTitle(String HTitle) {
	this.HTitle = HTitle;
    }

    public String getHTags() {
	return this.HTags;
    }

    public void setHTags(String HTags) {
	this.HTags = HTags;
    }

    public String getPubDate() {
	return this.pubDate;
    }

    public void setPubDate(String pubDate) {
	this.pubDate = pubDate;
    }

    public String getArea() {
	return this.area;
    }

    public void setArea(String area) {
	this.area = area;
    }

    public String getPrice() {
	return this.price;
    }

    public void setPrice(String price) {
	this.price = price;
    }

    public String getHType() {
	return this.HType;
    }

    public void setHType(String HType) {
	this.HType = HType;
    }

    public String getHLevel() {
	return this.HLevel;
    }

    public void setHLevel(String HLevel) {
	this.HLevel = HLevel;
    }

    public String getHOrientation() {
	return this.HOrientation.equals("暂无数据") ? "" : this.HOrientation;
    }

    public void setHOrientation(String HOrientation) {
	this.HOrientation = HOrientation;
    }

    public String getImgHref() {
	return this.imgHref;
    }

    public void setImgHref(String imgHref) {
	this.imgHref = imgHref;
    }

    public String getCHref() {
	return this.CHref;
    }

    public void setCHref(String CHref) {
	this.CHref = CHref;
    }

    public String getAHref() {
	return this.AHref;
    }

    public void setAHref(String AHref) {
	this.AHref = AHref;
    }

    public String getIsGetMsg() {
	return this.isGetMsg;
    }

    public void setIsGetMsg(String isGetMsg) {
	this.isGetMsg = isGetMsg;
    }

    public String getCreateTime() {
	return this.createTime;
    }

    public void setCreateTime(String createTime) {
	this.createTime = createTime;
    }

}

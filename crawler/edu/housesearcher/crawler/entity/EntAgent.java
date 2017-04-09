// default package
// Generated 2017-4-9 11:08:43 by Hibernate Tools 3.5.0.Final
package edu.housesearcher.crawler.entity;
/**
 * EntAgent generated by hbm2java
 */
public class EntAgent implements java.io.Serializable {

    private Integer dataId;
    private String AHref;
    private String name;
    private String phone;
    private String CHref;
    private String praiseRate;
    private String agentImg;
    private String isGetMsg;
    private String createTime;

    public EntAgent() {
    }

    public EntAgent(String AHref, String name, String phone, String CHref, String praiseRate, String agentImg,
	    String isGetMsg, String createTime) {
	this.AHref = AHref;
	this.name = name;
	this.phone = phone;
	this.CHref = CHref;
	this.praiseRate = praiseRate;
	this.agentImg = agentImg;
	this.isGetMsg = isGetMsg;
	this.createTime = createTime;
    }

    public Integer getDataId() {
	return this.dataId;
    }

    public void setDataId(Integer dataId) {
	this.dataId = dataId;
    }

    public String getAHref() {
	return this.AHref;
    }

    public void setAHref(String AHref) {
	this.AHref = AHref;
    }

    public String getName() {
	return this.name;
    }

    public void setName(String name) {
	this.name = name;
    }

    public String getPhone() {
	return this.phone;
    }

    public void setPhone(String phone) {
	this.phone = phone;
    }

    public String getCHref() {
	return this.CHref;
    }

    public void setCHref(String CHref) {
	this.CHref = CHref;
    }

    public String getPraiseRate() {
	return this.praiseRate;
    }

    public void setPraiseRate(String praiseRate) {
	this.praiseRate = praiseRate;
    }

    public String getAgentImg() {
	return this.agentImg;
    }

    public void setAgentImg(String agentImg) {
	this.agentImg = agentImg;
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

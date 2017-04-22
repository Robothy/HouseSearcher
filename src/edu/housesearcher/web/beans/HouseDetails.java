package edu.housesearcher.web.beans;

import java.util.List;


public class HouseDetails {
    List<String[]> images;
    String price; 
    String room;
    String hall;
    String area;
    String level;
    String orientation;
    String pubDate;
    String communityName;
    String communityHref;
    String addr;
    String agentHref;
    String agentImg;
    String longitude;
    String latitude;
    String agentName;
    String praiseRate;
    String agentPhone;
    String houseHref;
    String houseTitle;
    public String getOrientation() {
        return orientation;
    }
    public HouseDetails setOrientation(String orientation) {
        this.orientation = orientation;
        return this;
    }
    public String getPubDate() {
        return pubDate;
    }
    public HouseDetails setPubDate(String pubDate) {
        this.pubDate = pubDate;
        return this;
    }
    public String getCommunityName() {
        return communityName;
    }
    public HouseDetails setCommunityName(String communityName) {
        this.communityName = communityName;
        return this;
    }
    public String getCommunityHref() {
        return communityHref;
    }
    public HouseDetails setCommunityHref(String communityHref) {
        this.communityHref = communityHref;
        return this;
    }
    public String getAddr() {
        return addr;
    }
    public HouseDetails setAddr(String addr) {
        this.addr = addr;
        return this;
    }
    public String getHouseTitle() {
        return houseTitle;
    }
    public HouseDetails setHouseTitle(String houseTitle) {
        this.houseTitle = houseTitle;
        return this;
    }
    public String getHouseHref() {
        return houseHref;
    }
    public HouseDetails setHouseHref(String houseHref) {
        this.houseHref = houseHref;
        return this;
    }
    public String getAgentName() {
        return agentName;
    }
    public HouseDetails setAgentName(String agentName) {
        this.agentName = agentName;
        return this;
    }
    public String getPraiseRate() {
        return praiseRate;
    }
    public HouseDetails setPraiseRate(String praiseRate) {
        this.praiseRate = praiseRate;
        return this;
    }
    public String getAgentPhone() {
        return agentPhone;
    }
    public HouseDetails setAgentPhone(String agentPhone) {
        this.agentPhone = agentPhone;
        return this;
    }
    public List<String[]> getImages() {
        return images;
    }
    public HouseDetails setImages(List<String[]> images) {
        this.images = images;
        return this;
    }
    public String getPrice() {
        return price;
    }
    public HouseDetails setPrice(String price) {
        this.price = price;
        return this;
    }
    public String getRoom() {
        return room;
    }
    public HouseDetails setRoom(String room) {
        this.room = room;
        return this;
    }
    public String getHall() {
        return hall;
    }
    public HouseDetails setHall(String hall) {
        this.hall = hall;
        return this;
    }
    public String getArea() {
        return area;
    }
    public HouseDetails setArea(String area) {
        this.area = area;
        return this;
    }
    public String getLevel() {
        return level;
    }
    public HouseDetails setLevel(String level) {
        this.level = level;
        return this;
    }
    public String getAgentHref() {
        return agentHref;
    }
    public HouseDetails setAgentHref(String agentHref) {
        this.agentHref = agentHref;
        return this;
    }
    public String getAgentImg() {
        return agentImg;
    }
    public HouseDetails setAgentImg(String agentImg) {
        this.agentImg = agentImg;
        return this;
    }
    public String getLongitude() {
        return longitude;
    }
    public HouseDetails setLongitude(String longitude) {
        this.longitude = longitude;
        return this;
    }
    public String getLatitude() {
        return latitude;
    }
    public HouseDetails setLatitude(String latitude) {
        this.latitude = latitude;
        return this;
    }
    
}

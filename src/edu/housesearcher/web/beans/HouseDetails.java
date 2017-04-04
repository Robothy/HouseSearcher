package edu.housesearcher.web.beans;

import java.util.List;

import edu.housesearcher.crawler.entity.EntAgent;
import edu.housesearcher.crawler.entity.EntCommunity;
import edu.housesearcher.crawler.entity.EntHouse;

public class HouseDetails {
    List<String> images;
    EntHouse house;
    EntAgent agent;
    EntCommunity community;
    public List<String> getImages() {
        return images;
    }
    public void setImages(List<String> images) {
        this.images = images;
    }
    public EntHouse getHouse() {
        return house;
    }
    public void setHouse(EntHouse house) {
        this.house = house;
    }
    public EntAgent getAgent() {
        return agent;
    }
    public void setAgent(EntAgent agent) {
        this.agent = agent;
    }
    public EntCommunity getCommunity() {
        return community;
    }
    public void setCommunity(EntCommunity community) {
        this.community = community;
    }
    
}

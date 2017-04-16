package edu.housesearcher.web.dao;

import java.util.ArrayList;
import java.util.List;

import edu.housesearcher.crawler.entity.EntHouse;
import edu.housesearcher.web.beans.HouseListElement;

public class HouseListElementDao {
    
    public HouseListElement getHouseListElementByEntHouse(EntHouse house){
	return new HouseListElement(house);
    }
    
    public List<HouseListElement> getHouseListElementsByEntHouses(List<EntHouse> houses){
	List<HouseListElement> result = new ArrayList<>();
	for(EntHouse h: houses){
	    result.add(new HouseListElement(h));
	}
	return result;
    }
    
}

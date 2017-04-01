package edu.housesearcher.web.dao;

import edu.housesearcher.crawler.entity.EntHouse;
import edu.housesearcher.web.beans.HouseListElement;

public class HouseListElementDao {
    
    HouseListElement getHouseListElementByEntHouse(EntHouse house){
	return new HouseListElement(house);
    }
}

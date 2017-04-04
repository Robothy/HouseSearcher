package edu.housesearcher.web.dao;

import edu.housesearcher.crawler.entity.EntHouse;
import edu.housesearcher.crawler.utils.ICrawlerLogger;
import edu.housesearcher.web.beans.HouseDetails;

public interface IHouseDetailDao extends ICrawlerLogger {
    HouseDetails getInstanceByHouse(EntHouse house);
    HouseDetails getInstanceByHouseHref(String houseHref);
    HouseDetails getInstanceByHouseId(String houseId);
}

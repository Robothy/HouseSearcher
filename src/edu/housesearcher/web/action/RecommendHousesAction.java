package edu.housesearcher.web.action;

import java.util.List;

import com.opensymphony.xwork2.Action;

import edu.housesearcher.crawler.entity.EntHouse;
import edu.housesearcher.web.beans.HouseListElement;
import edu.housesearcher.web.dao.EntHouseDao;
import edu.housesearcher.web.dao.HouseListElementDao;

public class RecommendHousesAction implements Action {

    private EntHouseDao houseDao = null;
    private HouseListElementDao houseListElementDao = null;
    private List<HouseListElement> responseHouses = null;	//房屋列表
    private Integer responseCode = 0;	//状态码 0 表示查询失败，1表示查询成功
    private Integer requestHouseFirst = 0;	//分页的起始 index
    private Integer requestHousesNumber = 0;	//请求的房屋的数量
    
    
    public EntHouseDao getHouseDao() {
        return houseDao;
    }

    public void setHouseDao(EntHouseDao houseDao) {
        this.houseDao = houseDao;
    }

    public HouseListElementDao getHouseListElementDao() {
        return houseListElementDao;
    }

    public void setHouseListElementDao(HouseListElementDao houseListElementDao) {
        this.houseListElementDao = houseListElementDao;
    }

    public Integer getResponseCode() {
        return responseCode;
    }

    public void setResponseCode(Integer responseCode) {
        this.responseCode = responseCode;
    }

    public List<HouseListElement> getResponseHouses() {
        return responseHouses;
    }

    public void setResponseHouses(List<HouseListElement> responseHouses) {
        this.responseHouses = responseHouses;
    }

    public Integer getRequestHouseFirst() {
        return requestHouseFirst;
    }

    public void setRequestHouseFirst(Integer requestHouseFirst) {
        this.requestHouseFirst = requestHouseFirst;
    }

    public Integer getRequestHousesNumber() {
        return requestHousesNumber;
    }

    public void setRequestHousesNumber(Integer requestHousesNumber) {
        this.requestHousesNumber = requestHousesNumber;
    }

    @Override
    public String execute() throws Exception {
	
	if(houseDao==null){
	    houseDao = new EntHouseDao();
	}
	
	if(houseListElementDao==null){
	    houseListElementDao = new HouseListElementDao();
	}
	
	List<EntHouse> houses =  houseDao.getHouses(requestHouseFirst, requestHousesNumber);
	responseCode = (responseHouses =  houseListElementDao.getHouseListElementsByEntHouses(houses))
		==null?0:1;
	
	return SUCCESS;
    }

}

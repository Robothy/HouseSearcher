package edu.housesearcher.web.action;

import com.opensymphony.xwork2.Action;

import edu.housesearcher.web.beans.HouseListElement;

public class RecommendHousesAction implements Action {

    private HouseListElement responseHouses = null;	//房屋列表
    private Integer requestHouseFirst = 0;	//分页的起始 index
    private Integer requestHousesNumber = 0;	//请求的房屋的数量
    
    public HouseListElement getResponseHouses() {
        return responseHouses;
    }

    public void setResponseHouses(HouseListElement responseHouses) {
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
	
	return null;
    }

}

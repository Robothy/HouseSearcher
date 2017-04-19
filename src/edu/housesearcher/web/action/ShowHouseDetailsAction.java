package edu.housesearcher.web.action;

import com.opensymphony.xwork2.Action;

import edu.housesearcher.web.beans.HouseDetails;
import edu.housesearcher.web.dao.HouseDetailDaoImpl;
import edu.housesearcher.web.dao.IHouseDetailDao;

public class ShowHouseDetailsAction implements Action {

    private IHouseDetailDao houseDetailDao = null;
    
    private String houseHref = "";
    
    private HouseDetails houseDetails = null;
   
    public void setHouseHref(String houseHref){
	this.houseHref = houseHref;
    }
    
    
    public HouseDetails getHouseDetails() {
        return houseDetails;
    }

    public void setHouseDetailDao(HouseDetailDaoImpl houseDetailDaoImpl){
	this.houseDetailDao = houseDetailDaoImpl;
    }
    
    @Override
    public String execute() throws Exception {
	houseDetailDao = new HouseDetailDaoImpl();
	if(houseHref==null||houseHref.contentEquals("")){
	    return NONE;
	}else{
	    houseDetails = houseDetailDao.getInstanceByHouseHref(houseHref);
	}
	
	if (houseDetails==null) {//页面验证无效（可能已经下架，也可能由于其他原因）
	    return ERROR;
	}
	
	return SUCCESS;
    }
}

package edu.housesearcher.web.action;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.*;

import edu.housesearcher.crawler.entity.EntHouse;
import edu.housesearcher.crawler.utils.HibernateUtil;
import edu.housesearcher.web.beans.HouseListElement;

/**
 * @功能 搜索房屋信息动作
 * 
 */
public class SearchHouseAction implements Action  {
    
    private List<HouseListElement> houses = null;
    private String searchResult = SUCCESS;//查询结果
    private Integer responseCode ;
    public String getSearchResult() {
        return searchResult;
    }

    public void setSearchResult(String searchResult) {
        this.searchResult = searchResult;
    }

    public Integer getResponseCode() {
        return responseCode;
    }

    public void setResponseCode(Integer responseCode) {
        this.responseCode = responseCode;
    }

    public Integer getBeginIndex() {
        return beginIndex;
    }

    public void setBeginIndex(Integer beginIndex) {
        this.beginIndex = beginIndex;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    private Integer beginIndex;
    private Integer number;
    
    
    @Override
    public String execute() throws Exception {
	executeSearch();
	System.out.println("execute");
	return SUCCESS;
    }
    
    /**
     * 执行搜索，推荐入口之一
     */
    @SuppressWarnings("unchecked")
    private void executeSearch(){
	houses = new ArrayList<HouseListElement>();
	Session session = HibernateUtil.getSession();
	Transaction transaction = session.beginTransaction();
	Query query = session.createQuery("from EntHouse where is_get_msg = 'Y'");
	query.setFirstResult(beginIndex);
	query.setMaxResults(number);
	List<EntHouse> queryResults = null;
	try {
	    queryResults = query.list();
	    transaction.commit();
	    responseCode=1;
	} catch (Exception e) {
	    responseCode=0;
	}finally {
	    session.close();
	}
	
	if(queryResults!=null)
	    for(EntHouse h : queryResults){
		houses.add(new HouseListElement((EntHouse)h));
	    }
	
    }
    
    public List<HouseListElement> getHouses() {
	return houses;
    }
    
    public void setHouses(List<HouseListElement> houses) {
	this.houses = houses;
    }
    
}

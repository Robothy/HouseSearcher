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
    
    @Override
    public String execute() throws Exception {
	executeSearch();
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
	query.setFirstResult(1);
	query.setMaxResults(20);
	List<EntHouse> queryResults = null;
	try {
	    queryResults = query.list();
	    transaction.commit();
	} catch (Exception e) {
	    searchResult = "none";
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

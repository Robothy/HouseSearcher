package edu.housesearcher.web.action;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.*;

import edu.housesearcher.crawler.entity.EntHouse;
import edu.housesearcher.crawler.utils.HibernateUtil;

/**
 * @功能 搜索房屋信息动作
 * 
 */
public class SearchHouseAction implements Action  {

    private List<EntHouse> houses = null;
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
	Session session = HibernateUtil.getSession();
	Transaction transaction = session.beginTransaction();
	Query query = session.createQuery("from EntHouse");
	query.setFirstResult(5);
	query.setMaxResults(20);	
	try {
	    houses = query.list();
	    transaction.commit();
	} catch (Exception e) {
	    searchResult = NONE;
	}finally {
	    session.close();
	}
    }
    
    public List<EntHouse> getHouses() {
        return houses;
    }

    public void setHouses(List<EntHouse> houses) {
        this.houses = houses;
    }
    
}

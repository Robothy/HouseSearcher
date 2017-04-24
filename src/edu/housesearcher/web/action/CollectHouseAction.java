package edu.housesearcher.web.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.Action;

import edu.housesearcher.crawler.entity.EntUser;
import edu.housesearcher.crawler.entity.UserCollectHouse;
import edu.housesearcher.crawler.utils.DateTimeUtil;
import edu.housesearcher.crawler.utils.HibernateUtil;

public class CollectHouseAction implements Action, SessionAware {

    Map<String, Object> session;
    
    private Integer responseCode;
    private EntUser user = null;
    private String houseHref;
    
    public Integer getResponseCode() {
        return responseCode;
    }

    public void setResponseCode(Integer responseCode) {
        this.responseCode = responseCode;
    }

    public EntUser getUser() {
        return user;
    }

    public void setUser(EntUser user) {
        this.user = user;
    }

    public String getHouseHref() {
        return houseHref;
    }

    public void setHouseHref(String houseHref) {
        this.houseHref = houseHref;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    @Override
    public String execute() throws Exception {
	return null;
    }
    
    /**
     * responseCode
     *  0 已收藏
     *  1 收藏成功
     *  2 用户未登录
     *  3 系统错误
     * @return
     */
    public String collect(){//收藏 action
	this.user = (EntUser)session.get("user");
	if(this.user == null){
	    responseCode = 2;//用户未登录
	}else{
	    String telephone = user.getTelephone();
	    Session hbSession = HibernateUtil.getCurrentSession();
	    String hql = "from UserCollectHouse where houseHref = '"+houseHref+"' and telephone='"+telephone+"'";
	    Transaction transaction = hbSession.beginTransaction();
	    try{
		Query query = hbSession.createQuery(hql);
		if(query.list().size()>0){
		    responseCode = 0;//已收藏
		}else{
		    hbSession.saveOrUpdate(new UserCollectHouse(telephone, houseHref, DateTimeUtil.getNowAsString()));
		    responseCode = 1;
		}
		transaction.commit();
	    }catch(Exception e){
		responseCode = 3; //系统错误
		e.printStackTrace();
	    }finally {
		hbSession.close();
	    }
	}
	return SUCCESS;
    }
    
    /**
     * responseCode 
     * 	0 未收藏
     *  1 取消收藏成功
     * 	2 用户未登录
     *  3 系统错误
     * @return
     */
    public String delete(){//取消收藏action
	this.user = (EntUser)session.get("user");
	if(this.user==null){
	    responseCode=2;//用户未登录
	}else{
	    String telephone = user.getTelephone();
	    Session hbSession = HibernateUtil.getCurrentSession();
	    String hql = "from UserCollectHouse where houseHref = '"+houseHref+"' and telephone='"+telephone+"'";
	    Transaction transaction = hbSession.beginTransaction();
	    try{
		Query query = hbSession.createQuery(hql);
		if(query.list().size()<0){
		    responseCode = 0;//未收藏
		}else{
		    UserCollectHouse userCollectHouse = (UserCollectHouse)query.list().get(0);
		    hbSession.delete(userCollectHouse);
		    responseCode = 1;//取消收藏成功
		}
		transaction.commit();
	    }catch(Exception e){
		responseCode = 3; //系统错误
		e.printStackTrace();
	    }finally {
		hbSession.close();
	    }
	}
	return SUCCESS;
    }

    @Override
    public void setSession(Map<String, Object> arg0) {
	this.session = arg0;
    }

}

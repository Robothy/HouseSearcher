package edu.housesearcher.web.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.Action;

import edu.housesearcher.crawler.entity.EntUser;
import edu.housesearcher.crawler.utils.HibernateUtil;
import edu.housesearcher.web.dao.UserDao;

public class LoginAction implements Action, SessionAware {

    private String phone;
    private String pwd;
    private EntUser user;
    private Integer responseCode=0;
    private Map<String, Object> session;
    private UserDao userDao;
    
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public Integer getResponseCode() {
        return responseCode;
    }

    public void setResponseCode(Integer responseCode) {
        this.responseCode = responseCode;
    }

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    @Override
    public String execute() throws Exception {
	if(userDao==null){
	    userDao = new UserDao();
	}
	
	Session hbSession = HibernateUtil.getSession();
	try {
	    Transaction transaction = hbSession.beginTransaction();
	    Criteria criteria = hbSession.createCriteria(EntUser.class);
	    criteria.add(Restrictions.eq("telephone", phone));
	    criteria.add(Restrictions.eq("pwd", pwd));
	    List<EntUser> users = criteria.list();
	    if(users.size()!=1){
		responseCode = 0;
	    }else{
		user = (EntUser)users.get(0);
		session.put("user", user);//创建会话
		
		responseCode = 1;
	    }
	    transaction.commit();
	}catch(Exception e){
	    responseCode = 0;
	} finally {
	    hbSession.close();
	}
	
	return SUCCESS;
    }
    
    /**
     * 检查用户session是否存在
     * @return
     */
    public String checkSession(){
	this.user = (EntUser)this.session.get("user");
	this.responseCode = user == null ? 0:1;
	return SUCCESS;
    }
    
    public EntUser getUser() {
        return user;
    }

    public void setUser(EntUser user) {
        this.user = user;
    }

    public String logout(){
	session.remove("user");
	responseCode = 1;
	return SUCCESS;
    }

    @Override
    public void setSession(Map<String, Object> arg0) {
	this.session=arg0;
    }

}

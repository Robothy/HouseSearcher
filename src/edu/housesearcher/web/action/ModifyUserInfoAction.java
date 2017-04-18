package edu.housesearcher.web.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.Action;

import edu.housesearcher.crawler.entity.EntUser;
import edu.housesearcher.crawler.utils.DateTimeUtil;
import edu.housesearcher.crawler.utils.HibernateUtil;

public class ModifyUserInfoAction implements Action,SessionAware {

    private String firstName;
    private String nickName;
    private String pwd;
    private Map<String, Object> session;
    private Integer responseCode = 0 ;
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
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

    public Map<String, Object> getSession() {
        return session;
    }

    @Override
    public String execute() throws Exception {
	//验证session是否存在
	EntUser user = (EntUser) session.get("user");
	if(user==null){
	    responseCode = 0;
	}else{
	    user.setCreateTime(DateTimeUtil.getNowAsString());
	    user.setFirstName(firstName);
	    user.setNickName(nickName);
	    user.setPwd(pwd);
	    Session hbSession = HibernateUtil.getSession();
	    try{
		Transaction transaction = hbSession.beginTransaction();
		hbSession.saveOrUpdate(user);
		transaction.commit();
		responseCode = 1;
	    }catch(Exception e){
		e.printStackTrace();
		responseCode = 0;
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

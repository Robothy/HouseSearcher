package edu.housesearcher.web.action;

import com.opensymphony.xwork2.Action;

import edu.housesearcher.crawler.entity.EntUser;
import edu.housesearcher.web.dao.UserDao;

public class RegisterAction implements Action {

    private UserDao userDao;
    private String phone;
    private String pwd;
    private String result;
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
    
    public String getResult() {
        return result;
    }
    public void setResult(String result) {
        this.result = result;
    }
    
    @Override
    public String execute() throws Exception {
	if(userDao==null){
	    userDao = new UserDao();
	}
	
	UserDao userDao = new UserDao();
	if(userDao.find(phone)==null){//可以注册
	    userDao.save(new EntUser(phone, pwd));
	    setResult("1");
	}else{
	    setResult("0");//用户已存在
	}
	
	return SUCCESS;
    }
    
    /**
     * 检查是否存在相同的用户
     * @return
     */
    public String check(){
	if(userDao==null){
	    userDao = new UserDao();
	}
	if(userDao.find(phone)==null){
	    this.setResult("1");
	}else {
	    this.setResult("0");
	}
	return SUCCESS;
    }

}

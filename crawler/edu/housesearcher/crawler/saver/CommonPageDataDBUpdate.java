package edu.housesearcher.crawler.saver;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import edu.housesearcher.crawler.utils.HibernateUtil;

public class CommonPageDataDBUpdate implements IPageDataSaver {

    private String persistenceName ;

    private Integer maxUpdateRows = 1;
    
    public String getPersistenceName() {
        return persistenceName;
    }



    public void setPersistenceName(String persistenceName) {
        this.persistenceName = persistenceName;
    }



    public Integer getMaxUpdateRows() {
        return maxUpdateRows;
    }



    public void setMaxUpdateRows(Integer maxUpdateRows) {
        this.maxUpdateRows = maxUpdateRows;
    }


    private Map<String, String> restrictions;
    
    /**
     * 
     * @param persistenceName 持久化类名称
     */
    public CommonPageDataDBUpdate(String persistenceName) {
	this.persistenceName = persistenceName;
    }
    
    
    
    @Override
    public void doSave(Map<String, String> data) {
	if(data==null){
	    CRAWLER_LOGGER.debug("数据为空。");
	    return;
	}
	String restrictionString = genHqlRestrictionString();
	String dataString = genHqlDataString(data);
	
	Session session = HibernateUtil.getSession();
	Transaction transaction = session.beginTransaction();
	String hql = "from " + this.persistenceName + restrictionString;
	Query query = session.createQuery(hql);
	if(query.list().size()>=maxUpdateRows){
	    CRAWLER_LOGGER.warn("将更新超过 " + maxUpdateRows + " 条数据， 操作跳过！您可以通过设置 maxUpdateRows（default value: 1）来使程序运行下去 ");
	    transaction.commit();
	    session.close();
	    return;
	}
	
	hql = "update " + this.persistenceName + " set " + dataString + restrictionString;
	Query update = session.createQuery(hql);
	Integer updateRowNum = update.executeUpdate(); 
	if(updateRowNum<1){
	    CRAWLER_LOGGER.warn("未能更新数据！");
	}else {
	    CRAWLER_LOGGER.debug("成功更新了" + updateRowNum + "条数据");
	}
	
	transaction.commit();
	session.close();
    }

    @Override
    public void doSave(List<Map<String, String>> datas) {
	for(Map<String, String> data : datas){
	    this.doSave(data);
	}
    }

    
    
    private String genHqlDataString(Map<String, String> data){
	String hqlDataString=" ";
	for(Entry<String, String> entry : data.entrySet()){
	    hqlDataString += entry.getKey() + " = '" + entry.getValue() + "', ";
	}
	hqlDataString = hqlDataString.replaceAll(", $", "");
	return hqlDataString;
    }
    
    /**
     * 生成约束条件字符串
     * @return
     */
    private String genHqlRestrictionString(){
	String hqlRestrictionString = "";
	if(this.restrictions!=null)
	for(Entry<String, String> restrict : this.restrictions.entrySet()){
	    hqlRestrictionString += restrict.getKey() + " = '" + restrict.getValue() +"' and ";
	}
	hqlRestrictionString = hqlRestrictionString.replaceAll("and $", "");
	if(hqlRestrictionString.length()>1){	//存在约束条件则 在约束条件前面加上 where 关键字
	    hqlRestrictionString = " where " + hqlRestrictionString;
	}
	return hqlRestrictionString;
    }
    
    

    public Map<String, String> getRestrictions() {
        return restrictions;
    }


    public void setRestrictions(Map<String, String> restrictions) {
        this.restrictions = restrictions;
    }

}

package edu.housesearcher.crawler.saver;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import edu.housesearcher.crawler.utils.HibernateUtil;

public class CommonPageDataDBSave implements IPageDataSaver {
    
    /**
     * 除主键之外受唯一性约束的列, 列名应对应 hibernate persistence 字段名
     */
    private List<String> uniqueColumns = null;
    
    public List<String> getUniqueColumns() {
        return uniqueColumns;
    }

    public void setUniqueColumns(List<String> uniqueColumns) {
        this.uniqueColumns = uniqueColumns;
    }

    private Class<?> persistenceClass ;
    
    public CommonPageDataDBSave(Class<?> persistenceClass) {
	this.persistenceClass = persistenceClass;
    }

    @Override
    public void doSave(Map<String, String> data) {
	if(this.persistenceClass==null){
	    CRAWLER_LOGGER.error("Class 对象为空,不能获取其内部的方法!");
	    return;
	}
	
	/**
	 * 尝试获取持久化类对象
	 */
	Object persistenceObject = null;
	
	try {
	    persistenceObject = persistenceClass.newInstance();
	    CRAWLER_LOGGER.debug("成功获取到 " + persistenceClass + " 对象！");
	} catch (InstantiationException | IllegalAccessException e) {
	    CRAWLER_LOGGER.error("尝试获取 " + persistenceClass + " 对象失败！");
	    e.printStackTrace();
	    return;
	}
	
	/**
	 * 尝试获取其中的方法并设置值
	 */
	Method[] methods = persistenceClass.getMethods();
	Map<Method, String> methodAndName = new HashMap<Method,String>(); //保存 persistence class 中的所有setter方法
	for(Method method : methods){
	    String methodName = method.getName();
	    if(methodName.startsWith("set")) {
		methodAndName.put(method, methodName);
	    }
	}
	
	/**
	 * 将数据放入 Persistence 对象中
	 */
	for(Entry<Method, String> entry : methodAndName.entrySet()){
	    String fieldName = entry.getValue().substring(3);
	    String fieldValue = data.get(fieldName);
	    Method method = entry.getKey();
	    try {
		method.invoke(persistenceObject, fieldValue);
	    } catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
		CRAWLER_LOGGER.error("尝试调用 " + persistenceClass + " 中的 " + entry.getValue() + " 方法失败！");
		e.printStackTrace();
		continue;
	    }
	}

	/**
	 * 调用 hibernate 事务API，存储数据
	 */
	Session session = HibernateUtil.getCurrentSession();
	Transaction transaction = session.beginTransaction();
	
	session.saveOrUpdate(persistenceObject);
	
	transaction.commit();
	session.close();
    }

    @Override
    public void doSave(List<Map<String, String>> datas) {
	/**
	 * 检查传入的 data 条目数是否为 0 ，若为 0 则不继续往下运行
	 */
	if(datas.size()==0){
	    CRAWLER_LOGGER.debug("包含的数据条目数为 0 ！");
	    return;
	}

	/**
	 * 检查持久化类是否为空，若为空，则不能继续往下进行
	 */
	if(this.persistenceClass==null){
	    CRAWLER_LOGGER.error("Class 对象为空,不能获取其内部的方法!");
	    return;
	}
	
	/**
	 * 尝试获取其中的方法并设置值
	 */
	Method[] methods = persistenceClass.getMethods();
	Map<Method, String> methodAndName = new HashMap<Method,String>(); //保存 persistence class 中的所有setter方法
	for(Method method : methods){
	    String methodName = method.getName();
	    if(methodName.startsWith("set")) {
		methodAndName.put(method, methodName);
	    }
	}
	
	/**
	 * 一组持久化类的对象，每一个对象对应一条数据
	 */
	List<Object> persistenceObjects = new ArrayList<Object>(); 

	/**
	 * 遍历的数据条目，并将每一条数据放入到一个持久化对象当中
	 */
	for(Map<String, String> data : datas){
	    
	    /**
	     * 获取持久化对象
	     */
	    Object object = null;
	    try{
		object = persistenceClass.newInstance();
		CRAWLER_LOGGER.debug("成功获取到 " + persistenceClass + " 对象！");
	    }catch(InstantiationException | IllegalAccessException e){
		CRAWLER_LOGGER.error("尝试获取 " + persistenceClass + " 对象失败！");
		e.printStackTrace();
		continue;
	    }
	    
	    /**
	     * 将各个数据放入持久化对象中
	     */
	    for(Entry<Method, String> entry : methodAndName.entrySet()){
		String fieldName = entry.getValue().substring(3);
		String fieldValue = data.get(fieldName);
		Method method = entry.getKey();
		try {
		    method.invoke(object, fieldValue);
		}catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
		    CRAWLER_LOGGER.error("尝试调用 " + persistenceClass + " 中的 " + entry.getValue() + " 方法失败！");
		    e.printStackTrace();
		    continue;
		}
	    }
	    
	    persistenceObjects.add(object);
	}
	
	/**
	 * 调用 hibernate 事务API，存储数据
	 */
	for(Object object : persistenceObjects){
	    Session session = HibernateUtil.getSession();
	    try{
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(object);
		transaction.commit();
	    }catch(Exception e){			//这里的异常将很容易出现，大多数情况是由于 唯一性约束引起的
		CRAWLER_LOGGER.debug("异常： " + e );	//为了保证程序的正常运行，因而将每一条数据的保存都当成一个事务
		continue;				//这部分代码应该修改一下，以提高效率，不过目前没有想到好的办法
	    }finally {
		session.close();
	    }
	}
	datas.clear();
    }

    //判断该行数据是否已存在
    private Boolean isExistsRow(Map<String, String> persistenceData){
	Boolean result = false;
	Session session = HibernateUtil.getSession();
	Transaction transaction = session.beginTransaction();
	String hql = "from" + persistenceClass.getName() + "where ";
	for(String uniqueColumn : this.uniqueColumns){
	    hql+= uniqueColumn + " = '" + persistenceData.get(uniqueColumn) + "' and "; 
	}
	hql = hql.replaceAll("and $", hql);//去除末尾的and
	Integer number = session.createQuery(hql).list().size();
	if(number.intValue() > 0){//已经存在
	    result = true;
	}
	transaction.commit();
	session.close();
	return false;
    }
    
    
}

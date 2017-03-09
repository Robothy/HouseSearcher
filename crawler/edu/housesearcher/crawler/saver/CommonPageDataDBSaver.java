package edu.housesearcher.crawler.saver;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import edu.housesearcher.crawler.utils.DeepCloner;
import edu.housesearcher.crawler.utils.HibernateUtil;

public class CommonPageDataDBSaver implements IPageDataSaver {
    private Class<?> persistenceClass ;
    
    public CommonPageDataDBSaver(Class<?> persistenceClass) {
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
	Session session = HibernateUtil.getSession();
	Transaction transaction = session.beginTransaction();
	for(Object object : persistenceObjects)
	session.saveOrUpdate(object);
	transaction.commit();
	session.close();
	datas.clear();
    }
    
}

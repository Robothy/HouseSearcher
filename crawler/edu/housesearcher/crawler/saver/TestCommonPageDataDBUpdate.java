package edu.housesearcher.crawler.saver;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

public class TestCommonPageDataDBUpdate {
    
    public static void main(String[] args){
	(new TestCommonPageDataDBUpdate()).test2017040302();;
    }
    
    /**
     * 正常流程测试
     */
    public void test2017040301(){
	CommonPageDataDBUpdate commonPageDataDBUpdate =  new CommonPageDataDBUpdate("EntCommunity");
	
	Map<String, String> data = new HashMap<String, String>();
	data.put("CName", "去去去去去去去");
	
	Map<String, String> restrictions = new HashMap<String, String>();
	restrictions.put("CHref", "abc");
	commonPageDataDBUpdate.setRestrictions(restrictions);
	commonPageDataDBUpdate.doSave(data);
    }
    
    /**
     * 不设置约束条件，测试更新条数超过 maxUpdataRows
     */
    public void test2017040302(){
	CommonPageDataDBUpdate commonPageDataDBUpdate =  new CommonPageDataDBUpdate("EntCommunity");
	
	Map<String, String> data = new HashMap<String, String>();
	data.put("CName", "去去去去去去去");
	
	Map<String, String> restrictions = new HashMap<String, String>();
	restrictions.put("CHref", "abc");
	//commonPageDataDBUpdate.setRestrictions(restrictions);
	commonPageDataDBUpdate.doSave(data);
    }
    
    /**
     * 不设置约束条件，测试更新条数超过1，但不超过 maxUpdataRows
     */
    @Test
    public void test2017040303(){
	CommonPageDataDBUpdate commonPageDataDBUpdate =  new CommonPageDataDBUpdate("EntCommunity");
	
	Map<String, String> data = new HashMap<String, String>();
	data.put("CName", "去去去去去去去");
	
	Map<String, String> restrictions = new HashMap<String, String>();
	restrictions.put("CHref", "abc");
	//commonPageDataDBUpdate.setRestrictions(restrictions);
	commonPageDataDBUpdate.setMaxUpdateRows(3);//设置maxUpdateRows
	commonPageDataDBUpdate.doSave(data);
    }
    
}

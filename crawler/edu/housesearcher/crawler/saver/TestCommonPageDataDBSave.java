package edu.housesearcher.crawler.saver;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.MailcapCommandMap;

import org.junit.Test;

import edu.housesearcher.crawler.entity.EntCommunity;

public class TestCommonPageDataDBSave {

    public static void main(String[] args) {
	
    }
    
    @Test
    public void test2017040201(){
	List<Map<String,String>> datas = new ArrayList<Map<String,String>>() ;
	Map<String, String> data = new HashMap<String, String>();
	Map<String, String> data2 = new HashMap<String, String>();
	data.put("CHref", "abc");
	data2.put("CHref","cef");
	datas.add(data);
	datas.add(data);
	datas.add(data);
	datas.add(data);
	datas.add(data2);
	IPageDataSaver saver = new CommonPageDataDBSave(EntCommunity.class);
	saver.doSave(datas);
    }

}

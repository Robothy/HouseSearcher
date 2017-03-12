package edu.housesearcher.crawler.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;

public class DateTimeUtil {
    /**
     * @说明
     * G 年代标志符
     * y 年
     * M 月
     * d 日
     * h 时 在上午或下午 (1~12)
     * H 时 在一天中 (0~23)
     * m 分
     * s 秒
     * S 毫秒
     * E 星期
     * D 一年中的第几天
     * F 一月中第几个星期几
     * w 一年中第几个星期
     * W 一月中第几个星期
     * a 上午 / 下午 标记符 
     * k 时 在一天中 (1~24)
     * K 时 在上午或下午 (0~11)z 时区
     * @param pattern 标识符
     * @return
     */
    public static String getNowAsString(String pattern){
	SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
	Date date = new Date();
	return dateFormat.format(date);
    }
    
    public static String getTodayAsString(){
	return (new SimpleDateFormat("yyyy-MM-dd")).format(new Date());
    }
    
    public static String getNowAsString(){
	return (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
    }
    
    @Test
    public void test2017031201(){
	System.out.println(DateTimeUtil.getNowAsString());
	System.out.println(DateTimeUtil.getTodayAsString());
	System.out.println(DateTimeUtil.getNowAsString("yyyyMMdd HH mm ss SSS"));
    }
    
}

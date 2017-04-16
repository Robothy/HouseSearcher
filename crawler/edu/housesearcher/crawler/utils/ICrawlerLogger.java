package edu.housesearcher.crawler.utils;

import java.io.Serializable;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

/**
 * @工具类 提供log4j 的 logger 对象,若要写日志，需要实现此接口，或者引用其中的logger
 * @author robothy
 *
 */
public interface ICrawlerLogger extends Serializable {
    public static final Logger CRAWLER_LOGGER = LogManager.getLogger("crawlerLogger");
    
    public static void debug(Object message){
	LogManager.getLogger("crawlerLogger").debug(message);
    }
    
    public static void debug(Object message,Throwable throwable){
	LogManager.getLogger("crawlerLogger").debug(message,throwable);
    }
    
    public static void info(Object message){
	LogManager.getLogger("crawlerLogger").info(message);
    }
    
    public static void info(Object message,Throwable throwable){
	LogManager.getLogger("crawlerLogger").info(message,throwable);
    }
    
    public static void error(Object message){
	LogManager.getLogger("crawlerLogger").error(message);
    }
    
    public static void error(Object message,Throwable throwable){
	LogManager.getLogger("crawlerLogger").error(message,throwable);
    }
    
    
}

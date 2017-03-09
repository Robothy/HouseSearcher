package edu.housesearcher.crawler.saver;

import java.util.List;
import java.util.Map;

import edu.housesearcher.crawler.utils.ICrawlerLogger;

/**
 * @接口 页面数据保存接口
 * 
 * @父接口	ICrawlerLogger	用于日志记录
 * 
 * @author robothy
 *
 */
public interface IPageDataSaver extends ICrawlerLogger {
    /**
     * 保存页面的数据
     */
    void doSave(Map<String, String> data);
    void doSave(List<Map<String, String>> datas);
}

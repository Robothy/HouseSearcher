package edu.housesearcher.crawler.parser;

import java.util.Map;

import org.jsoup.nodes.Document;

import edu.housesearcher.crawler.utils.ICrawlerLogger;
/**
 * @接口 页面解析接口，提供页面的解析方法
 * 
 * @父接口 ICrewlerLogger 用于日志的记录
 * 
 * @author 罗福享
 *
 */
public interface IWebPageParser extends ICrawlerLogger {
    Map<String, String> doParse(final Document document);
}

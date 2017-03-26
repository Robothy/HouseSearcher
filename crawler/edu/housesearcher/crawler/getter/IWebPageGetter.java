package edu.housesearcher.crawler.getter;

import org.jsoup.nodes.Document;

import edu.housesearcher.crawler.utils.ICrawlerLogger;

/**
 * @接口 提供获取页面的方法。
 * 
 * @父接口	ICrawlerLogger	日志记录
 * 
 * @author 罗福享
 * 
 */
public interface IWebPageGetter extends ICrawlerLogger {
    
    /**
     * @param href 页面的完整链接（带有 http 或 https开头）
     * 
     * @return 返货获取到的页面对象。若获取到的页面不符合要求，或者为404页面，则应该返回 null
     */
    Document doGet(String href);
    
    
    /**
     * @功能 检查页面是否符合规范。即在成功获取到页面的前提下，判断页面是否为预期的格式。
     * 
     * @注意 实现本方法的时候只需要判断获取到的页面是否为有效页面（即超文本是为预期格式，且包含有效数据）。
     * 
     * @return true 页面符合规范； false 页面不符合规范
     */
    Boolean isValidPage(Document document);
    
}

package edu.housesearcher.crawler.hrefprovider;

import java.io.Serializable;

import edu.housesearcher.crawler.utils.ICrawlerLogger;

/**
 * @接口 要抓取的页面的链接提供接口，所提供的链接应为带有 http获取https开头的完整链接
 * 
 * @父接口	Serializable	序列化接口
 * 		ICrawlerLogger	日志记录接口
 * @author robothy
 *
 */
public interface IHrefProvider extends Serializable,ICrawlerLogger {
    /**
     * @功能 获取一组URL
     * @param num 要获取的URL的数量
     * @return 获取到的HREFs
     */
    public String[] getHrefs(int num);
    
    /**
     * @功能 获取一条href
     * @return 获取到的HREF
     */
    public String getHref();
}

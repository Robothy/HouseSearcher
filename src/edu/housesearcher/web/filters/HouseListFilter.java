package edu.housesearcher.web.filters;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.HttpJspPage;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import edu.housesearcher.crawler.entity.EntHouse;
import edu.housesearcher.crawler.utils.HibernateUtil;
import edu.housesearcher.crawler.utils.ICrawlerLogger;
import edu.housesearcher.web.beans.HouseListElement;

/**
 * Servlet Filter implementation class IndexPageFilter
 */
@WebFilter("/pages/house-list.jsp")
public class HouseListFilter implements Filter,ICrawlerLogger {
    
    /**
     * Default constructor. 
     */
    public HouseListFilter() {
    }
    
    /**
     * @see Filter#destroy()
     */
    public void destroy() {
    }
    
    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    @SuppressWarnings("unchecked")
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	String searchResult = "success";
	List<HouseListElement> houses = (List<HouseListElement>)(request.getAttribute("houses"));
	/**
	 * 系统检索出的条目数为null或0, 系统自动推荐结果。
	 */
	if(houses==null||houses.size()==0){
	    houses = new ArrayList<HouseListElement>();
	    CRAWLER_LOGGER.debug("过滤器未能检测到 houses 对象， 执行自动赋值。");
	    Session session = HibernateUtil.getSession();
	    Transaction transaction = session.beginTransaction();
	    Query query = session.createQuery("from EntHouse where is_get_msg = 'Y'");
	    query.setFirstResult(1);
	    query.setMaxResults(20);
	    List<EntHouse> queryResults = null;
	    try {
		queryResults = query.list();
		transaction.commit();
	    } catch (Exception e) {
		searchResult = "none";
	    }finally {
		session.close();
	    }
	    
	    if(queryResults!=null)
	    for(EntHouse h : queryResults){
		houses.add(new HouseListElement((EntHouse)h));
	    }
	    
	    request.setAttribute("searchResult", searchResult);
	    request.setAttribute("houses", houses);
	}
	// pass the request along the filter chain
	chain.doFilter(request, response);
    }
    
    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException {
    }
    
}

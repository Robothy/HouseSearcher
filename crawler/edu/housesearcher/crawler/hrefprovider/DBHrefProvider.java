package edu.housesearcher.crawler.hrefprovider;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import edu.housesearcher.crawler.utils.HibernateUtil;

public class DBHrefProvider implements IHrefProvider {

    private static final long serialVersionUID = 1L;

    /**
     * 持久化类名称
     */
    private String persistence;
    
    /**
     * 包含Href的字段
     */
    private String field;
    
    /**
     * 是否继续生成 href 标志变量。 true 表示继续生成； false 表示停止生成。
     */
    private Boolean isContinueProvide = true;

    /**
     * 用来统计查询结果的数量
     */
    private Integer count = 1;
    

    public DBHrefProvider(String persistence,String field) {
	this.persistence = persistence;
	this.field = field;
    }
    
    @Override
    public synchronized String[] getHrefs(int num) {
	Session session = HibernateUtil.getCurrentSession();
	Transaction transaction = session.beginTransaction();
	String hql = "select "+ field +" from " + persistence + " where isGetMsg =:isGetMsg";
	Query query = session.createQuery(hql);
	query.setParameter("isGetMsg", "N");
	query.setFirstResult(count);
	query.setMaxResults(num);
	List<Object> hrefs = query.list();
	String[] result = new String[hrefs.size()];
	for(int i=0; i<hrefs.size(); i++){
	    result[i] = hrefs.get(i).toString();
	}
	transaction.commit();
	count+=num;
	if(hrefs.size()<num) setIsContinueProvide(false);
	return result;
    }

    @Override
    public String getHref() {
	return null;
    }
    
    public Boolean getIsContinueProvide() {
        return isContinueProvide;
    }

    public void setIsContinueProvide(Boolean isContinueProvide) {
        this.isContinueProvide = isContinueProvide;
    }

    public Integer getCount() {
	return count;
    }
    
    public DBHrefProvider setCount(Integer count) {
	this.count = count;
	return this;
    }
}

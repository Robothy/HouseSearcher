package edu.housesearcher.crawler.hrefprovider;

/**
 * @抽象类 实现一次性获取多条href的方法。 
 * 
 * @继承接口	IHrefProvider
 * 
 * @author robothy
 *
 */
public abstract class AHrefProvider implements IHrefProvider {

    private static final long serialVersionUID = 1L;
    
    /**
     * 是否继续生成 href 标志变量。 true 表示继续生成； false 表示停止生成。
     */
    private Boolean isContinueProvide = true;

    @Override
    public synchronized String[] getHrefs(int num) {
	String[] hrefs = new String[num];
	for(int i=0; i++<num;)
	    hrefs[i] = getHref();
	return hrefs;
    }

    public Boolean getIsContinueProvide() {
        return isContinueProvide;
    }

    public void setIsContinueProvide(Boolean isContinueProvide) {
        this.isContinueProvide = isContinueProvide;
    }
}

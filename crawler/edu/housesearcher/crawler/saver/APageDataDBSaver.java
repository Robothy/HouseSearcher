/**
 * 
 */
package edu.housesearcher.crawler.saver;

import java.util.Map;

/**
 * @author robothy
 * @功能 通用型数据保存抽象类
 */
public abstract class APageDataDBSaver implements IPageDataSaver {

    public APageDataDBSaver() {
    }
    
    @Override
    public void doSave(Map<String, String> data) {
        
    }
    
    /**
     * @功能 设置持久化对象
     * @param object
     */
    public abstract void setPersistentClass(Class<?> __class);
    
}

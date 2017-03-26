package edu.housesearcher.crawler.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

/**
 * @Hibernate������ ���ڻ�ȡsession��Ϣ
 * @author robothy
 *
 */
public class HibernateUtil {
    private static final Configuration CONFIGURATION;
    private static final SessionFactory FACTORY;
    
    static{
	CONFIGURATION = new Configuration().configure();
	FACTORY = CONFIGURATION.buildSessionFactory();
    }
    
    public static Session getSession(){
	return FACTORY.openSession();
    }
    
    public static Session getCurrentSession(){
	return FACTORY.getCurrentSession();
    }
    
    public static void closeSessionFactory(){
	FACTORY.close();
    }
}

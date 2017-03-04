// default package
// Generated 2017-3-3 23:23:39 by Hibernate Tools 5.1.0.Alpha1
package edu.housesearcher.crawler.entity;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class EntHouse.
 * @see .EntHouse
 * @author Hibernate Tools
 */
@Stateless
public class EntHouseHome {

    private static final Log log = LogFactory.getLog(EntHouseHome.class);

    @PersistenceContext
    private EntityManager entityManager;

    public void persist(EntHouse transientInstance) {
	log.debug("persisting EntHouse instance");
	try {
	    entityManager.persist(transientInstance);
	    log.debug("persist successful");
	} catch (RuntimeException re) {
	    log.error("persist failed", re);
	    throw re;
	}
    }

    public void remove(EntHouse persistentInstance) {
	log.debug("removing EntHouse instance");
	try {
	    entityManager.remove(persistentInstance);
	    log.debug("remove successful");
	} catch (RuntimeException re) {
	    log.error("remove failed", re);
	    throw re;
	}
    }

    public EntHouse merge(EntHouse detachedInstance) {
	log.debug("merging EntHouse instance");
	try {
	    EntHouse result = entityManager.merge(detachedInstance);
	    log.debug("merge successful");
	    return result;
	} catch (RuntimeException re) {
	    log.error("merge failed", re);
	    throw re;
	}
    }

    public EntHouse findById(Integer id) {
	log.debug("getting EntHouse instance with id: " + id);
	try {
	    EntHouse instance = entityManager.find(EntHouse.class, id);
	    log.debug("get successful");
	    return instance;
	} catch (RuntimeException re) {
	    log.error("get failed", re);
	    throw re;
	}
    }
}

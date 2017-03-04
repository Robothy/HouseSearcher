// default package
// Generated 2017-3-3 23:23:39 by Hibernate Tools 5.1.0.Alpha1
package edu.housesearcher.crawler.entity;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class EntAgent.
 * @see .EntAgent
 * @author Hibernate Tools
 */
@Stateless
public class EntAgentHome {

    private static final Log log = LogFactory.getLog(EntAgentHome.class);

    @PersistenceContext
    private EntityManager entityManager;

    public void persist(EntAgent transientInstance) {
	log.debug("persisting EntAgent instance");
	try {
	    entityManager.persist(transientInstance);
	    log.debug("persist successful");
	} catch (RuntimeException re) {
	    log.error("persist failed", re);
	    throw re;
	}
    }

    public void remove(EntAgent persistentInstance) {
	log.debug("removing EntAgent instance");
	try {
	    entityManager.remove(persistentInstance);
	    log.debug("remove successful");
	} catch (RuntimeException re) {
	    log.error("remove failed", re);
	    throw re;
	}
    }

    public EntAgent merge(EntAgent detachedInstance) {
	log.debug("merging EntAgent instance");
	try {
	    EntAgent result = entityManager.merge(detachedInstance);
	    log.debug("merge successful");
	    return result;
	} catch (RuntimeException re) {
	    log.error("merge failed", re);
	    throw re;
	}
    }

    public EntAgent findById(Integer id) {
	log.debug("getting EntAgent instance with id: " + id);
	try {
	    EntAgent instance = entityManager.find(EntAgent.class, id);
	    log.debug("get successful");
	    return instance;
	} catch (RuntimeException re) {
	    log.error("get failed", re);
	    throw re;
	}
    }
}

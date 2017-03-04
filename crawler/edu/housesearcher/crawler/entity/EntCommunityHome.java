// default package
// Generated 2017-3-3 23:23:39 by Hibernate Tools 5.1.0.Alpha1
package edu.housesearcher.crawler.entity;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class EntCommunity.
 * @see .EntCommunity
 * @author Hibernate Tools
 */
@Stateless
public class EntCommunityHome {

    private static final Log log = LogFactory.getLog(EntCommunityHome.class);

    @PersistenceContext
    private EntityManager entityManager;

    public void persist(EntCommunity transientInstance) {
	log.debug("persisting EntCommunity instance");
	try {
	    entityManager.persist(transientInstance);
	    log.debug("persist successful");
	} catch (RuntimeException re) {
	    log.error("persist failed", re);
	    throw re;
	}
    }

    public void remove(EntCommunity persistentInstance) {
	log.debug("removing EntCommunity instance");
	try {
	    entityManager.remove(persistentInstance);
	    log.debug("remove successful");
	} catch (RuntimeException re) {
	    log.error("remove failed", re);
	    throw re;
	}
    }

    public EntCommunity merge(EntCommunity detachedInstance) {
	log.debug("merging EntCommunity instance");
	try {
	    EntCommunity result = entityManager.merge(detachedInstance);
	    log.debug("merge successful");
	    return result;
	} catch (RuntimeException re) {
	    log.error("merge failed", re);
	    throw re;
	}
    }

    public EntCommunity findById(Integer id) {
	log.debug("getting EntCommunity instance with id: " + id);
	try {
	    EntCommunity instance = entityManager.find(EntCommunity.class, id);
	    log.debug("get successful");
	    return instance;
	} catch (RuntimeException re) {
	    log.error("get failed", re);
	    throw re;
	}
    }
}

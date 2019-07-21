package com.dao;

import java.util.List;
import java.util.Set;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Areas;

/**
 * A data access object (DAO) providing persistence and search support for Areas
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.pojo.Areas
 * @author MyEclipse Persistence Tools
 */
public class AreasDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(AreasDAO.class);
	// property constants
	public static final String AREA_NAME = "areaName";

	protected void initDao() {
		// do nothing
	}

	public void save(Areas transientInstance) {
		log.debug("saving Areas instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Areas persistentInstance) {
		log.debug("deleting Areas instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Areas findById(java.lang.Integer id) {
		log.debug("getting Areas instance with id: " + id);
		try {
			Areas instance = (Areas) getHibernateTemplate().get(
					"com.pojo.Areas", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Areas instance) {
		log.debug("finding Areas instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Areas instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Areas as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByAreaName(Object areaName) {
		return findByProperty(AREA_NAME, areaName);
	}

	public List findAll() {
		log.debug("finding all Areas instances");
		try {
			String queryString = "from Areas";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Areas merge(Areas detachedInstance) {
		log.debug("merging Areas instance");
		try {
			Areas result = (Areas) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Areas instance) {
		log.debug("attaching dirty Areas instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Areas instance) {
		log.debug("attaching clean Areas instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static AreasDAO getFromApplicationContext(ApplicationContext ctx) {
		return (AreasDAO) ctx.getBean("AreasDAO");
	}
}
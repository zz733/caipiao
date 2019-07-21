package com.dao;

import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.CaipiaoType;

/**
 * A data access object (DAO) providing persistence and search support for
 * CaipiaoType entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.CaipiaoType
 * @author MyEclipse Persistence Tools
 */

public class CaipiaoTypeDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(CaipiaoTypeDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String STATUS = "status";

	protected void initDao() {
		// do nothing
	}

	public void save(CaipiaoType transientInstance) {
		log.debug("saving CaipiaoType instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(CaipiaoType persistentInstance) {
		log.debug("deleting CaipiaoType instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public CaipiaoType findById(java.lang.Integer id) {
		log.debug("getting CaipiaoType instance with id: " + id);
		try {
			CaipiaoType instance = (CaipiaoType) getHibernateTemplate().get(
					"com.pojo.CaipiaoType", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(CaipiaoType instance) {
		log.debug("finding CaipiaoType instance by example");
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
		log.debug("finding CaipiaoType instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from CaipiaoType as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findAll() {
		log.debug("finding all CaipiaoType instances");
		try {
			String queryString = "from CaipiaoType";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public CaipiaoType merge(CaipiaoType detachedInstance) {
		log.debug("merging CaipiaoType instance");
		try {
			CaipiaoType result = (CaipiaoType) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(CaipiaoType instance) {
		log.debug("attaching dirty CaipiaoType instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(CaipiaoType instance) {
		log.debug("attaching clean CaipiaoType instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static CaipiaoTypeDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (CaipiaoTypeDAO) ctx.getBean("CaipiaoTypeDAO");
	}
}
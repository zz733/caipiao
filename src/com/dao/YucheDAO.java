package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Yuche;

/**
 * A data access object (DAO) providing persistence and search support for Yuche
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.pojo.Yuche
 * @author MyEclipse Persistence Tools
 */

public class YucheDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(YucheDAO.class);
	// property constants
	public static final String CAIPIAO_QISHU = "caipiaoQishu";
	public static final String NEIRONG = "neirong";

	protected void initDao() {
		// do nothing
	}

	public void save(Yuche transientInstance) {
		log.debug("saving Yuche instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Yuche persistentInstance) {
		log.debug("deleting Yuche instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Yuche findById(java.lang.Integer id) {
		log.debug("getting Yuche instance with id: " + id);
		try {
			Yuche instance = (Yuche) getHibernateTemplate().get(
					"com.pojo.Yuche", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Yuche instance) {
		log.debug("finding Yuche instance by example");
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
		log.debug("finding Yuche instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Yuche as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCaipiaoQishu(Object caipiaoQishu) {
		return findByProperty(CAIPIAO_QISHU, caipiaoQishu);
	}

	public List findByNeirong(Object neirong) {
		return findByProperty(NEIRONG, neirong);
	}

	public List findAll() {
		log.debug("finding all Yuche instances");
		try {
			String queryString = "from Yuche";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Yuche merge(Yuche detachedInstance) {
		log.debug("merging Yuche instance");
		try {
			Yuche result = (Yuche) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Yuche instance) {
		log.debug("attaching dirty Yuche instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Yuche instance) {
		log.debug("attaching clean Yuche instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static YucheDAO getFromApplicationContext(ApplicationContext ctx) {
		return (YucheDAO) ctx.getBean("YucheDAO");
	}
}
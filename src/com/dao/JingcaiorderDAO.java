package com.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Jingcaiorder;

/**
 * A data access object (DAO) providing persistence and search support for
 * Jingcaiorder entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.Jingcaiorder
 * @author MyEclipse Persistence Tools
 */
public class JingcaiorderDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(JingcaiorderDAO.class);
	// property constants
	public static final String JC_QISHU = "jcQishu";
	public static final String JC_FUBEI = "jcFubei";

	protected void initDao() {
		// do nothing
	}

	public void save(Jingcaiorder transientInstance) {
		log.debug("saving Jingcaiorder instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Jingcaiorder persistentInstance) {
		log.debug("deleting Jingcaiorder instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Jingcaiorder findById(java.lang.Integer id) {
		log.debug("getting Jingcaiorder instance with id: " + id);
		try {
			Jingcaiorder instance = (Jingcaiorder) getHibernateTemplate().get(
					"com.pojo.Jingcaiorder", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}

	}

	public List findByExample(Jingcaiorder instance) {
		log.debug("finding Jingcaiorder instance by example");
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
		log.debug("finding Jingcaiorder instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Jingcaiorder as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByJcQishu(Object jcQishu) {
		return findByProperty(JC_QISHU, jcQishu);
	}

	public List findByJcFubei(Object jcFubei) {
		return findByProperty(JC_FUBEI, jcFubei);
	}

	public List findAll() {
		log.debug("finding all Jingcaiorder instances");
		try {
			String queryString = "from Jingcaiorder";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Jingcaiorder merge(Jingcaiorder detachedInstance) {
		log.debug("merging Jingcaiorder instance");
		try {
			Jingcaiorder result = (Jingcaiorder) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Jingcaiorder instance) {
		log.debug("attaching dirty Jingcaiorder instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Jingcaiorder instance) {
		log.debug("attaching clean Jingcaiorder instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static JingcaiorderDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (JingcaiorderDAO) ctx.getBean("JingcaiorderDAO");
	}
}
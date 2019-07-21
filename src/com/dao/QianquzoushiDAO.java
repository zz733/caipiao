package com.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Qianquzoushi;

public class QianquzoushiDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(QianquzoushiDAO.class);
	// property constants
	public static final String QQZS_QISHU = "qqzsQishu";
	public static final String QQZS_REDONE = "qqzsRedone";
	public static final String QQZS_REDTWO = "qqzsRedtwo";
	public static final String QQZS_REDTHREE = "qqzsRedthree";
	public static final String QQZS_REDFOUR = "qqzsRedfour";
	public static final String QQZS_REDFIVE = "qqzsRedfive";
	public static final String QQZS_REDSIX = "qqzsRedsix";
	public static final String QQZS_BLUEONE = "qqzsBlueone";
	public static final String QQZS_BLUETWO = "qqzsBluetwo";

	protected void initDao() {
		// do nothing
	}

	public void save(Qianquzoushi transientInstance) {
		log.debug("saving Qianquzoushi instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Qianquzoushi persistentInstance) {
		log.debug("deleting Qianquzoushi instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Qianquzoushi findById(java.lang.Integer id) {
		log.debug("getting Qianquzoushi instance with id: " + id);
		try {
			Qianquzoushi instance = (Qianquzoushi) getHibernateTemplate().get(
					"com.pojo.Qianquzoushi", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Qianquzoushi instance) {
		log.debug("finding Qianquzoushi instance by example");
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
		log.debug("finding Qianquzoushi instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Qianquzoushi as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByKjQishu(Object qqzsQishu) {
		return findByProperty(QQZS_QISHU, qqzsQishu);
	}

	public List findByKjRedone(Object qqzsRedone) {
		return findByProperty(QQZS_REDONE, qqzsRedone);
	}

	public List findByKjRedtwo(Object qqzsRedtwo) {
		return findByProperty(QQZS_REDTWO,qqzsRedtwo);
	}

	public List findByKjRedthree(Object qqzsRedthree) {
		return findByProperty(QQZS_REDTHREE, qqzsRedthree);
	}

	public List findByKjRedfour(Object qqzsRedfour) {
		return findByProperty(QQZS_REDFOUR, qqzsRedfour);
	}

	public List findByKjRedfive(Object qqzsRedfive) {
		return findByProperty(QQZS_REDFIVE, qqzsRedfive);
	}

	public List findByKjRedsix(Object qqzsRedsix) {
		return findByProperty(QQZS_REDSIX, qqzsRedsix);
	}

	public List findByKjBlueOne(Object qqzsBlueone) {
		return findByProperty(QQZS_BLUEONE, qqzsBlueone);
	}
	public List findByKjBlueTwo(Object qqzsBluetwo) {
		return findByProperty(QQZS_BLUETWO, qqzsBluetwo);
	}

	public List findAll() {
		log.debug("finding all Qianquzoushi instances");
		try {
			String queryString = "from Qianquzoushi";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Qianquzoushi merge(Qianquzoushi detachedInstance) {
		log.debug("merging Qianquzoushi instance");
		try {
			Qianquzoushi result = (Qianquzoushi) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Qianquzoushi instance) {
		log.debug("attaching dirty Qianquzoushi instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Qianquzoushi instance) {
		log.debug("attaching clean Qianquzoushi instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static QianquzoushiDAO getFromApplicationContext(ApplicationContext ctx) {
		return (QianquzoushiDAO) ctx.getBean("QianquzoushiDAO");
	}
}
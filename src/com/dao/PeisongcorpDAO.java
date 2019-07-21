package com.dao;

import java.util.List;
import java.util.Set;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Peisongcorp;

/**
 * A data access object (DAO) providing persistence and search support for
 * Peisongcorp entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.Peisongcorp
 * @author MyEclipse Persistence Tools
 */
public class PeisongcorpDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(PeisongcorpDAO.class);
	// property constants
	public static final String PSC_CHINESENAME = "pscChinesename";
	public static final String PSC_ENGLISHNAME = "pscEnglishname";
	public static final String PSC_URL = "pscUrl";
	public static final String PSC_DETAIL = "pscDetail";
	public static final String PSC_STATUS = "pscStatus";

	protected void initDao() {
		// do nothing
	}

	public void save(Peisongcorp transientInstance) {
		log.debug("saving Peisongcorp instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Peisongcorp persistentInstance) {
		log.debug("deleting Peisongcorp instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Peisongcorp findById(java.lang.Integer id) {
		log.debug("getting Peisongcorp instance with id: " + id);
		try {
			Peisongcorp instance = (Peisongcorp) getHibernateTemplate().get(
					"com.pojo.Peisongcorp", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Peisongcorp instance) {
		log.debug("finding Peisongcorp instance by example");
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
		log.debug("finding Peisongcorp instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Peisongcorp as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByPscChinesename(Object pscChinesename) {
		return findByProperty(PSC_CHINESENAME, pscChinesename);
	}

	public List findByPscEnglishname(Object pscEnglishname) {
		return findByProperty(PSC_ENGLISHNAME, pscEnglishname);
	}

	public List findByPscUrl(Object pscUrl) {
		return findByProperty(PSC_URL, pscUrl);
	}

	public List findByPscDetail(Object pscDetail) {
		return findByProperty(PSC_DETAIL, pscDetail);
	}

	public List findByPscStatus(Object pscStatus) {
		return findByProperty(PSC_STATUS, pscStatus);
	}

	public List findAll() {
		log.debug("finding all Peisongcorp instances");
		try {
			String queryString = "from Peisongcorp";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Peisongcorp merge(Peisongcorp detachedInstance) {
		log.debug("merging Peisongcorp instance");
		try {
			Peisongcorp result = (Peisongcorp) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Peisongcorp instance) {
		log.debug("attaching dirty Peisongcorp instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Peisongcorp instance) {
		log.debug("attaching clean Peisongcorp instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static PeisongcorpDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (PeisongcorpDAO) ctx.getBean("PeisongcorpDAO");
	}
}
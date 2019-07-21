package com.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Kaijiang;

/**
 * A data access object (DAO) providing persistence and search support for
 * Kaijiang entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.Kaijiang
 * @author MyEclipse Persistence Tools
 */
public class KaijiangDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(KaijiangDAO.class);
	// property constants
	public static final String KJ_QISHU = "kjQishu";
	public static final String KJ_REDONE = "kjRedone";
	public static final String KJ_REDTWO = "kjRedtwo";
	public static final String KJ_REDTHREE = "kjRedthree";
	public static final String KJ_REDFOUR = "kjRedfour";
	public static final String KJ_REDFIVE = "kjRedfive";
	public static final String KJ_REDSIX = "kjRedsix";
	public static final String KJ_BLUE = "kjBlue";

	protected void initDao() {
		// do nothing
	}

	public void save(Kaijiang transientInstance) {
		log.debug("saving Kaijiang instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Kaijiang persistentInstance) {
		log.debug("deleting Kaijiang instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Kaijiang findById(java.lang.Integer id) {
		log.debug("getting Kaijiang instance with id: " + id);
		try {
			Kaijiang instance = (Kaijiang) getHibernateTemplate().get(
					"com.pojo.Kaijiang", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Kaijiang instance) {
		log.debug("finding Kaijiang instance by example");
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
		log.debug("finding Kaijiang instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Kaijiang as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByKjQishu(Object kjQishu) {
		return findByProperty(KJ_QISHU, kjQishu);
	}

	public List findByKjRedone(Object kjRedone) {
		return findByProperty(KJ_REDONE, kjRedone);
	}

	public List findByKjRedtwo(Object kjRedtwo) {
		return findByProperty(KJ_REDTWO, kjRedtwo);
	}

	public List findByKjRedthree(Object kjRedthree) {
		return findByProperty(KJ_REDTHREE, kjRedthree);
	}

	public List findByKjRedfour(Object kjRedfour) {
		return findByProperty(KJ_REDFOUR, kjRedfour);
	}

	public List findByKjRedfive(Object kjRedfive) {
		return findByProperty(KJ_REDFIVE, kjRedfive);
	}

	public List findByKjRedsix(Object kjRedsix) {
		return findByProperty(KJ_REDSIX, kjRedsix);
	}

	public List findByKjBlue(Object kjBlue) {
		return findByProperty(KJ_BLUE, kjBlue);
	}

	public List findAll() {
		log.debug("finding all Kaijiang instances");
		try {
			String queryString = "from Kaijiang";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Kaijiang merge(Kaijiang detachedInstance) {
		log.debug("merging Kaijiang instance");
		try {
			Kaijiang result = (Kaijiang) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Kaijiang instance) {
		log.debug("attaching dirty Kaijiang instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Kaijiang instance) {
		log.debug("attaching clean Kaijiang instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static KaijiangDAO getFromApplicationContext(ApplicationContext ctx) {
		return (KaijiangDAO) ctx.getBean("KaijiangDAO");
	}
}
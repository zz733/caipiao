package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.YucheOrder;

/**
 * A data access object (DAO) providing persistence and search support for
 * YucheOrder entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.YucheOrder
 * @author MyEclipse Persistence Tools
 */

public class YucheOrderDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(YucheOrderDAO.class);
	// property constants
	public static final String PAYID = "payid";
	public static final String MONEY = "money";
	public static final String PAYTYPE = "paytype";
	public static final String ZONJIANG = "zonjiang";
	public static final String FANG_MONEY = "fangMoney";
	public static final String FANG_TYPE = "fangType";

	protected void initDao() {
		// do nothing
	}

	public void save(YucheOrder transientInstance) {
		log.debug("saving YucheOrder instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(YucheOrder persistentInstance) {
		log.debug("deleting YucheOrder instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public YucheOrder findById(java.lang.Long id) {
		log.debug("getting YucheOrder instance with id: " + id);
		try {
			YucheOrder instance = (YucheOrder) getHibernateTemplate().get(
					"com.pojo.YucheOrder", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(YucheOrder instance) {
		log.debug("finding YucheOrder instance by example");
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
		log.debug("finding YucheOrder instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from YucheOrder as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByPayid(Object payid) {
		return findByProperty(PAYID, payid);
	}

	public List findByMoney(Object money) {
		return findByProperty(MONEY, money);
	}

	public List findByPaytype(Object paytype) {
		return findByProperty(PAYTYPE, paytype);
	}

	public List findByZonjiang(Object zonjiang) {
		return findByProperty(ZONJIANG, zonjiang);
	}

	public List findByFangMoney(Object fangMoney) {
		return findByProperty(FANG_MONEY, fangMoney);
	}

	public List findByFangType(Object fangType) {
		return findByProperty(FANG_TYPE, fangType);
	}

	public List findAll() {
		log.debug("finding all YucheOrder instances");
		try {
			String queryString = "from YucheOrder";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public YucheOrder merge(YucheOrder detachedInstance) {
		log.debug("merging YucheOrder instance");
		try {
			YucheOrder result = (YucheOrder) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(YucheOrder instance) {
		log.debug("attaching dirty YucheOrder instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(YucheOrder instance) {
		log.debug("attaching clean YucheOrder instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static YucheOrderDAO getFromApplicationContext(ApplicationContext ctx) {
		return (YucheOrderDAO) ctx.getBean("YucheOrderDAO");
	}
}
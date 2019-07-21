package com.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Rechargerecord;

/**
 * A data access object (DAO) providing persistence and search support for
 * Rechargerecord entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.Rechargerecord
 * @author MyEclipse Persistence Tools
 */
public class RechargerecordDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(RechargerecordDAO.class);
	// property constants
	public static final String RR_MONEY = "rrMoney";
	public static final String RR_TYPE = "rrType";
	public static final String RR_ZFBDINGDAN = "rrZfbdingdan";
	public static final String RR_WXDINGDAN = "rrWxdingdan";
	public static final String RR_STATUS = "rrStatus";
	public static final String RR_DINGDANHAO = "rrDingdanhao";

	protected void initDao() {
		// do nothing
	}

	public void save(Rechargerecord transientInstance) {
		log.debug("saving Rechargerecord instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Rechargerecord persistentInstance) {
		log.debug("deleting Rechargerecord instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Rechargerecord findById(java.lang.Integer id) {
		log.debug("getting Rechargerecord instance with id: " + id);
		try {
			Rechargerecord instance = (Rechargerecord) getHibernateTemplate()
					.get("com.pojo.Rechargerecord", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Rechargerecord instance) {
		log.debug("finding Rechargerecord instance by example");
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
		log.debug("finding Rechargerecord instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Rechargerecord as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByRrMoney(Object rrMoney) {
		return findByProperty(RR_MONEY, rrMoney);
	}

	public List findByRrType(Object rrType) {
		return findByProperty(RR_TYPE, rrType);
	}

	public List findByRrZfbdingdan(Object rrZfbdingdan) {
		return findByProperty(RR_ZFBDINGDAN, rrZfbdingdan);
	}

	public List findByRrWxdingdan(Object rrWxdingdan) {
		return findByProperty(RR_WXDINGDAN, rrWxdingdan);
	}

	public List findByRrStatus(Object rrStatus) {
		return findByProperty(RR_STATUS, rrStatus);
	}

	public List findByRrDingdanhao(Object rrDingdanhao) {
		return findByProperty(RR_DINGDANHAO, rrDingdanhao);
	}

	public List findAll() {
		log.debug("finding all Rechargerecord instances");
		try {
			String queryString = "from Rechargerecord";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Rechargerecord merge(Rechargerecord detachedInstance) {
		log.debug("merging Rechargerecord instance");
		try {
			Rechargerecord result = (Rechargerecord) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Rechargerecord instance) {
		log.debug("attaching dirty Rechargerecord instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Rechargerecord instance) {
		log.debug("attaching clean Rechargerecord instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static RechargerecordDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (RechargerecordDAO) ctx.getBean("RechargerecordDAO");
	}
}
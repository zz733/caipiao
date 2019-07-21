package com.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Viprecord;

/**
 * A data access object (DAO) providing persistence and search support for
 * Viprecord entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.Viprecord
 * @author MyEclipse Persistence Tools
 */
public class ViprecordDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(ViprecordDAO.class);
	// property constants
	public static final String VIP_DAY = "vipDay";
	public static final String VIP_FUBEI = "vipFubei";
	public static final String VIP_CZTYPE = "vipCztype";
	public static final String VIP_ZFBDINGDAN = "vipZfbdingdan";
	public static final String VIP_WXDINGDAN = "vipWxdingdan";

	protected void initDao() {
		// do nothing
	}

	public void save(Viprecord transientInstance) {
		log.debug("saving Viprecord instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Viprecord persistentInstance) {
		log.debug("deleting Viprecord instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Viprecord findById(java.lang.Integer id) {
		log.debug("getting Viprecord instance with id: " + id);
		try {
			Viprecord instance = (Viprecord) getHibernateTemplate().get(
					"com.pojo.Viprecord", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Viprecord instance) {
		log.debug("finding Viprecord instance by example");
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
		log.debug("finding Viprecord instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Viprecord as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByVipDay(Object vipDay) {
		return findByProperty(VIP_DAY, vipDay);
	}

	public List findByVipFubei(Object vipFubei) {
		return findByProperty(VIP_FUBEI, vipFubei);
	}

	public List findByVipCztype(Object vipCztype) {
		return findByProperty(VIP_CZTYPE, vipCztype);
	}

	public List findByVipZfbdingdan(Object vipZfbdingdan) {
		return findByProperty(VIP_ZFBDINGDAN, vipZfbdingdan);
	}

	public List findByVipWxdingdan(Object vipWxdingdan) {
		return findByProperty(VIP_WXDINGDAN, vipWxdingdan);
	}

	public List findAll() {
		log.debug("finding all Viprecord instances");
		try {
			String queryString = "from Viprecord";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Viprecord merge(Viprecord detachedInstance) {
		log.debug("merging Viprecord instance");
		try {
			Viprecord result = (Viprecord) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Viprecord instance) {
		log.debug("attaching dirty Viprecord instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Viprecord instance) {
		log.debug("attaching clean Viprecord instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ViprecordDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ViprecordDAO) ctx.getBean("ViprecordDAO");
	}
}
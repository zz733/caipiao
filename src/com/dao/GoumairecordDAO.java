package com.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.GoumaiRecord;

public class GoumairecordDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(GoumairecordDAO.class);
	// property constants
	public static final String GM_MONEY = "gmMoney";
	public static final String GM_TYPE = "gmType";
	public static final String GM_ZFBDINGDAN = "gmZfbdingdan";
	public static final String GM_WXDINGDAN = "gmWxdingdan";
	public static final String GM_STATUS = "gmStatus";
	public static final String GM_DINGDANHAO = "gmDingdanhao";

	protected void initDao() {
		// do nothing
	}

	public void save(GoumaiRecord transientInstance) {
		log.debug("saving GoumaiRecord instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(GoumaiRecord persistentInstance) {
		log.debug("deleting GoumaiRecord instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public GoumaiRecord findById(java.lang.Integer id) {
		log.debug("getting GoumaiRecord instance with id: " + id);
		try {
			GoumaiRecord instance = (GoumaiRecord) getHibernateTemplate()
					.get("com.pojo.GoumaiRecord", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(GoumaiRecord instance) {
		log.debug("finding GoumaiRecord instance by example");
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
		log.debug("finding GoumaiRecord instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from GoumaiRecord as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByGmMoney(Object rrMoney) {
		return findByProperty(GM_MONEY, rrMoney);
	}

	public List findByGmType(Object rrType) {
		return findByProperty(GM_TYPE, rrType);
	}

	public List findByGmZfbdingdan(Object rrZfbdingdan) {
		return findByProperty(GM_ZFBDINGDAN, rrZfbdingdan);
	}

	public List findByGmWxdingdan(Object rrWxdingdan) {
		return findByProperty(GM_WXDINGDAN, rrWxdingdan);
	}

	public List findByGmStatus(Object rrStatus) {
		return findByProperty(GM_STATUS, rrStatus);
	}

	public List findByGmDingdanhao(Object rrDingdanhao) {
		return findByProperty(GM_DINGDANHAO, rrDingdanhao);
	}

	public List findAll() {
		log.debug("finding all GoumaiRecord instances");
		try {
			String queryString = "from GoumaiRecord";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public GoumaiRecord merge(GoumaiRecord detachedInstance) {
		log.debug("merging GoumaiRecord instance");
		try {
			GoumaiRecord result = (GoumaiRecord) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(GoumaiRecord instance) {
		log.debug("attaching dirty GoumaiRecord instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(GoumaiRecord instance) {
		log.debug("attaching clean GoumaiRecord instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static GoumairecordDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (GoumairecordDAO) ctx.getBean("GoumairecordDAO");
	}
}
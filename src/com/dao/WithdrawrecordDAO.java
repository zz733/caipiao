package com.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Withdrawrecord;

/**
 * A data access object (DAO) providing persistence and search support for
 * Withdrawrecord entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.Withdrawrecord
 * @author MyEclipse Persistence Tools
 */
public class WithdrawrecordDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(WithdrawrecordDAO.class);
	// property constants
	public static final String WR_MONEY = "wrMoney";
	public static final String WR_DINGDANHAO = "wrDingdanhao";
	public static final String WR_STATUS = "wrStatus";
	public static final String WR_ZHIFUBAO = "wrZhifubao";
	public static final String WR_WEI_XIN = "wrWeiXin";
	public static final String WR_TXTPYE = "wrTxtpye";

	protected void initDao() {
		// do nothing
	}

	public void save(Withdrawrecord transientInstance) {
		log.debug("saving Withdrawrecord instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Withdrawrecord persistentInstance) {
		log.debug("deleting Withdrawrecord instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Withdrawrecord findById(java.lang.Integer id) {
		log.debug("getting Withdrawrecord instance with id: " + id);
		try {
			Withdrawrecord instance = (Withdrawrecord) getHibernateTemplate()
					.get("com.pojo.Withdrawrecord", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Withdrawrecord instance) {
		log.debug("finding Withdrawrecord instance by example");
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
		log.debug("finding Withdrawrecord instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Withdrawrecord as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByWrMoney(Object wrMoney) {
		return findByProperty(WR_MONEY, wrMoney);
	}

	public List findByWrDingdanhao(Object wrDingdanhao) {
		return findByProperty(WR_DINGDANHAO, wrDingdanhao);
	}

	public List findByWrStatus(Object wrStatus) {
		return findByProperty(WR_STATUS, wrStatus);
	}

	public List findByWrZhifubao(Object wrZhifubao) {
		return findByProperty(WR_ZHIFUBAO, wrZhifubao);
	}

	public List findByWrWeiXin(Object wrWeiXin) {
		return findByProperty(WR_WEI_XIN, wrWeiXin);
	}

	public List findByWrTxtpye(Object wrTxtpye) {
		return findByProperty(WR_TXTPYE, wrTxtpye);
	}

	public List findAll() {
		log.debug("finding all Withdrawrecord instances");
		try {
			String queryString = "from Withdrawrecord";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Withdrawrecord merge(Withdrawrecord detachedInstance) {
		log.debug("merging Withdrawrecord instance");
		try {
			Withdrawrecord result = (Withdrawrecord) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Withdrawrecord instance) {
		log.debug("attaching dirty Withdrawrecord instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Withdrawrecord instance) {
		log.debug("attaching clean Withdrawrecord instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static WithdrawrecordDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (WithdrawrecordDAO) ctx.getBean("WithdrawrecordDAO");
	}
}
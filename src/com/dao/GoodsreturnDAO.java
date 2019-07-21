package com.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Goodsreturn;

/**
 * A data access object (DAO) providing persistence and search support for
 * Goodsreturn entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.Goodsreturn
 * @author MyEclipse Persistence Tools
 */
public class GoodsreturnDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(GoodsreturnDAO.class);
	// property constants
	public static final String OR_ID = "orId";
	public static final String GR_STATUS = "grStatus";
	public static final String GR_AUDITOR = "grAuditor";
	public static final String GR_AUDITORREASON = "grAuditorreason";
	public static final String GR_REMARK = "grRemark";

	protected void initDao() {
		// do nothing
	}

	public void save(Goodsreturn transientInstance) {
		log.debug("saving Goodsreturn instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Goodsreturn persistentInstance) {
		log.debug("deleting Goodsreturn instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Goodsreturn findById(java.lang.Integer id) {
		log.debug("getting Goodsreturn instance with id: " + id);
		try {
			Goodsreturn instance = (Goodsreturn) getHibernateTemplate().get(
					"com.pojo.Goodsreturn", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Goodsreturn instance) {
		log.debug("finding Goodsreturn instance by example");
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
		log.debug("finding Goodsreturn instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Goodsreturn as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByOrId(Object orId) {
		return findByProperty(OR_ID, orId);
	}

	public List findByGrStatus(Object grStatus) {
		return findByProperty(GR_STATUS, grStatus);
	}

	public List findByGrAuditor(Object grAuditor) {
		return findByProperty(GR_AUDITOR, grAuditor);
	}

	public List findByGrAuditorreason(Object grAuditorreason) {
		return findByProperty(GR_AUDITORREASON, grAuditorreason);
	}

	public List findByGrRemark(Object grRemark) {
		return findByProperty(GR_REMARK, grRemark);
	}

	public List findAll() {
		log.debug("finding all Goodsreturn instances");
		try {
			String queryString = "from Goodsreturn";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Goodsreturn merge(Goodsreturn detachedInstance) {
		log.debug("merging Goodsreturn instance");
		try {
			Goodsreturn result = (Goodsreturn) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Goodsreturn instance) {
		log.debug("attaching dirty Goodsreturn instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Goodsreturn instance) {
		log.debug("attaching clean Goodsreturn instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static GoodsreturnDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (GoodsreturnDAO) ctx.getBean("GoodsreturnDAO");
	}
}
package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Kaijiang3d;

/**
 * A data access object (DAO) providing persistence and search support for
 * Kaijiang3d entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.Kaijiang3d
 * @author MyEclipse Persistence Tools
 */

public class Kaijiang3dDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(Kaijiang3dDAO.class);
	// property constants
	public static final String QISHU = "qishu";
	public static final String QIU1 = "qiu1";
	public static final String QIU2 = "qiu2";
	public static final String QIU3 = "qiu3";
	public static final String KUDU = "kudu";
	public static final String HEWEI = "hewei";
	public static final String CHU3YU0 = "chu3yu0";
	public static final String CHU3YU1 = "chu3yu1";
	public static final String CHU3YU2 = "chu3yu2";
	public static final String DASHU_NUM = "dashuNum";
	public static final String XIAOSHU_NUM = "xiaoshuNum";
	public static final String ZHISHU_NUM = "zhishuNum";
	public static final String HESHU_NUM = "heshuNum";
	public static final String JISHU_NUM = "jishuNum";
	public static final String OUSHU_NUM = "oushuNum";

	protected void initDao() {
		// do nothing
	}

	public void save(Kaijiang3d transientInstance) {
		log.debug("saving Kaijiang3d instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Kaijiang3d persistentInstance) {
		log.debug("deleting Kaijiang3d instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Kaijiang3d findById(java.lang.Integer id) {
		log.debug("getting Kaijiang3d instance with id: " + id);
		try {
			Kaijiang3d instance = (Kaijiang3d) getHibernateTemplate().get(
					"com.pojo.Kaijiang3d", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Kaijiang3d instance) {
		log.debug("finding Kaijiang3d instance by example");
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
		log.debug("finding Kaijiang3d instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Kaijiang3d as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByQishu(Object qishu) {
		return findByProperty(QISHU, qishu);
	}

	public List findByQiu1(Object qiu1) {
		return findByProperty(QIU1, qiu1);
	}

	public List findByQiu2(Object qiu2) {
		return findByProperty(QIU2, qiu2);
	}

	public List findByQiu3(Object qiu3) {
		return findByProperty(QIU3, qiu3);
	}

	public List findByKudu(Object kudu) {
		return findByProperty(KUDU, kudu);
	}

	public List findByHewei(Object hewei) {
		return findByProperty(HEWEI, hewei);
	}

	public List findByChu3yu0(Object chu3yu0) {
		return findByProperty(CHU3YU0, chu3yu0);
	}

	public List findByChu3yu1(Object chu3yu1) {
		return findByProperty(CHU3YU1, chu3yu1);
	}

	public List findByChu3yu2(Object chu3yu2) {
		return findByProperty(CHU3YU2, chu3yu2);
	}

	public List findByDashuNum(Object dashuNum) {
		return findByProperty(DASHU_NUM, dashuNum);
	}

	public List findByXiaoshuNum(Object xiaoshuNum) {
		return findByProperty(XIAOSHU_NUM, xiaoshuNum);
	}

	public List findByZhishuNum(Object zhishuNum) {
		return findByProperty(ZHISHU_NUM, zhishuNum);
	}

	public List findByHeshuNum(Object heshuNum) {
		return findByProperty(HESHU_NUM, heshuNum);
	}

	public List findByJishuNum(Object jishuNum) {
		return findByProperty(JISHU_NUM, jishuNum);
	}

	public List findByOushuNum(Object oushuNum) {
		return findByProperty(OUSHU_NUM, oushuNum);
	}

	public List findAll() {
		log.debug("finding all Kaijiang3d instances");
		try {
			String queryString = "from Kaijiang3d";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Kaijiang3d merge(Kaijiang3d detachedInstance) {
		log.debug("merging Kaijiang3d instance");
		try {
			Kaijiang3d result = (Kaijiang3d) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Kaijiang3d instance) {
		log.debug("attaching dirty Kaijiang3d instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Kaijiang3d instance) {
		log.debug("attaching clean Kaijiang3d instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static Kaijiang3dDAO getFromApplicationContext(ApplicationContext ctx) {
		return (Kaijiang3dDAO) ctx.getBean("Kaijiang3dDAO");
	}
}
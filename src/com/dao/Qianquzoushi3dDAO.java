package com.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Kaijiang3d;
import com.pojo.Qianquzoushi3d;

public class Qianquzoushi3dDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(Qianquzoushi3dDAO.class);
	// property constants
	public static final String QISHU = "qishu";
	public static final String QIU1 = "qiu1";
	public static final String QIU2 = "qiu2";
	public static final String QIU3 = "qiu3";
	public static final String QIU4 = "qiu4";
	public static final String QIU5 = "qiu5";
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

	public void save(Qianquzoushi3d transientInstance) {
		log.debug("saving Qianquzoushi3d instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Qianquzoushi3d persistentInstance) {
		log.debug("deleting Qianquzoushi3d instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Qianquzoushi3d findById(java.lang.Integer id) {
		log.debug("getting Qianquzoushi3d instance with id: " + id);
		try {
			Qianquzoushi3d instance = (Qianquzoushi3d) getHibernateTemplate()
					.get("com.pojo.Qianquzoushi3d", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Qianquzoushi3d instance) {
		log.debug("finding Qianquzoushi3d instance by example");
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
		log.debug("finding Qianquzoushi3d instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Qianquzoushi3d as model where model."
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

	public List findByQiu4(Object qiu4) {
		return findByProperty(QIU4, qiu4);
	}

	public List findByQiu5(Object qiu5) {
		return findByProperty(QIU5, qiu5);
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
		log.debug("finding all Qianquzoushi3d instances");
		try {
			String queryString = "from Qianquzoushi3d";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Qianquzoushi3d merge(Qianquzoushi3d detachedInstance) {
		log.debug("merging Qianquzoushi3d instance");
		try {
			Qianquzoushi3d result = (Qianquzoushi3d) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Qianquzoushi3d instance) {
		log.debug("attaching dirty Qianquzoushi3d instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Qianquzoushi3d instance) {
		log.debug("attaching clean Qianquzoushi3d instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static Qianquzoushi3dDAO getFromApplicationContext(ApplicationContext ctx) {
		return (Qianquzoushi3dDAO) ctx.getBean("Qianquzoushi3dDAO");
	}
}
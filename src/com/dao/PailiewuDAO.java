package com.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Pailiewu;

public class PailiewuDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(PailiewuDAO.class);
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

	protected void initDao() {
	}

	public void save(Pailiewu transientInstance) {
		log.debug("saving Pailiewu instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Pailiewu persistentInstance) {
		log.debug("deleting Pailiewu instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Pailiewu findById(java.lang.Integer id) {
		log.debug("getting Pailiewu instance with id: " + id);
		try {
			Pailiewu instance = (Pailiewu) getHibernateTemplate().get(
					"com.pojo.Pailiewu", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Pailiewu instance) {
		log.debug("finding Pailiewu instance by example");
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
		log.debug("finding Pailiewu instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Pailiewu as model where model."
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

	public List findAll() {
		log.debug("finding all Pailiewu instances");
		try {
			String queryString = "from Pailiewu";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Pailiewu merge(Pailiewu detachedInstance) {
		log.debug("merging Pailiewu instance");
		try {
			Pailiewu result = (Pailiewu) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Pailiewu instance) {
		log.debug("attaching dirty Pailiewu instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Pailiewu instance) {
		log.debug("attaching clean Pailiewu instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static PailiewuDAO getFromApplicationContext(ApplicationContext ctx) {
		return (PailiewuDAO) ctx.getBean("PailiewuDAO");
	}
}
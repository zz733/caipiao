package com.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class HQLDAO extends HibernateDaoSupport {
	public List query(String hql, Object... p) {
		return super.getHibernateTemplate().find(hql, p);
	}

	public List queryByNewSession(String hql, Object... p) {
		Session session = getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		if (p != null) {
			for (int i = 0; i < p.length; i++) {
				query.setParameter(i, p[i]);
			}
		}
		List list = query.list();
		session.close();
		return list;
	}

	// 分页查询
	public List pageQueryNewSession(final String hql, final Integer page,
			final Integer size, final Object... p) {

		Session session = getSessionFactory().openSession();
		Query query = session.createQuery(hql);

		if (p != null)
			for (int i = 0; i < p.length; i++) {
				query.setParameter(i, p[i]);
			}
		if (page != null && size != null)
			query.setFirstResult((page - 1) * size).setMaxResults(size);
		
		List list =  query.list();
        session.close();
        return list;
	}

	public List findByHQL(final String hql, final Object... p) {
		List list = getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				Query query = session.createQuery(hql);
				query.setCacheable(true);
				for (int i = 0; i < p.length; i++) {
					query.setParameter(i, p[i]);
				}
				return query.list();
			}
		});

		return list;
	}

	// 分页查询
	public List pageQuery(final String hql, final Integer page,
			final Integer size, final Object... p) {
		return getHibernateTemplate().executeFind(
				new HibernateCallback<Object>() {

					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createQuery(hql);
						query.setCacheable(true);
						if (p != null)
							for (int i = 0; i < p.length; i++) {
								query.setParameter(i, p[i]);
							}
						if (page != null && size != null)
							query.setFirstResult((page - 1) * size)
									.setMaxResults(size);
						session.close();
						return query.list();
					}
				});
	}

	// ������
	public void bulkUpdate(String hql, Object... p) {
		getHibernateTemplate().bulkUpdate(hql, p);
	}

	public float unique(String hql, Object... p) {
		List list = findByHQL(hql, p);
		if (list.size() > 0) {
			Object obj = list.get(0);
			if (obj != null) {
				return Float.parseFloat(obj.toString());
			}
		}
		return 0;
	}

	public int update(String hql, Object[] params) {
		return getHibernateTemplate().bulkUpdate(hql, params);
	}

	// 分页查询
	public List pageQuery2(final String hql, final Integer page,
			final Integer size, final Object... p) {
		return getHibernateTemplate().executeFind(new HibernateCallback() {

			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				if (p != null)

					query.setParameter(0, p[0]);

				if (page != null && size != null)
					query.setFirstResult((page - 1) * size).setMaxResults(size);

				return query.list();
			}
		});
	}

	// 从第几条到第几条数据
	public List recordQuery(final String hql, final Integer num,
			final Integer size, final Object... p) {
		return getHibernateTemplate().executeFind(new HibernateCallback() {

			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				// System.out.println("我来了");
				// System.out.println(hql);
				// System.out.println(page);
				// System.out.println(size);
				if (p != null && p.length > 0)

					for (int i = 0; i < p.length; i++) {
						query.setParameter(i, p[i]);
					}

				if (num != null && size != null)
					query.setFirstResult(num).setMaxResults(size);
				// System.out.println("我来了");
				return query.list();
			}
		});
	}

	/**
	 * 获取session对象
	 * 
	 * @return
	 */
	public Session getSessionFromSpring() {

		return (Session) super.getHibernateTemplate().execute(
				new HibernateCallback() {

					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						// TODO Auto-generated method stub
						return session;
					}

				});
	}

	/**
	 * 获取全文索引的session对象
	 * 
	 * @return
	 */
	public FullTextSession getFullTextSession() {
		Session session = getSessionFromSpring();
		FullTextSession fullTextSession = Search.getFullTextSession(session);
		return fullTextSession;
	}

	/**
	 * 获得session对象
	 * 
	 * @return
	 */
	public Session getSessionFromSpring2() {
		return getHibernateTemplate().getSessionFactory().getCurrentSession();
	}

	/**
	 * 调用function
	 * 
	 * @param fn
	 * @param p
	 * @return
	 */
	public Object queryFunction(final String fn, final Object... p) {
		return super.getHibernateTemplate().execute(new HibernateCallback() {
			// {?=call getchild(?)}
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Connection connection = session.connection();
				String sql = fn;
				CallableStatement cs = connection.prepareCall(sql);
				cs.registerOutParameter(1, Types.VARCHAR);
				if (p != null)
					for (int i = 0; i < p.length; i++) {
						cs.setObject(i + 2, p[i]);
					}
				cs.execute();
				String msg = cs.getString(1);
				return msg;
			}
		});
	}

}

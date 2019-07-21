package com.service.pc;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;

@Service
public class ShiyongService {

	@Autowired
	private HQLDAO hqldao;

	/*
	 * 根据用户ID查询所有竞猜记录
	 */
	public Map FindByIdjingcai(String username, Timestamp mintime,
			Timestamp maxtime, Integer id) {
		StringBuffer sb = new StringBuffer();
		List listparam = new ArrayList();
		sb.append(" where 1=1 ");

		if (username != null && username.trim().length() > 0) {
			sb.append("and userinfo.usersName like ?");
			listparam.add("%" + username + "%");
		}
		if (mintime != null) {
			sb.append("and jcTime>=?");
			listparam.add(mintime);
		}
		if (maxtime != null) {
			sb.append(" and jcTime<=?");
			listparam.add(maxtime);
		}
		sb.append(" and usersId=?");
		listparam.add(id);

		String sumHQL = "select count(*) from Jingcaiorder" + sb.toString();
		List sumList = hqldao.query(sumHQL, listparam.toArray());

		Object obj = sumList.get(0);
		int sum = Integer.parseInt(obj.toString());

		if (sum < 1)
			return new HashMap();

		String hql = "from Jingcaiorder" + sb.toString();
		List list = hqldao.query(hql, listparam.toArray());

		Map map = new HashMap();
		map.put("sum", sum);
		map.put("list", list);
		return map;

	}

	// 根据竞猜订单ID查找竞猜订单详情
	public Map getXiangqingById(String id) {
		String hql = "from Jingcaiorderdetail where jcid=?";
		List list = hqldao.query(hql, id);
		Map map = new HashMap();
		map.put("list", list);
		return map;
	}

	/* 通过ID查所有订单 */
	public Map findAllOrderbyId(Timestamp begintime, Timestamp endtime,
			String orOrdernumber, int id) {
		StringBuffer sb = new StringBuffer();
		List paramList = new ArrayList();
		sb.append(" where 1=1 ");
		if (begintime != null) {
			sb.append(" and orTime>=?");
			paramList.add(begintime);
		}
		if (endtime != null) {
			sb.append(" and orTime<=?");
			paramList.add(endtime);
		}
		if (orOrdernumber != null && orOrdernumber.trim().length() > 0) {
			sb.append(" and orOrdernumber like ?");
			paramList.add("%" + orOrdernumber + "%");
		}
		sb.append(" and usersId=?");
		paramList.add(id);
		String sumhql = "select count(*) from Goodsorders g" + sb.toString();
		int sum = (int) hqldao.unique(sumhql, paramList.toArray());

		String hql = "from Goodsorders " + sb.toString();
		List list = hqldao.query(hql, paramList.toArray());
		Map map = new HashMap();
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}

	// 查询订单详情
	public Map getOrderdetaiById(String id) {
		String hql = "from Goodsorderdetail g join fetch g.goodsorders where g.goodsorders.orId= "
				+ Integer.parseInt(id);
		List list = hqldao.query(hql);
		Map map = new HashMap();
		map.put("list", list);
		return map;
	}
}

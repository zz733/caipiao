package com.service.admin;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.dao.RechargerecordDAO;

/*
 * @author xch
 * 
 * */

@Service
public class RechargerecordService {

	@Autowired
	private RechargerecordDAO rechargerecordDAO;

	@Autowired
	private HQLDAO hqldao;

	/*
	 * 查询所有充值记录
	 */
	public Map getAllrechargerecord(String username, Timestamp mintime,
			Timestamp maxtime) {
		StringBuffer sb = new StringBuffer();
		List listparam = new ArrayList();
		sb.append(" where 1=1 ");

		if (username != null && username.trim().length() > 0) {
			sb.append("and userinfo.usersName like ?");
			listparam.add("%" + username + "%");
		}
		if (mintime != null) {
			sb.append("and rrTime>=?");
			listparam.add(mintime);
		}
		if (maxtime != null) {
			sb.append(" and rrTime<=?");
			listparam.add(maxtime);
		}

		String sumHQL = "select count(*) from Rechargerecord" + sb.toString();
		List sumList = hqldao.query(sumHQL, listparam.toArray());
		Object obj = sumList.get(0);
		int sum = Integer.parseInt(obj.toString());

		if (sum < 1)
			return new HashMap();

		// int count = sum%size==0 ? sum/size : sum/size+1;
		//
		// //越界检查
		// if(page<1) page=1;
		// if(page>count) page=count;

		String hql = "from Rechargerecord" + sb.toString();
		List list = hqldao.query(hql, listparam.toArray());

		Map map = new HashMap();
		// map.put("size", size);
		// map.put("page", page);
		// map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}

	/*
	 * 
	 * 查询所有会员开通记录
	 */

	public Map getAllviprecord(String username, Timestamp mintime,
			Timestamp maxtime) {
		StringBuffer sb = new StringBuffer();
		List listparam = new ArrayList();

		sb.append(" where 1=1 ");

		if (username != null && username.trim().length() > 0) {
			sb.append("and userinfo.usersName like ?");
			listparam.add("%" + username + "%");
		}
		if (mintime != null) {
			sb.append("and vipTime>=?");
			listparam.add(mintime);
		}
		if (maxtime != null) {
			sb.append(" and vipTime<=?");
			listparam.add(maxtime);
		}

		String sumHQL = "select count(*) from Viprecord" + sb.toString();
		List sumList = hqldao.query(sumHQL, listparam.toArray());
		Object obj = sumList.get(0);
		int sum = Integer.parseInt(obj.toString());

		if (sum < 1)
			return new HashMap();

		// int count = sum%size==0 ? sum/size : sum/size+1;
		//
		// //越界检查
		// if(page<1) page=1;
		// if(page>count) page=count;

		String hql = "from Viprecord" + sb.toString();
		List list = hqldao.query(hql, listparam.toArray());

		Map map = new HashMap();
		// map.put("size", size);
		// map.put("page", page);
		// map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}

}

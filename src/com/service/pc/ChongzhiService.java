package com.service.pc;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.dao.RechargerecordDAO;
import com.dao.ViprecordDAO;

@Service
public class ChongzhiService {
	@Autowired
	private RechargerecordDAO rechargerecordDAO;
	@Autowired
	private ViprecordDAO viprecordDAO;
	@Autowired
	private HQLDAO hqldao;

	public Map getByIdchongzhirecord(String username, Timestamp mintime,
			Timestamp maxtime, Integer id) {
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
		sb.append(" and usersId=?");
		listparam.add(id);

		String sumHQL = "select count(*) from Rechargerecord" + sb.toString();
		List sumList = hqldao.query(sumHQL, listparam.toArray());
		Object obj = sumList.get(0);
		int sum = Integer.parseInt(obj.toString());

		if (sum < 1)
			return new HashMap();

		String hql = "from Rechargerecord" + sb.toString();
		List list = hqldao.query(hql, listparam.toArray());

		Map map = new HashMap();
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}

}

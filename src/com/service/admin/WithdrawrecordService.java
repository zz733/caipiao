package com.service.admin;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.dao.UserinfoDAO;
import com.dao.WithdrawrecordDAO;
import com.pojo.Userinfo;
/*
 * @author xch
 * 
 * */
import com.pojo.Withdrawrecord;

@Service
public class WithdrawrecordService {

	@Autowired
	private WithdrawrecordDAO withdrawrecordDAO;
	@Autowired
	private UserinfoDAO userinfoDAO;

	@Autowired
	private HQLDAO hqldao;

	/*
	 * 查询所有提现记录
	 */
	public Map getAllWithdrawrecord(String username, Timestamp mintime,
			Timestamp maxtime) {
		StringBuffer sb = new StringBuffer();
		List listparam = new ArrayList();
		sb.append(" where 1=1 ");

		if (username != null && username.trim().length() > 0) {
			sb.append("and userinfo.usersName like ?");
			listparam.add("%" + username + "%");
		}
		if (mintime != null) {
			sb.append("and wrTime>=?");
			listparam.add(mintime);
		}
		if (maxtime != null) {
			sb.append(" and wrTime<=?");
			listparam.add(maxtime);
		}
		sb.append(" and wrStatus=2");
		String sumHQL = "select count(*) from Withdrawrecord" + sb.toString();
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

		String hql = "from Withdrawrecord" + sb.toString();
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
	 * 查询提现申请
	 */
	public Map getAllTixianrecord(String username, Timestamp mintime,
			Timestamp maxtime) {
		StringBuffer sb = new StringBuffer();
		List listparam = new ArrayList();
		sb.append(" where 1=1 ");

		if (username != null && username.trim().length() > 0) {
			sb.append("and userinfo.usersName like ?");
			listparam.add("%" + username + "%");
		}
		if (mintime != null) {
			sb.append("and wrTime>=?");
			listparam.add(mintime);
		}
		if (maxtime != null) {
			sb.append(" and wrTime<=?");
			listparam.add(maxtime);
		}
		sb.append("and wrStatus=0");

		String sumHQL = "select count(*) from Withdrawrecord" + sb.toString();
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

		String hql = "from Withdrawrecord" + sb.toString();
		List list = hqldao.query(hql, listparam.toArray());

		Map map = new HashMap();
		// map.put("size", size);
		// map.put("page", page);
		// map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;

	}

	// 根据提现ID查询提现记录
	public Map getTixianjilu(String id) {
		String hql = "from  Withdrawrecord where wrid=?";
		List list = hqldao.query(hql, id);
		Map map = new HashMap();
		map.put("list", list);
		return map;
	}

	// 根据提现ID查询提现记录
	public Withdrawrecord findByidtotixianjilu(int id) {
		return withdrawrecordDAO.findById(id);
	}

	// 修改提现状态
	public Withdrawrecord updateStatus(int id) {
		Withdrawrecord withdrawrecord = withdrawrecordDAO.findById(id);
		int status = withdrawrecord.getWrStatus();
		if (withdrawrecord != null) {
			withdrawrecord.setWrStatus(2);
			withdrawrecordDAO.save(withdrawrecord);
		}
		return withdrawrecord;
	}

	/* 批量审批 */
	public void MostupdateGsatus0(String wrid) {
		String hql = "update Withdrawrecord set wrStatus=2  where wrId in("
				+ wrid + ")";
		hqldao.bulkUpdate(hql);
	}

	// 查询用户信息
	public Userinfo findByid(int id) {
		return userinfoDAO.findById(id);
	}
}

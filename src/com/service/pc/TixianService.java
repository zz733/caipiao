package com.service.pc;

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
import com.pojo.Withdrawrecord;

@Service
public class TixianService {

	@Autowired
	private WithdrawrecordDAO withdrawrecordDAO;
	@Autowired
	private UserinfoDAO userinfoDAO;

	@Autowired
	private HQLDAO hqldao;

	// 添加一条微信提现记录
	public void addwxtxOrder(int id, String money, Timestamp tixiantime,
			String Dingdanhao, String openID, int txtype) {
		Userinfo userinfo = userinfoDAO.findById(id);
		Double oldfubei = userinfo.getUsersFubei();// 得到原来的福贝
		Double money2 = 0.0;
		if (money.trim() != null) {
			money2 = Double.parseDouble(money);
		}
		Withdrawrecord tixian = new Withdrawrecord();
		tixian.setUserinfo(userinfo);
		tixian.setWrMoney(money2);
		tixian.setWrStatus(0); // 提现状态
		tixian.setWrTxtpye(txtype);
		tixian.setWrWeiXin(openID); // 微信号
		tixian.setWrDingdanhao(Dingdanhao);
		tixian.setWrTime(tixiantime);
		withdrawrecordDAO.save(tixian);
		userinfo.setUsersFubei(oldfubei - money2 * 10);
		userinfoDAO.save(userinfo);

	}

	// 添加一条支付宝提现记录
	public void addzfbtxOrder(int id, String money, Timestamp tixiantime,
			String Dingdanhao, String zfbhao, int txtype) {
		Userinfo userinfo = userinfoDAO.findById(id);
		Double oldfubei = userinfo.getUsersFubei();// 得到原来的福贝
		Double money2 = 0.0;
		if (money.trim() != null) {
			money2 = Double.parseDouble(money);
		}
		Withdrawrecord tixian = new Withdrawrecord();
		tixian.setUserinfo(userinfo);
		tixian.setWrMoney(money2);
		tixian.setWrStatus(0); // 提现状态
		tixian.setWrTxtpye(txtype);
		tixian.setWrZhifubao(zfbhao); // 支付宝号号
		tixian.setWrDingdanhao(Dingdanhao);
		tixian.setWrTime(tixiantime);
		withdrawrecordDAO.save(tixian);
		userinfo.setUsersFubei(oldfubei - money2 * 10);
		userinfoDAO.save(userinfo);

	}

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
}

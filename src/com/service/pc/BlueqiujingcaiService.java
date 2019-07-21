package com.service.pc;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.dao.JingcaiorderDAO;
import com.dao.JingcaiorderdetailDAO;
import com.dao.UserinfoDAO;
import com.pojo.Jingcaiorder;
import com.pojo.Jingcaiorderdetail;
import com.pojo.Userinfo;

/**
 * 
 * @author 肖
 * 
 */

@Service
public class BlueqiujingcaiService {

	@Autowired
	private HQLDAO hqldao;

	@Autowired
	private JingcaiorderdetailDAO jingcaiorderdetailDAO;
	@Autowired
	private JingcaiorderDAO jingcaiorderDAO;
	@Autowired
	private UserinfoDAO userinfoDAO;

	// 查询最大期数
	public List getMaxQishu() {
		String hql = "select max(k.kjQishu) from Kaijiang k";
		List list = hqldao.query(hql);
		return list;
	}

	// 生成一个竞猜订单
	public void addjingcaidingdan(String ddh, Double fubei,
			Timestamp jingcaitime, List<Jingcaiorderdetail> list, int id,
			String qishu) {
		Userinfo user = userinfoDAO.findById(id);
		Double oldFubei = user.getUsersFubei(); // 原本的福贝
		System.out.println("old:"+oldFubei);
		System.out.println("new:"+fubei);
		if (user != null) {
			Jingcaiorder jingcaiorder = new Jingcaiorder();
			jingcaiorder.setJcFubei(fubei);
			jingcaiorder.setJcQishu(qishu);
			jingcaiorder.setJcNumber(ddh);
			jingcaiorder.setJcTime(jingcaitime);
			jingcaiorder.setUserinfo(user);
			jingcaiorderDAO.save(jingcaiorder);

			int jcid = jingcaiorder.getJcId();
			Jingcaiorder jcid2 = jingcaiorderDAO.findById(jcid);
			for (Jingcaiorderdetail jingcai : list) {
				Jingcaiorderdetail jingcaiorderdetail = new Jingcaiorderdetail();
				jingcaiorderdetail.setJingcaiorder(jcid2);
				jingcaiorderdetail.setJcodCost(jingcai.getJcodCost());
				jingcaiorderdetail.setJcodNum(jingcai.getJcodNum());
				jingcaiorderdetail.setJcodValue(jingcai.getJcodValue());
				jingcaiorderdetail.setJcodType(jingcai.getJcodType());
				jingcaiorderdetail.setJcodWinning(0);
				jingcaiorderdetailDAO.save(jingcaiorderdetail);
			}
			user.setUsersFubei(oldFubei - fubei);
			userinfoDAO.merge(user);
		}

	}
}

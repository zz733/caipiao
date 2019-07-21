package com.service.admin;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.dao.JingcaiorderDAO;
import com.dao.JingcaiorderdetailDAO;
import com.dao.KaijiangDAO;
import com.dao.RechargerecordDAO;
import com.dao.UserinfoDAO;
import com.dindan.GenerateNum;
import com.pojo.Jingcaiorderdetail;
import com.pojo.Kaijiang;
import com.pojo.Rechargerecord;
import com.pojo.Userinfo;

/**
 * 
 * @author xch
 * 
 */
@Service
public class KaijiangService {

	@Autowired
	private KaijiangDAO kaijiangDAO;

	@Autowired
	private JingcaiorderDAO jingcaiorderDAO;

	@Autowired
	private JingcaiorderdetailDAO jingcaiorderdetailDAO;

	@Autowired
	private UserinfoDAO userinfoDAO;

	@Autowired
	private RechargerecordDAO rechargerecordDAO;

	@Autowired
	private HQLDAO hqldao;
	
	public int updateKaiJiang(Kaijiang kaijiang){
//		String hql = "update from Kaijiang set kjRedone =? and kjRedtwo=? and kjRedthree=? and kjRedfour=? and kjRedfive=? and kjRedsix=? and kjBlue=? where kjQishu = ? ";
//		int n = hqldao.update(hql, p);
		kaijiangDAO.merge(kaijiang);
				
		return 1;
	}
	
	/*
	 * 根据id查询中奖纪录*/
	public List getKaiJiangById(int id){
		String hql = "from Kaijiang where kjId = ?";
		List list=hqldao.findByHQL(hql, id);
		return list;
	}
	
	/**
	 * 批量删除
	 */
	public void plShanChu(String kjId){
		String hql = "delete from Kaijiang where kjId in ("+kjId+")";
		hqldao.bulkUpdate(hql);
	}
	/*
	 * 查询所有中奖记录
	 */
	public Map getAllzhongjiang(String username, Timestamp mintime,
			Timestamp maxtime) {
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

		String sumHQL = "select count(*) from Jingcaiorder" + sb.toString();
		List sumList = hqldao.query(sumHQL, listparam.toArray());

		Object obj = sumList.get(0);
		int sum = Integer.parseInt(obj.toString());

		if (sum < 1)
			return new HashMap();

		String hql = "from Jingcaiorder" + sb.toString();
		List list = hqldao.query(hql, listparam.toArray());

		Map map = new HashMap();
		// map.put("size", size);
		// map.put("page", page);
		// map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;

	}

	// 根据订单ID查找订单详情
	public Map getXiangqingById(String id) {
		String hql = "from Jingcaiorderdetail where jcid=?";
		List list = hqldao.query(hql, id);
		Map map = new HashMap();
		map.put("list", list);
		return map;
	}

	// 查询所有往期开奖
	public Map getAllkaijiang(String kjQishu, Timestamp mintime,
			Timestamp maxtime) {
		StringBuffer sb = new StringBuffer();
		List listparam = new ArrayList();
		sb.append(" where 1=1 ");

		if (kjQishu != null && kjQishu.trim().length() > 0) {
			sb.append("and kjQishu like ?");
			listparam.add("%" + kjQishu + "%");
		}
		if (mintime != null) {
			sb.append("and kjTime>=?");
			listparam.add(mintime);
		}
		if (maxtime != null) {
			sb.append(" and kjTime<=?");
			listparam.add(maxtime);
		}

		String sumHQL = "select count(*) from Kaijiang" + sb.toString();
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

		String hql = "from Kaijiang" + sb.toString() + " order by kjId desc";
		List list = hqldao.query(hql, listparam.toArray());

		Map map = new HashMap();
		// map.put("size", size);
		// map.put("page", page);
		// map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}

	// 查询最大期数
	public List getMaxQishu() {
		String hql = "select max(k.kjQishu) from Kaijiang k";
		List list = hqldao.query(hql);
		return list;
	}

	// 球号入库 每期开奖写入数据库
	public void addqiuhao(Kaijiang kaijiang) {
		kaijiangDAO.save(kaijiang);
	}

	// 根据蓝球,期数 判断中奖的人并修改中奖状态 ---->再给中奖用户充值
	public void updatejcodWinning(String qishu, String dsdx, String blueqiu2,
			String yusan) {
		// 查询所有中奖人并修改中奖状态
		String hql = "update Jingcaiorderdetail set jcodWinning=1 where  jingcaiorder.jcId in (select J.jcId from Jingcaiorder J where jcQishu=? ) and jcodValue=? or jcodValue=? or jcodValue=?";
		hqldao.bulkUpdate(hql, qishu, dsdx, blueqiu2, yusan);
		// 查询所有中奖人的金额和赔率
		String hql2 = " from Jingcaiorderdetail where jingcaiorder.jcId in (select J.jcId from Jingcaiorder J where jcQishu=? ) and jcodWinning=1";
		List<Jingcaiorderdetail> list = hqldao.query(hql2, qishu);
		for (Jingcaiorderdetail j : list) {
			// 给中奖用户充值
			Userinfo users = userinfoDAO.findById(j.getJingcaiorder()
					.getUserinfo().getUsersId());
			Double oldFubei = users.getUsersFubei(); // 原本的福贝
			if (users != null) {
				// 新增一条充值记录
				Rechargerecord rechargerecord = new Rechargerecord();
				Date date = new Date();
				String ddh = "sunjob"
						+ GenerateNum.getInstance().GenerateOrder(); // 生成订单号

				rechargerecord.setRrDingdanhao(ddh); // 订单号
				rechargerecord.setRrMoney(j.getJcodCost() * j.getJcodNum()); // 充值金额
				rechargerecord.setRrType(2); // 充值类型 2：竞猜中奖

				SimpleDateFormat sdf = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				String time = sdf.format(date);
				rechargerecord.setRrTime(Timestamp.valueOf(time)); // 充值时间
				rechargerecord.setUserinfo(users); // 充值的用户
				rechargerecord.setRrStatus(1); // 充值成功

				rechargerecordDAO.save(rechargerecord);
				users.setUsersFubei(oldFubei
						+ (j.getJcodCost() * j.getJcodNum()));
				userinfoDAO.save(users);
			}
		}

	}
}

package com.service.admin;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.GoodsDAO;
import com.dao.GoumairecordDAO;
import com.dao.HQLDAO;
import com.pojo.Goods;
import com.pojo.GoumaiRecord;

@Service
public class GoumairecordService {

	@Autowired
	private GoumairecordDAO goumairecordDAO;
	@Autowired
	private GoodsDAO goodsDAO;

	@Autowired
	private HQLDAO hqldao;

	/** 通过支付宝订单编号以及购买状态查找到购买的商品对象 */
	/** 查询所有购买记录 */
	public Goods getGoumairecordByOrderId(String orderId) {
		/** 是否存在这样一条购买记录 */
		StringBuffer sb = new StringBuffer();
		sb.append(" from GoumaiRecord where 1=1 ");
		if (orderId != null && orderId.trim().length() > 0) {
			sb.append(" and gmZfbdingdan=").append("'"+orderId+"'");
		}
		sb = sb.append(" and gmStatus=1 ");
		GoumaiRecord goumaiRecord = (GoumaiRecord) hqldao.query(sb.toString(),
				null).get(0);
		/** 如果存在这样一条购买记录的话 */
		if (goumaiRecord != null) {
			return goodsDAO.findById(goumaiRecord.getGoods().getGid());
		}
		return null;
	}

	/** 通过通过用户编号和商品编号以及购买状态查找到购买的商品对象 */
	public Goods getGoumairecordByGidAndUserid(String gid, String userid) {
		/** 是否存在这样一条购买记录 */
		StringBuffer sb = new StringBuffer();
		sb.append(" from GoumaiRecord where 1=1");
		if (userid != null && userid.trim().length() > 0) {
			sb.append(" and userinfo.usersId=").append(userid);
		}
		if (gid != null && gid.trim().length() > 0) {
			sb.append(" and goods.gid=").append(gid);
		}
		sb = sb.append(" and gmStatus=1 ");
		List list = hqldao.query(sb.toString(), null);
		/** 如果存在这样一条购买记录的话，则进行查找其商品 */
		if (list != null && list.size() > 0) {
			return goodsDAO.findById(Integer.parseInt(gid));
		}
		return null;
	}

	/** 查询所有购买记录 */
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

	/** 查询所有用户购买的记录 */
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

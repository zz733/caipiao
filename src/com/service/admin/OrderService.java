package com.service.admin;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.GoodsordersDAO;
import com.dao.HQLDAO;
import com.dao.PeisongcorpDAO;
import com.dao.UserinfoDAO;
import com.pojo.Goodsorders;
import com.pojo.Peisongcorp;

/**
 * 
 * @author yzh
 * 
 */
@Service
public class OrderService {
	@Autowired
	private HQLDAO hqlDAO;

	@Autowired
	private UserinfoDAO userinfoDAO;

	@Autowired
	private GoodsordersDAO goodsordersDAO;

	@Autowired
	private PeisongcorpDAO peisongcorpDAO;

	// public static void main(String[] args) {
	// ApplicationContext applicationContext = new
	// ClassPathXmlApplicationContext("app*.xml");
	// OrderService orderService =
	// applicationContext.getBean(OrderService.class);
	// Map map = orderService.getAllOrder();
	// System.out.println(Goodsorders.userinfo.usersEndtime);
	// }
	/* 根据订单id查订单 并且查询 物流信息 */
	public Map findOrderById(int orId) {
		String hql = "from Goodsorders where orId=?";
		List list = hqlDAO.query(hql, orId);
		String hql2 = "from Peisongcorp where pscStatus=?";
		List pslist = hqlDAO.query(hql2, 1);
		Map map = new HashMap();
		map.put("list", list);
		map.put("pslist", pslist);
		return map;
	}

	// 查询所有订单分页
	public Map getAllOrder() {
		String sumHQL = "select count(*) from Goodsorders";
		int sum = (int) hqlDAO.unique(sumHQL);
		String hql = "from Goodsorders";
		List list = hqlDAO.query(hql);
		Map map = new HashMap();
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}

	// 根据订单状态查询订单
	public Map getAllOrderByStatus(String orStatus) {
		int status = Integer.parseInt(orStatus);
		String sumHQL = "select count(*) from Goodsorders where orStatus= "
				+ status;
		int sum = (int) hqlDAO.unique(sumHQL);
		String hql = "from Goodsorders where orStatus= " + status;
		List<Goodsorders> list = hqlDAO.query(hql);
		Map map = new HashMap();
		map.put("sum", sum);
		map.put("list", list);
		return map;

	}

	/* 查所有订单分页 */
	public Map finAllOrder(Timestamp begintime, Timestamp endtime,
			String usersName) {

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
		if (usersName != null && usersName.trim().length() > 0) {
			sb.append(" and g.userinfo.usersName like ?");
			paramList.add("%" + usersName + "%");
		}
		String sumhql = "select count(*) from Goodsorders g" + sb.toString();
		int sum = (int) hqlDAO.unique(sumhql, paramList.toArray());

		String hql = "from Goodsorders g join fetch g.userinfo "
				+ sb.toString() + " order by orTime desc";
		List list = hqlDAO.query(hql, paramList.toArray());
		Map map = new HashMap();
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}

	// 根据查询条件查询订单
	public Map finOrder(int status, String beginDate, String endDate,
			String usersName) {
		StringBuffer sb = new StringBuffer();
		List paramList = new ArrayList();
		sb.append(" where 1=1 and orStatus= " + status);
		if (beginDate != null && beginDate.trim().length() > 0) {
			Timestamp begin = Timestamp.valueOf(beginDate + " 00:00:00 ");
			sb.append(" and orTime>=? ");
			paramList.add(begin);
		}
		if (endDate != null && endDate.trim().length() > 0) {
			Timestamp end = Timestamp.valueOf(endDate + " 23:59:59 ");
			sb.append(" and orTime<=? ");
			paramList.add(end);
		}

		if (usersName != null && usersName.trim().length() > 0) {
			sb.append("and g.userinfo.usersName like ?");
			paramList.add("%" + usersName + "%");
		}
		String sumhql = "select count(*) from Goodsorders g" + sb.toString();
		int sum = (int) hqlDAO.unique(sumhql, paramList.toArray());
		String hql = "from Goodsorders g join fetch g.userinfo "
				+ sb.toString() + " order by orTime desc";
		List list = hqlDAO.query(hql, paramList.toArray());
		Map map = new HashMap();
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}

	// 修改订单状态
	public Goodsorders goodsorders(int orid, int pscid, String psnumber) {
		Peisongcorp peisongcorp = peisongcorpDAO.findById(pscid);
		Goodsorders goodsorders = goodsordersDAO.findById(orid);
		goodsorders.setOrRecipient(psnumber);
		goodsorders.setOrStatus(3);
		goodsorders.setPeisongcorp(peisongcorp);
		goodsordersDAO.save(goodsorders);
		return goodsorders;
	}
}

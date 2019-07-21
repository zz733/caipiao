package com.service.pc;

import java.lang.reflect.Field;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AddressDAO;
import com.dao.GoodsDAO;
import com.dao.GoodsorderdetailDAO;
import com.dao.GoodsordersDAO;
import com.dao.HQLDAO;
import com.dao.UserinfoDAO;
import com.pojo.Address;
import com.pojo.Goods;
import com.pojo.Goodsorderdetail;
import com.pojo.Goodsorders;
import com.pojo.Userinfo;

@Service
public class FubeigouwuService {

	@Autowired
	private HQLDAO hqlDAO;
	@Autowired
	private GoodsDAO goodsDAO;
	@Autowired
	private UserinfoDAO userinfoDAO;
	@Autowired
	private GoodsordersDAO goodsordersDAO;
	@Autowired
	private GoodsorderdetailDAO goodsorderdetailDAO;
	@Autowired
	private AddressDAO addressDAO;

	public List getAllGoods() {
		String hql = "from Goods where  gstatus=1 order by gbegin desc ";
		List list = hqlDAO.query(hql);
		return list;
	}

	public Map getGoodsdetail(int id) throws IllegalArgumentException,
			Exception {
		String hql = "from Goods where gid=?";
		String hql2 = "select new Goods(g.gimages,g.gimages2,g.gimages3,g.gimages4,g.gimages5) from Goods g where gid=?";
		List list = hqlDAO.query(hql, id);
		List list2 = hqlDAO.query(hql2, id);
		Map map = new HashMap();
		map.put("list", list);
		map.put("list2", list2);
		// System.out.println(list.get(0));
		// System.out.println(list2.get(0));
		return map;
	}

	public Map getGoodsdetail2(int id) throws IllegalArgumentException,
			Exception {
		String hql = "from Goods where gid=?";
		String hql2 = "select new Goods(g.gimages,g.gimages2,g.gimages3,g.gimages4,g.gimages5) from Goods g where gid=?";
		List list = hqlDAO.query(hql, id);
		List list2 = hqlDAO.query(hql2, id);
		Map map = new HashMap();
		map.put("goods", list.get(0));
		map.put("list2", list2);
		// System.out.println(list.get(0));
		// System.out.println(list2.get(0));
		return map;
	}

	// 得到用户的收货地址
	public List getuserRess(int userid) {
		String hql = "from Address where usersId=?";
		List list = hqlDAO.query(hql, userid);
		return list;
	}

	// 得到商品信息
	public Goods goodsfindByid(int id) {
		return goodsDAO.findById(id);
	}

	// 添加一条兑换记录
	public void addduihuandingdan(int goodid, int userid, double money,
			int num, int adid, String ddh, Timestamp orderTime) {
		Userinfo user = userinfoDAO.findById(userid);// 用户对象
		Goods goods = goodsDAO.findById(goodid);// 商品对象
		Address address = addressDAO.findById(adid);// 收货地址
		Double oldFubei = user.getUsersFubei(); // 原本的福贝
		Goodsorders gs = new Goodsorders();
		gs.setUserinfo(user);// 用户
		gs.setOrFubei(money);// 金额
		gs.setOrStatus(1); // 设置状态为已付款
		gs.setOrTime(orderTime);// 下单时间
		gs.setOrOrdernumber(ddh);// 商品订单
		gs.setAddress(address);// 收货地址
		gs.setOrTotalnum(num);// 总数量
		goodsordersDAO.save(gs);

		int orid = gs.getOrId();// 获取订单ID
		Goodsorders goodsorders = goodsordersDAO.findById(orid); // 查找订单对象
		Goodsorderdetail goodsdetail = new Goodsorderdetail();
		goodsdetail.setOdNum(num);// 数量
		goodsdetail.setGoodsorders(goodsorders);// 订单对象
		goodsdetail.setGoods(goods); // 商品对象
		goodsdetail.setOdCost(money);// 金额
		goodsorderdetailDAO.save(goodsdetail);

		user.setUsersFubei(oldFubei - money); // 扣除对应的福贝

		userinfoDAO.save(user);

		// 库存-1
		Integer oldKuchun = goods.getKuchun();
		if (oldKuchun != null && oldKuchun > 0) {
			goods.setKuchun(oldKuchun - 1);
		}

		// 销量+1
		Integer oldXiaoliang = goods.getLeijixiaoshou();
		if (oldXiaoliang == null)
			oldXiaoliang = 0;

		goods.setLeijixiaoshou(oldXiaoliang + 1);

		goodsDAO.merge(goods);
	}
}

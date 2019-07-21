package com.service.admin;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.action.JccsConfig;
import com.dao.GoumairecordDAO;
import com.dao.HQLDAO;
import com.dao.RechargerecordDAO;
import com.dao.UserinfoDAO;
import com.dao.ViprecordDAO;
import com.dindan.GenerateNum;
import com.pojo.Goods;
import com.pojo.GoumaiRecord;
import com.pojo.Rechargerecord;
import com.pojo.Userinfo;
import com.pojo.Viprecord;

@Service
public class DailiAlipayService {
	@Autowired
	private HQLDAO hqldao;
	@Autowired
	private UserinfoDAO userinfoDAO;
	@Autowired
	private RechargerecordDAO rechargerecordDAO;
	@Autowired
	private GoumairecordDAO goumairecordDAO;
	@Autowired
	private ViprecordDAO viprecordDAO;

	// 得到用户信息
	public Userinfo findByid(int id) {
		return userinfoDAO.findById(id);
	}

	/** 通过用户的id和商品的id来进行查找支付视频订单，如果依旧存在这样的订单，但是未付款，则依旧使用该条订单 */
	public GoumaiRecord selectExistRecord(Userinfo userinfo, Goods goods) {
		String hql = "from GoumaiRecord where goods.gid=" + goods.getGid()
				+ " and userinfo.usersId=" + userinfo.getUsersId();
		GoumaiRecord goumaiRecord = (GoumaiRecord) hqldao.query(hql, null);
		return goumaiRecord;
	}

	// 添加一条支付宝购买记录
	public void addGoumaiOrder(Userinfo userinfo, Goods goods, String orderId,
			String money, Timestamp ordertime) {
		/*
		 * GoumaiRecord goumaiRecord=selectExistRecord(userinfo, goods);
		 * if(goumaiRecord!=null){ return ; }
		 */

		Double money2 = 0.0;
		if (money.trim() != null) {
			money2 = Double.parseDouble(money);
		}
		String ddh = "bcy" + GenerateNum.getInstance().GenerateOrder(); // 生成订单号
		GoumaiRecord chongzhi = new GoumaiRecord();
		chongzhi.setGmDingdanhao(ddh); // 本地订单号
		chongzhi.setGmZfbdingdan(orderId); // 支付宝订单号
		chongzhi.setUserinfo(userinfo);// 购买用户
		chongzhi.setGoods(goods);// 购买的商品对象
		chongzhi.setGmMoney(money2);// 购买金额
		chongzhi.setGmTime(ordertime);// 购买时间
		chongzhi.setGmType(0);// 购买类型
		chongzhi.setGmStatus(0);// 购买状态
		goumairecordDAO.save(chongzhi);
	}

	// 添加一条微信购买记录
	public void addWXGoumaiOrder(Userinfo userinfo, Goods goods,
			String orderId, String money, Timestamp ordertime) {
		/*
		 * GoumaiRecord goumaiRecord=selectExistRecord(userinfo, goods);
		 * if(goumaiRecord!=null){ return ; }
		 */
		Double money2 = 0.0;
		if (money.trim() != null) {
			money2 = Double.parseDouble(money);
		}
		String ddh = "bcy" + GenerateNum.getInstance().GenerateOrder(); // 生成订单号
		GoumaiRecord chongzhi = new GoumaiRecord();
		chongzhi.setGmDingdanhao(ddh); // 本地订单号
		chongzhi.setGmWxdingdan(orderId); // 微信订单号
		chongzhi.setUserinfo(userinfo);// 购买用户
		chongzhi.setGoods(goods);// 购买的商品对象
		chongzhi.setGmMoney(money2);// 购买金额
		chongzhi.setGmTime(ordertime);// 购买时间
		chongzhi.setGmType(1);// 购买类型
		chongzhi.setGmStatus(0);// 购买状态
		goumairecordDAO.save(chongzhi);
	}

	// 支付宝/微信异步通知 修改购买支付订单状态
	public String updateZhifuOrderStatus(String orderId, Double money) {
		System.out.println("----------------修改购买支付订单状态----------------");
		System.out.println("orderId###=" + orderId);
		System.out.println("money###=" + money);
		GoumaiRecord goumairecord = (GoumaiRecord) goumairecordDAO
				.findByGmZfbdingdan(orderId).get(0);
		System.out.println("支付金额：" + goumairecord.getGmMoney());
		Userinfo userinfo = goumairecord.getUserinfo();
		System.out.println("用户名：" + userinfo.getUsersName());
		if (goumairecord.getGmMoney().equals(money) && money > 0) {
			goumairecord.setGmStatus(1); // 充值状态
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			goumairecord.setGmTime(timestamp); // 充值时间
			goumairecordDAO.save(goumairecord);
			userinfoDAO.save(userinfo);
			return "success";
		} else {
			return "failed";
		}
	}

	// 添加一条支付宝充值记录
	public void addOrder(Userinfo userinfo, String orderId, String money,
			Timestamp ordertime) {
		Double money2 = 0.0;
		if (money.trim() != null) {
			money2 = Double.parseDouble(money);
		}
		JccsConfig jccsConfig = new JccsConfig();
		double bili = Double.parseDouble(jccsConfig.getFubei()) / 100;// 获得充值赠送福贝
																		// 比例
		String ddh = "bcy" + GenerateNum.getInstance().GenerateOrder(); // 生成订单号
		Rechargerecord chongzhi = new Rechargerecord();
		chongzhi.setRrDingdanhao(ddh); // 本地订单号
		chongzhi.setRrZfbdingdan(orderId); // 支付宝订单号
		chongzhi.setUserinfo(userinfo);// 充值用户
		chongzhi.setRrMoney(money2);// 充值金额
		chongzhi.setRrTime(ordertime);// 充值时间
		chongzhi.setRrType(0);// 充值类型
		chongzhi.setRrStatus(0);// 充值状态
		chongzhi.setRrPresent(money2 * bili);
		rechargerecordDAO.save(chongzhi);
	}

	// 添加一条微信充值记录
	public void addwxOrder(Userinfo userinfo, String orderId, String money,
			Timestamp ordertime) {
		Double money2 = 0.0;
		if (money.trim() != null) {
			money2 = Double.parseDouble(money);
		}
		String ddh = "bcy" + GenerateNum.getInstance().GenerateOrder(); // 生成订单号
		Rechargerecord chongzhi = new Rechargerecord();
		chongzhi.setRrDingdanhao(ddh); // 本地订单号
		chongzhi.setRrWxdingdan(orderId); // 微信订单号
		chongzhi.setUserinfo(userinfo);// 充值用户
		chongzhi.setRrMoney(money2);// 充值金额
		chongzhi.setRrTime(ordertime);// 充值时间
		chongzhi.setRrType(1);// 充值类型
		chongzhi.setRrStatus(0);// 充值状态
		rechargerecordDAO.save(chongzhi);
	}

	// 添加一条会员充值记录 支付宝
	public void addVIPOrder(Userinfo userinfo, String orderId, String money,
			Timestamp vipEndtime, Timestamp vipBegintime, int day) {
		Double money2 = 0.0;
		if (money.trim() != null) {
			money2 = Double.parseDouble(money);
		}

		String ddh = "bcy" + GenerateNum.getInstance().GenerateOrder(); // 生成订单号
		Viprecord vip = new Viprecord();
		vip.setUserinfo(userinfo);// 充值用户
		vip.setVipTime(vipBegintime);// 开通时间
		vip.setVipEndtime(vipEndtime); // 结束时间
		vip.setVipDay(day);// 开通天数
		vip.setVipCztype(0); // 充值方式 0：支付宝
		vip.setVipZfbdingdan(orderId);// 支付宝订单号
		vip.setVipCost(money2);// 会员开通金额
		vip.setVipStatus(0); // 开通状态
		viprecordDAO.save(vip);
	}

	// 添加一条会员充值记录 微信
	public void addVIPOrderwx(Userinfo userinfo, String orderId, String money,
			Timestamp vipEndtime, Timestamp vipBegintime, int day) {
		Double money2 = 0.0;
		if (money.trim() != null) {
			money2 = Double.parseDouble(money);
		}

		String ddh = "bcy" + GenerateNum.getInstance().GenerateOrder(); // 生成订单号
		Viprecord vip = new Viprecord();
		vip.setUserinfo(userinfo);// 充值用户
		vip.setVipTime(vipBegintime);// 开通时间
		vip.setVipEndtime(vipEndtime); // 结束时间
		vip.setVipDay(day);// 开通天数
		vip.setVipCztype(1); // 充值方式 1：微信
		vip.setVipWxdingdan(orderId);// 微信订单号
		vip.setVipCost(money2);// 会员开通金额
		vip.setVipStatus(0); // 开通状态
		viprecordDAO.save(vip);

	}

	// 支付宝异步通知 修改福贝充值订单状态
	public String updateOrderStatus(String orderId, Double money) {
		System.out.println("orderId###=" + orderId);
		System.out.println("money###=" + money);
		Rechargerecord rechargerecord = (Rechargerecord) rechargerecordDAO
				.findByRrZfbdingdan(orderId).get(0);
		System.out.println("充值金额：" + rechargerecord.getRrMoney());
		Userinfo userinfo = rechargerecord.getUserinfo();
		System.out.println("用户名：" + userinfo.getUsersName());
		JccsConfig jccsConfig = new JccsConfig();
		double bili = Double.parseDouble(jccsConfig.getFubei());// 获得充值赠送福贝
		double zengsongfb = money * bili; // 比例
		if (rechargerecord.getRrMoney().equals(money) && money > 0) {
			rechargerecord.setRrStatus(1); // 充值状态
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			rechargerecord.setRrTime(timestamp); // 充值时间
			rechargerecordDAO.save(rechargerecord);
			Double double1 = userinfo.getUsersFubei();// 得到用户原来的福贝
			System.out.println(double1);
			userinfo.setUsersFubei(double1 + zengsongfb);
			userinfoDAO.save(userinfo);
			return "success";
		} else {
			return "failed";
		}
	}

	// 微信异步通知 修改福贝充值订单状态
	public String updateOrderStatuswx(String orderId, Double money) {
		System.out.println("orderId###=" + orderId);
		System.out.println("money###=" + money);
		Rechargerecord rechargerecord = (Rechargerecord) rechargerecordDAO
				.findByRrWxdingdan(orderId).get(0);
		System.out.println("充值金额：" + rechargerecord.getRrMoney());
		Userinfo userinfo = rechargerecord.getUserinfo();
		System.out.println("用户名：" + userinfo.getUsersName());
		JccsConfig jccsConfig = new JccsConfig();
		double bili = Double.parseDouble(jccsConfig.fubei);// 获得充值赠送福贝
		double zengsongfb = money * bili + money * 10; // 比例
		if (rechargerecord.getRrMoney().equals(money) && money > 0) {
			rechargerecord.setRrStatus(1); // 充值状态
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			rechargerecord.setRrTime(timestamp); // 充值时间
			rechargerecordDAO.save(rechargerecord);
			Double double1 = userinfo.getUsersFubei();// 得到用户原来的福贝
			System.out.println(double1);
			userinfo.setUsersFubei(double1 + zengsongfb);
			userinfoDAO.save(userinfo);
			return "success";
		} else {
			return "failed";
		}
	}

	// 支付宝异步通知 修改会员充值订单状态
	public String updateVIPStatus(String orderId, Double money) {
		System.out.println("orderId###=" + orderId);
		System.out.println("money###=" + money);
		Viprecord viprecord = (Viprecord) viprecordDAO.findByVipZfbdingdan(
				orderId).get(0);
		System.out.println("充值会员金额：" + viprecord.getVipCost());
		Userinfo userinfo = viprecord.getUserinfo();
		System.out.println("用户名：" + userinfo.getUsersName());
		if (viprecord.getVipCost().equals(money) && money > 0) {
			viprecord.setVipStatus(1); // 充值状态
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			viprecordDAO.save(viprecord);
			userinfo.setUsersType(1);
			userinfo.setUsersBegintime(viprecord.getVipTime());
			userinfo.setUsersEndtime(viprecord.getVipEndtime());
			userinfoDAO.save(userinfo);
			return "success";
		} else {
			return "failed";
		}
	}

	// 微信异步通知 修改会员充值订单状态
	public String updateVIPStatuswx(String orderId, Double money) {
		System.out.println("orderId###=" + orderId);
		System.out.println("money###=" + money);
		Viprecord viprecord = (Viprecord) viprecordDAO.findByVipWxdingdan(
				orderId).get(0);
		System.out.println("充值会员金额：" + viprecord.getVipCost());
		Userinfo userinfo = viprecord.getUserinfo();
		System.out.println("用户名：" + userinfo.getUsersName());
		if (viprecord.getVipCost().equals(money) && money > 0) {
			viprecord.setVipStatus(1); // 充值状态
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			viprecordDAO.save(viprecord);
			userinfo.setUsersType(1);
			userinfo.setUsersBegintime(viprecord.getVipTime());
			userinfo.setUsersEndtime(viprecord.getVipEndtime());
			Double double1 = userinfo.getUsersFubei();// 得到用户原来的福贝
			userinfo.setUsersFubei(double1 + money * 10);
			userinfoDAO.merge(userinfo);
			return "success";
		} else {
			return "failed";
		}
	}

	// 查找微信福贝充值记录
	public String chongzhiSearch(String orderId, Double money) {
		// TODO Auto-generated method stub
		if (orderId != null) {
			Rechargerecord rechargerecord = (Rechargerecord) rechargerecordDAO
					.findByRrWxdingdan(orderId).get(0);
			System.out.println("dsdsdsd=" + rechargerecord.getRrWxdingdan());
			if (rechargerecord != null) {
				Double money2 = rechargerecord.getRrMoney();
				System.out.println("money22=" + money2);
				if (money.equals(money2)) {
					System.out.println(rechargerecord.getRrStatus());
					if (rechargerecord.getRrStatus() == 1) {
						return "czsuccess";
					}
				}
			}
		}
		return "failed";

	}

	// 查找微信购买记录
	public String GoumaiSearch(String orderId, Double money) {
		// 如果订单号不为空
		if (orderId != null) {
			// 通过微信的订单号进行查找有没有该条记录返回list集合
			List list = goumairecordDAO.findByGmWxdingdan(orderId);
			
			//如果存在这样一条订单号，则继续往下判断
			if (list != null && list.size() >= 1) {
				GoumaiRecord goumaiRecord = (GoumaiRecord) goumairecordDAO.findByGmWxdingdan(orderId).get(0);
				System.out.println("微信支付订单号=" + goumaiRecord.getGmWxdingdan());
				if (goumaiRecord != null) {
					Double money2 = goumaiRecord.getGmMoney();
					System.out.println("money22=" + money2);
					
					//判断该订单的金额是否一致
					if (money.equals(money2)) {
						System.out.println("购买状态："+goumaiRecord.getGmStatus());
						
						//判断该条订单记录是否付款
						if (goumaiRecord.getGmStatus() == 1) {
							return "czsuccess";
						}
					}
				}
			} 
		}
		return "failed";
	}

	// 微信 VIP充值
	public String chongzhiSearch2(String orderId, Double money) {
		// TODO Auto-generated method stub
		if (orderId != null) {
			Viprecord viprecord = (Viprecord) viprecordDAO.findByVipWxdingdan(
					orderId).get(0);
			System.out.println("dsdsdsd=" + viprecord.getVipWxdingdan());
			if (viprecord != null) {
				Double money2 = viprecord.getVipCost();
				System.out.println("money22=" + money2);
				if (money.equals(money2)) {
					System.out.println(viprecord.getVipStatus());
					if (viprecord.getVipStatus() == 1) {
						return "czsuccess";
					}
				}
			}
		}
		return "failed";

	}
}

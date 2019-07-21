package com.action.admin;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.action.JccsConfig;
import com.pojo.Goods;
import com.pojo.Userinfo;
import com.service.admin.DailiAlipayService;
import com.service.admin.GoodsService;

@Controller
@RequestMapping("/dailichongzhi.do")
public class DailiAlipayAction {
	@Autowired
	private DailiAlipayService dailiAlipayService;

	@Autowired
	private GoodsService goodsService;
	
	// 购买支付
	@RequestMapping(params = "p=alizhifu")
	public String Zhifu(HttpServletRequest request,
			HttpServletResponse response) {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		int id = userinfo.getUsersId(); // 得到支付用户的ID
		//得到商品对象的id
		String gid=request.getParameter("gid");
		List<Goods> list=goodsService.getGoodById(gid);
		
		Userinfo userinfo2 = dailiAlipayService.findByid(id);
		String money = request.getParameter("docVlGender"); // 得到支付金额
		String type = request.getParameter("radio1"); // 得到支付类型
		int type2 = Integer.parseInt(type);

		if (type2 == 2) { // 当类型为2时，跳支付宝页面充值
			String money2 = null;
			if (money.trim() != null) {
				money2 = money;
			}
			String payId = UUID.randomUUID().toString().replace("-", "");
			// 产生订单号
			Timestamp orderTime = new Timestamp(System.currentTimeMillis());
			dailiAlipayService.addGoumaiOrder(userinfo2,list.get(0), payId, money, orderTime);
			return "/pc/mingshijiangyan/pay/alipay/alipayapi.jsp?money=" + money2 + "&payId="
					+ payId + "&target=_blank";
		} else {
			// 否则为微信支付
			String money2 = null;
			if (money.trim() != null) {
				money2 = money;
			}
			String payId = UUID.randomUUID().toString().replace("-", "");
			// 产生订单号
			Timestamp orderTime = new Timestamp(System.currentTimeMillis());
			dailiAlipayService.addWXGoumaiOrder(userinfo2,list.get(0), payId, money, orderTime);
			return "redirect:/weixinPay.do?p=toPay2&payId=" + payId + "&money="
					+ money2;
		}
	}
	
	// 微信支付购买
	@RequestMapping(params = "p=zhifuSearch")
	@ResponseBody
	public String ZhifuSearch(HttpServletRequest request,
			HttpServletResponse response) {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute("userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		String orderId = request.getParameter("orderId");
		String money = request.getParameter("money");
		System.out.println("ID=" + orderId);
		System.out.println("money=" + money);
		Double money2 = 0.0;
		if (money != null || money.trim().length() == 0) {
			money2 = Double.parseDouble(money);
		}
		System.out.println("money2=" + money2);
		String searchResult = dailiAlipayService.GoumaiSearch(orderId, money2);
		return searchResult;
	}
	
	// 福贝充值
	@RequestMapping(params = "p=alichongzhi")
	public String Chongzhi(HttpServletRequest request,
			HttpServletResponse response) {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		int id = userinfo.getUsersId(); // 得到充值用户的ID
		Userinfo userinfo2 = dailiAlipayService.findByid(id);
		String money = request.getParameter("docVlGender"); // 得到充值金额
		//String money = "0.01";
		String type = request.getParameter("radio1"); // 得到充值类型
		int type2 = Integer.parseInt(type);

		if (type2 == 2) { // 当类型为2时，跳支付宝页面充值
			String money2 = null;
			if (money.trim() != null) {
				money2 = money;
			}
			String payId = UUID.randomUUID().toString().replace("-", "");
			// 产生订单号
			Timestamp orderTime = new Timestamp(System.currentTimeMillis());
			dailiAlipayService.addOrder(userinfo2, payId, money, orderTime);
			return "/pay/alipay/alipayapi.jsp?money=" + money2 + "&payId="
					+ payId + "&target=_blank";
		} else {
			// 否则为微信支付
			String money2 = null;
			if (money.trim() != null) {
				money2 = money;
			}
			String payId = UUID.randomUUID().toString().replace("-", "");
			// 产生订单号
			Timestamp orderTime = new Timestamp(System.currentTimeMillis());
			dailiAlipayService.addwxOrder(userinfo2, payId, money, orderTime);
			return "redirect:/weixinPay.do?p=toPay&payId=" + payId + "&money="
					+ money2;
		}
	}
	
	// 会员充值
	@RequestMapping(params = "p=vipchongzhi")
	public String vipChongzhi(HttpServletRequest request,
			HttpServletResponse response) {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");

		String money = request.getParameter("docVlGender"); // 得到充值金额
		// String money = "0.01";
		System.out.println("充值金额" + money);
		Double VIPmoney = Double.parseDouble(money);
		String type = request.getParameter("radio1"); // 得到充值类型
		System.out.println(type);
		int type2 = Integer.parseInt(type);
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu_sm.jsp";
		}
		int id = userinfo.getUsersId(); // 得到充值用户的ID
		Userinfo userinfo2 = dailiAlipayService.findByid(id);
		Timestamp uservipEndtime = userinfo2.getUsersEndtime(); // 得到用户会员到期时间
		Timestamp nowtime = new Timestamp(System.currentTimeMillis());// 得到现在时间
		Timestamp vipBegintime = null; // 会员开始时间
		long t1 = 0;
		long t2 = nowtime.getTime();
		if (uservipEndtime != null) {
			t1 = uservipEndtime.getTime();
		}
		if (t1 == 0) { // 如果用户以前没有开通过会员
			vipBegintime = new Timestamp(System.currentTimeMillis()); // 从现在时间开始
		} else if (t1 > t2) {// 如果会员到期时间大于现在时间 说明用户 VIP还没到期
			vipBegintime = uservipEndtime; // 从用户的到期时间开始算
		} else { // 否则为用户的VIP已经过期
			vipBegintime = new Timestamp(System.currentTimeMillis());// 从现在时间开始计算

		}
		Calendar c = Calendar.getInstance();
		c.setTime(vipBegintime);

		JccsConfig jccsConfig = new JccsConfig(); // 得到会员开通价格
		Double sanyue = Double.parseDouble(jccsConfig.vipsanyue);
		Double yinian = Double.parseDouble(jccsConfig.vipyinian);
		Double twonian = Double.parseDouble(jccsConfig.viptwonian);
		int day = 0;
		if (VIPmoney.equals(sanyue)) {

			c.add(Calendar.MONTH, 3);// 加3月
			day = 30;

		} else if (VIPmoney.equals(yinian)) {
			c.add(Calendar.YEAR, 1);// 加1年
			day = 365;
		} else if (VIPmoney.equals(twonian)) {
			c.add(Calendar.YEAR, 2);// 加2年
			day = 730;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String vipEndtime = sdf.format(c.getTime()); // 会员结束时间
		String vipBegintime2 = sdf.format(vipBegintime); // 会员开始时间
		System.out.println("会员开始时间" + vipBegintime2);
		Timestamp vipEndtime2 = Timestamp.valueOf(vipEndtime);
		Timestamp vipBegintime3 = Timestamp.valueOf(vipBegintime2);
		System.out.println(vipBegintime3);
		if (type2 == 2) { // 当类型为2时，跳支付宝页面充值

			String money2 = null;
			if (money.trim() != null) {
				money2 = money;
			}
			String payId = UUID.randomUUID().toString().replace("-", "");// 产生订单号
			dailiAlipayService.addVIPOrder(userinfo2, payId, money,
					vipEndtime2, vipBegintime3, day);
			return "/pc/fubeichongzhi/alipay/alipayapi.jsp?money=" + money2
					+ "&payId=" + payId + "";
		} else {

			// 否则为微信支付
			String money2 = null;
			if (money.trim() != null) {
				money2 = money;
			}
			String payId = UUID.randomUUID().toString().replace("-", "");
			// 产生订单号
			System.out.println(vipEndtime2);
			System.out.println("day" + day);
			System.out.println(vipBegintime3);
			Timestamp orderTime = new Timestamp(System.currentTimeMillis());
			dailiAlipayService.addVIPOrderwx(userinfo2, payId, money,
					vipEndtime2, vipBegintime3, day);
			return "redirect:/weixinPayVIP.do?p=toPayVIP&payId=" + payId
					+ "&money=" + money;

		}

	}

	// 微信冲福贝
	@RequestMapping(params = "p=chongzhiSearch")
	@ResponseBody
	public String ChongzhiSearch(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		String orderId = request.getParameter("orderId");
		String money = request.getParameter("money");
		System.out.println("ID=" + orderId);
		System.out.println("money=" + money);
		Double money2 = 0.0;
		if (money != null || money.trim().length() == 0) {
			money2 = Double.parseDouble(money);
		}
		System.out.println("money2=" + money2);
		String searchResult = dailiAlipayService
				.chongzhiSearch(orderId, money2);
		return searchResult;
	}

	// 微信冲会员
	@RequestMapping(params = "p=chongzhiSearch2")
	@ResponseBody
	public String ChongzhiSearch2(HttpServletRequest request,
			HttpServletResponse response) {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		String orderId = request.getParameter("orderId");
		String money = request.getParameter("money");
		System.out.println("ID=" + orderId);
		System.out.println("money=" + money);
		Double money2 = 0.0;
		if (money != null || money.trim().length() == 0) {
			money2 = Double.parseDouble(money);
		}
		System.out.println("money2=" + money2);
		String searchResult = dailiAlipayService.chongzhiSearch2(orderId,
				money2);
		return searchResult;
	}
}

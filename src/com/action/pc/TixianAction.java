package com.action.pc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dindan.GenerateNum;
import com.pojo.Userinfo;
import com.service.pc.TixianService;
import com.util.StringUtil;

@Controller
@RequestMapping("/tixian.do")
public class TixianAction {
	@Autowired
	private TixianService tixianService;

	// 提现申请
	@RequestMapping(params = "p=addtixianrecord")
	public String addtixianrecord(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		PrintWriter out = response.getWriter();
		String money = request.getParameter("docVlGender"); // 得到提现金额
		String type = request.getParameter("radio1"); // 得到充值类型
		int id = userinfo.getUsersId(); // 得到用户的ID
		int type2 = Integer.parseInt(type);
		System.out.println(money);
		if (type2 == 1) { // 当类型为1时，微信提现
			int txtype = 1;
			String openID = userinfo.getUsersWeixinOpenid(); // 得到用户绑定的微信
			System.out.println(openID);
			if (openID == null) { // 如果为空 提醒用户绑定微信
				System.out.println("WEIXIN");
				out.print("bdwx");
				return null;
			}
			String money2 = null;
			if (money.trim() != null) {
				money2 = money;
			}
			String Dingdanhao = "bcytx"
					+ GenerateNum.getInstance().GenerateOrder();// 提现订单号
			Timestamp tixiantime = new Timestamp(System.currentTimeMillis()); // 提现时间
			tixianService.addwxtxOrder(id, money2, tixiantime, Dingdanhao,
					openID, txtype);
			out.print("true");

		} else {
			// 否则为支付宝提现
			int txtype = 0; // 提现类型
			String zfbhao = userinfo.getUsersZhifubao(); // 得到用户绑定的支付宝
			System.out.println(zfbhao);
			if (zfbhao == null) { // 如果为空 提醒用户绑定微信
				System.out.println("ZHIFUBAO");
				out.print("bdzfb");
				return null;
			}
			String money2 = null;
			if (money.trim() != null) {
				money2 = money;
			}
			String Dingdanhao = "bcytx"
					+ GenerateNum.getInstance().GenerateOrder();// 提现订单号
			Timestamp tixiantime = new Timestamp(System.currentTimeMillis()); // 提现时间
			tixianService.addzfbtxOrder(id, money2, tixiantime, Dingdanhao,
					zfbhao, txtype);
			out.print("true");

		}

		return null;
	}

	// 所有提现记录
	@RequestMapping(params = "p=Alltixianrecord")
	public String Alltixianrecord(HttpServletRequest request,
			HttpServletResponse response) {

		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		// int page = 1;
		// int size = 1;
		String pageString = request.getParameter("page");
		String sizeString = request.getParameter("size");
		String username = request.getParameter("usersName");
		String mindate = request.getParameter("mintime");
		Timestamp mintime = null;
		if (StringUtil.isNotNull(mindate) && mindate.trim().length() > 0)
			mintime = Timestamp.valueOf(mindate + " 00:00:00");
		String maxdate = request.getParameter("maxtime");
		Timestamp maxtime = null;
		if (StringUtil.isNotNull(maxdate) && maxdate.trim().length() > 0)
			maxtime = Timestamp.valueOf(maxdate + " 23:59:59");
		// if (pageString != null && pageString.trim().length()>0)
		// page = Integer.parseInt(pageString);
		// if (sizeString != null && sizeString.trim().length()>0)
		// size = Integer.parseInt(sizeString);
		Map tixianjilumap = tixianService.getAllWithdrawrecord(username,
				mintime, maxtime);
		request.setAttribute("tixianjilumap", tixianjilumap);
		return "/pc/gerenzhongxin/fubeitixian.jsp";
	}

}

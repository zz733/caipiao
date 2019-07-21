package com.action.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import weixin.popular.redbag.RedbagApi;

import com.alipay.util.AliPayUtil;
import com.pojo.Admin;
import com.pojo.Userinfo;
import com.pojo.Withdrawrecord;
import com.service.admin.WithdrawrecordService;
import com.util.StringUtil;

@Controller
@RequestMapping("/tixianrecord.do")
public class WithdrawrecordAction {
	@Autowired
	private WithdrawrecordService withdrawrecordService;

	// 所有提现记录
	@RequestMapping(params = "p=Alltixianrecord")
	public String Allchongzhirecord(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
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
		Map tixianjilumap = withdrawrecordService.getAllWithdrawrecord(
				username, mintime, maxtime);
		request.setAttribute("tixianjilumap", tixianjilumap);
		return "/admin/tixian/Alltixian.jsp";
	}

	// 所有提现申请
	@RequestMapping(params = "p=Allshenqingrecord")
	public String AllTixianrecord(HttpServletRequest request,
			HttpServletResponse response) {

		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
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
		Map tixianshenqingmap = withdrawrecordService.getAllTixianrecord(
				username, mintime, maxtime);
		request.setAttribute("tixianshenqingmap", tixianshenqingmap);
		return "/admin/tixian/TixianApply.jsp";
	}

	// 根据提现单号跳到打款页面
	@RequestMapping(params = "p=findBywrid")
	public String dakuan(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String id = request.getParameter("id");
		Map xiangqingmap = withdrawrecordService.getTixianjilu(id);
		request.setAttribute("xiangqingmap", xiangqingmap);
		return "/admin/tixian/dakuan.jsp";
	}

	// 微信提现打款给用户
	@RequestMapping(params = "p=DakuanTouser")
	public String WXDakuanTouser(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		PrintWriter out = response.getWriter();
		Logger logger = Logger.getRootLogger();
		int uid = Integer.parseInt(request.getParameter("uid")); // 得到提现用户ID
		Userinfo userinfo = withdrawrecordService.findByid(uid);// 得到用户对象
		int id = Integer.parseInt(request.getParameter("id")); // 提现订单ID
		Withdrawrecord ww = withdrawrecordService.findByidtotixianjilu(id);// 根据ID得到提现记录
		Double money = ww.getWrMoney(); // 得到提现金额
		System.out.println(money);
		int txtype = ww.getWrTxtpye(); // 得到提现类型
		int status = ww.getWrStatus(); // 得到打款状态
		if (status == 1) { // 如果已打款 提示已打款
			out.print("ydk");

		} else {
			if (txtype == 1) { // 微信打款
				String opid = ww.getWrWeiXin(); // 打款账号
				System.out.println(opid);
				boolean sendMoney = new RedbagApi().sendMoney("肖程虎", opid,
						"0.1"); // 得到打款返回的结果 true 修改订单状态
				System.out.println(sendMoney);
				logger.error(sendMoney);
				if (sendMoney == true) {
					withdrawrecordService.updateStatus(id);
					out.print("true");
				} else {
					out.print("false");
				}

			} else { // 否则为支付宝打款
				String zfbzhanghao = userinfo.getUsersZhifubao(); // 支付宝账号
				String zfbname = userinfo.getUsersZhifubaoName(); // 支付宝真实姓名
				String jieguo = new AliPayUtil().pay2persion(zfbzhanghao,
						zfbname, "1");
				System.out.println(jieguo);
				logger.error(jieguo);
				if (jieguo == "true") {
					withdrawrecordService.updateStatus(id);
					out.print("true");
				} else {
					out.print("false");
				}
			}
		}
		return null;
	}

	// 修改提现状态
	// @RequestMapping(params = "p=UpdateTxStatus")
	// public String UpdateTxStatus(HttpServletRequest request,
	// HttpServletResponse response) {
	// Admin admin = (Admin) request.getSession().getAttribute("admin");
	// if (admin == null) {
	// return "/admin/login.jsp";
	// }
	// String id = request.getParameter("id");
	// Withdrawrecord withdrawrecord = withdrawrecordService.updateStatus(id);
	// return "/admin/tixian/TixianApply.jsp";
	// }

	/* 批量审批 */
	@RequestMapping(params = "p=MostupdateWrStatus")
	public String MostupdateWrStatus(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String wrid = request.getParameter("wrid");
		withdrawrecordService.MostupdateGsatus0(wrid);
		return null;
	}
}

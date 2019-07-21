package com.action.pc;

import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Userinfo;
import com.service.pc.ShiyongService;
import com.util.StringUtil;

@Controller
@RequestMapping("/shiyong.do")
public class ShiyongAction {

	@Autowired
	private ShiyongService shiyongService;

	// 根据用户ID查询竞猜记录
	@RequestMapping(params = "p=FindByIdjcjl")
	public String Allzhongjiangjilurecord(HttpServletRequest request,
			HttpServletResponse response) {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		int page = 1;
		int size = 1;
		String pageString = request.getParameter("page");
		String sizeString = request.getParameter("size");
		String username = request.getParameter("usersName");
		String mindate = request.getParameter("mintime");
		int id = Integer.parseInt(request.getParameter("id"));

		Timestamp mintime = null;
		if (StringUtil.isNotNull(mindate) && mindate.trim().length() > 0)
			mintime = Timestamp.valueOf(mindate + " 00:00:00");
		String maxdate = request.getParameter("maxtime");
		Timestamp maxtime = null;
		if (StringUtil.isNotNull(maxdate) && maxdate.trim().length() > 0)
			maxtime = Timestamp.valueOf(maxdate + " 23:59:59");
		if (pageString != null && pageString.trim().length() > 0)
			page = Integer.parseInt(pageString);
		if (sizeString != null && sizeString.trim().length() > 0)
			size = Integer.parseInt(sizeString);
		Map shiyongmap = shiyongService.FindByIdjingcai(username, mintime,
				maxtime, id);
		request.setAttribute("shiyongmap", shiyongmap);
		return "/pc/gerenzhongxin/fubeishiyong.jsp";
	}

	// 中奖详情
	@RequestMapping(params = "p=FindByIdzhongjiangxiangqing")
	public String zhongjiangxiangqing(HttpServletRequest request,
			HttpServletResponse response) {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		String id = request.getParameter("id");
		Map xiangqingmap = shiyongService.getXiangqingById(id);
		request.setAttribute("xiangqingmap", xiangqingmap);
		return "/pc/gerenzhongxin/fubeishiyongxiangqing.jsp";

	}

	// 查询用户 兑换商品的记录
	@RequestMapping(params = "p=FindByIdduihuan")
	public String FindByIdduihuan(HttpServletRequest request,
			HttpServletResponse response) {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		String orOrdernumber = request.getParameter("usersName");
		String mindate = request.getParameter("mintime");
		Timestamp mintime = null;
		if (StringUtil.isNotNull(mindate) && mindate.trim().length() > 0)
			mintime = Timestamp.valueOf(mindate + " 00:00:00");
		String maxdate = request.getParameter("maxtime");
		Timestamp maxtime = null;
		if (StringUtil.isNotNull(maxdate) && maxdate.trim().length() > 0)
			maxtime = Timestamp.valueOf(maxdate + " 23:59:59");
		int id = userinfo.getUsersId();
		Map map = shiyongService.findAllOrderbyId(mintime, maxtime,
				orOrdernumber, id);
		request.setAttribute("map", map);
		return "/pc/gerenzhongxin/fubeiduihuanjilu.jsp";
	}

	// 查询订单详情
	@RequestMapping(params = "p=getOrderdetailByorId")
	public String getOrderdetailByorId(HttpServletRequest request,
			HttpServletResponse response) {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		String id = request.getParameter("id");
		Map map = shiyongService.getOrderdetaiById(id);
		request.setAttribute("map", map);
		return "/pc/gerenzhongxin/fubeiduihuanxiangqing.jsp";
	}
}

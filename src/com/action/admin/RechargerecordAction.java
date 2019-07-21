package com.action.admin;

import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Admin;
import com.service.admin.RechargerecordService;
import com.util.StringUtil;

/**
 * 
 * @author 肖
 * 
 */

@Controller
@RequestMapping("/rechargerecord.do")
public class RechargerecordAction {
	@Autowired
	private RechargerecordService rechargerecordService;

	/* 查询所有会员开通记录 */
	@RequestMapping(params = "p=Allchongzhirecord")
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
		Map chongzhimap = rechargerecordService.getAllrechargerecord(username,
				mintime, maxtime);
		request.setAttribute("chongzhimap", chongzhimap);
		return "/admin/chongzhi/Allchongzhi.jsp";
	}

	@RequestMapping(params = "p=Allviprecord")
	public String Allviprecord(HttpServletRequest request,
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

		Map viprecordmap = rechargerecordService.getAllviprecord(username,
				mintime, maxtime);
		request.setAttribute("viprecordmap", viprecordmap);
		return "/admin/chongzhi/Vipchongzhi.jsp";
	}
}

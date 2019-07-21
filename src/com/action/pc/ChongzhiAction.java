package com.action.pc;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.action.JccsConfig;
import com.pojo.Userinfo;
import com.service.pc.ChongzhiService;
import com.util.StringUtil;

@Controller
@RequestMapping("/chongzhi.do")
public class ChongzhiAction {
	@Autowired
	private ChongzhiService chongzhiService;

	// 通过ID获得用户的充值记录
	@RequestMapping(params = "p=FindByIdchongzhirecord")
	public String Allviprecord(HttpServletRequest request,
			HttpServletResponse response) {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
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

		Map chongzhirecordmap = chongzhiService.getByIdchongzhirecord(username,
				mintime, maxtime, id);
		request.setAttribute("chongzhirecordmap", chongzhirecordmap);
		return "/pc/gerenzhongxin/fubeichongzhi.jsp";
	}

	// VIP充值 得到vip价格到VIP充值页面
	@RequestMapping(params = "p=vipchongzhi")
	public String vipchongzhijiage(HttpServletRequest request,
			HttpServletResponse response) {
		JccsConfig jccsConfig = new JccsConfig();

		Map csmap = new HashMap();
		String sanyue = jccsConfig.getVipsanyue();
		String yinian = jccsConfig.getVipyinian();
		String twonian = jccsConfig.getViptwonian();
		csmap.put("sanyue", sanyue);
		csmap.put("yinian", yinian);
		csmap.put("twonian", twonian);
		request.setAttribute("csmap", csmap);
		return "pc/fubeichongzhi/vipchongzhi.jsp";
	}

	// 用户充值
	// @RequestMapping(params = "p=vipchongzhi")
	// public String vipchongzhi(HttpServletRequest request,
	// HttpServletResponse response) {
	// Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
	// "userinfo");
	// if (userinfo == null) {
	// return "/pc/yonghudenglu/denglu.jsp";
	// }
	// String money = request.getParameter("docVlGender"); // 得到充值金额
	// String type = request.getParameter("radio1"); // 得到充值类型
	// System.out.println(money);
	// System.out.println(type);
	// return "null";
	// }
}

package com.action.admin;

import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.pojo.Goodsorders;
import com.service.admin.OrderService;
import com.util.StringUtil;

/**
 * 
 * @author yzh 商品订单管理
 * 
 */

@Controller
@RequestMapping("/order.do")
public class OrderAction {
	@Autowired
	private OrderService orderService;

	@Autowired
	private HttpServletRequest request;

	@RequestMapping(params = "p=getAllOrder")
	public String getAllOrder() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String orStatus = request.getParameter("statusID");
		if ("1".equals(orStatus)) {
			Map map = orderService.getAllOrderByStatus(orStatus);
			request.setAttribute("map", map);

			return "admin/Orders/YfkOrder.jsp";
		}
		if ("2".equals(orStatus)) {
			Map map = orderService.getAllOrderByStatus(orStatus);
			request.setAttribute("map", map);

			return "admin/Orders/DfhOrder.jsp";
		}
		if ("3".equals(orStatus)) {
			Map map = orderService.getAllOrderByStatus(orStatus);
			request.setAttribute("map", map);

			return "admin/Orders/YfhOrder.jsp";
		}
		if ("4".equals(orStatus)) {
			Map map = orderService.getAllOrderByStatus(orStatus);
			request.setAttribute("map", map);

			return "admin/Orders/YwcOrder.jsp";
		}
		Map map = orderService.getAllOrder();
		request.setAttribute("map", map);
		return "admin/Orders/AllOrder.jsp";

	}

	/* 全部订单 */
	@RequestMapping(params = "p=finOrder")
	public String finOrder() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}

		String beginDate = request.getParameter("beginDate"); // 开始日期
		String endDate = request.getParameter("endDate"); // 结束日期
		String usersName = request.getParameter("usersName"); // 用户id

		Timestamp begintime = null;
		if (StringUtil.isNotNull(beginDate) && beginDate.trim().length() > 0)
			begintime = Timestamp.valueOf(beginDate + " 00:00:00");

		Timestamp endtime = null;
		if (StringUtil.isNotNull(endDate) && endDate.trim().length() > 0)
			endtime = Timestamp.valueOf(endDate + " 23:59:59");

		Map map = orderService.finAllOrder(begintime, endtime, usersName);
		request.setAttribute("map", map);
		return "admin/Orders/AllOrder.jsp";
	}

	/* 已付款订单 */
	@RequestMapping(params = "p=finOrder1")
	public String finOrder1() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}

		int status = 1;
		String beginDate = request.getParameter("beginDate"); // 开始日期
		String endDate = request.getParameter("beginDate"); // 结束日期
		String usersName = request.getParameter("usersName"); // 用户id
		Map map = orderService.finOrder(status, beginDate, endDate, usersName);
		request.setAttribute("map", map);
		return "admin/Orders/YfkOrder.jsp";
	}

	/* 待发货订单 */
	@RequestMapping(params = "p=finOrder2")
	public String finOrder2() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}

		int status = 2;
		String beginDate = request.getParameter("beginDate"); // 开始日期
		String endDate = request.getParameter("beginDate"); // 结束日期
		String usersName = request.getParameter("usersName"); // 用户id
		Map map = orderService.finOrder(status, beginDate, endDate, usersName);
		request.setAttribute("map", map);
		return "admin/Orders/DfhOrder.jsp";
	}

	/* 已发货订单 */
	@RequestMapping(params = "p=finOrder3")
	public String finOrder3() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}

		String beginDate = request.getParameter("beginDate"); // 开始日期
		String endDate = request.getParameter("beginDate"); // 结束日期
		String usersName = request.getParameter("usersName"); // 用户id
		int status = 3;

		Map map = orderService.finOrder(status, beginDate, endDate, usersName);
		request.setAttribute("map", map);
		return "admin/Orders/YfhOrder.jsp";
	}

	/* 已完成订单 */
	@RequestMapping(params = "p=finOrder4")
	public String finOrder4() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}

		String beginDate = request.getParameter("beginDate"); // 开始日期
		String endDate = request.getParameter("beginDate"); // 结束日期
		String usersName = request.getParameter("usersName"); // 用户id
		int status = 4;

		Map map = orderService.finOrder(status, beginDate, endDate, usersName);
		request.setAttribute("map", map);
		return "admin/Orders/YwcOrder.jsp";
	}

	/* 根据订单id查找订单 */
	@RequestMapping(params = "p=findOrderById")
	public String findOrderById() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int orId = Integer.parseInt(request.getParameter("orid"));
		Map map = orderService.findOrderById(orId);
		request.setAttribute("map", map);
		return "admin/Orders/Addwuliu.jsp";
	}

	// 根据订单ID去修改订单状态
	@RequestMapping(params = "p=updateState")
	@ResponseBody
	public String updateState() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int orId = Integer.parseInt(request.getParameter("orderid"));
		String psnumber = request.getParameter("psnumber");
		int pscorpid = Integer.parseInt(request.getParameter("pscorp"));
		Goodsorders goodsorders = orderService.goodsorders(orId, pscorpid,
				psnumber);
		if (goodsorders != null) {
			return "ture";
		}
		return "false";
	}

}

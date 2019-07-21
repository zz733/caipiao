package com.action.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Admin;
import com.service.admin.OrderdetailService;

/**
 * 
 * @author yzh
 *
 */
@Controller
@RequestMapping("/Orderdetail.do")
public class OrderdetailAction {
	
	@Autowired
	private OrderdetailService orderdetailService;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping(params="p=getOrderdetailByorId")
	public String getOrderdetailByorId(){
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		String id = request.getParameter("orId");
		Map map = orderdetailService.getOrderdetaiById(id);
		request.setAttribute("map", map);
		return "admin/Orders/OrderDetail.jsp";
	}
}

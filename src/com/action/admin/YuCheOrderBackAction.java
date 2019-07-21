package com.action.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.service.admin.YucheBackService;
import com.service.admin.YucheOrderService;

@Controller
@RequestMapping("/yucheOrder.do")
public class YuCheOrderBackAction {

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private YucheOrderService yucheOrderService;

	@Autowired
	private YucheBackService yucheBackService;

	/**
	 * 分页搜
	 * @param usersPhone  用户编号
	 * @param beginTime   开始时间
	 * @param endTime     结束时间
	 * @param orderId     订单号
	 * @param payType     支付类型 1支付宝  2微信
	 * @param zonjiang    中奖0未  1中奖 2示中奖
	 * @param type        彩票类型 
	 * @param qishu       彩票期数  
	 * @param page
	 * @param size
	 * @return
	 */
	@RequestMapping(params = "p=fenye")
	public String fenye(String usersPhone, String beginTime, String endTime,
			String orderId, Integer payType, Integer zonjiang, Integer type,
			Integer op,
			String qishu, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int size) {
		Admin admin1 = (Admin) request.getSession().getAttribute("admin");
		if (admin1 == null) {
			return "/admin/login.jsp";
		}

		Map map = yucheOrderService.fenye(usersPhone, beginTime, endTime,
				orderId, payType, zonjiang, type, qishu, page, size,op);
		request.setAttribute("map", map);
		
		if (op!=null && op==2)
		{
			return "/admin/caipiao_yuche_order/msg.jsp";
		}

		List list = yucheBackService.getAllCaipiaoType();
		request.setAttribute("list", list);

		return "/admin/caipiao_yuche_order/show.jsp";
	}
	
	//中奖
	@RequestMapping(params="p=zongjiang")
	@ResponseBody
	public String zongjiang(int id)
	{
		Admin admin1 = (Admin) request.getSession().getAttribute("admin");
		if (admin1 == null) {
			return "no login";
		}
		
		boolean result = yucheOrderService.zonjiang(id);
		return result+"";
	}
	
	//未中奖
	@RequestMapping(params="p=unzongjiang")
	@ResponseBody
	public String unzongjiang(int id)
	{
		Admin admin1 = (Admin) request.getSession().getAttribute("admin");
		if (admin1 == null) {
			return "no login";
		}
		
		String result = yucheOrderService.unzonjiang(id);
		return result;
	}
	
	

}

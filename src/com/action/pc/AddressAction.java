package com.action.pc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Address;
import com.pojo.Userinfo;
import com.service.pc.AddressService;

@Controller
@RequestMapping("/address.do")
public class AddressAction {

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private AddressService addressService;

	@ResponseBody
	@RequestMapping(params = "p=setMoren")
	public String setMoren() {
		int id = Integer.parseInt(request.getParameter("id"));
		addressService.setMoren(id);
		return "ok";
	}

	@ResponseBody
	@RequestMapping(params = "p=updateAddressById")
	public String updateAddressById() {

		int id = Integer.parseInt(request.getParameter("adId"));
		int address = Integer.parseInt(request.getParameter("address2")); // 区县ID
		String xxaddress = request.getParameter("xxaddress2");
		String name = request.getParameter("shrName");
		String phone = request.getParameter("phoneNumber");
		addressService.updateAddressById(id, address, xxaddress, name, phone);

		return "ok";
	}

	@RequestMapping(params = "p=getAddressById")
	public String getAddressById() {
		int id = Integer.parseInt(request.getParameter("adId"));
		Address address = addressService.getAddressById(id);
		request.setAttribute("a", address);
		return "/pc/gerenzhongxin/xiugaiaddress.jsp";
	}

	@ResponseBody
	@RequestMapping(params = "p=deleteById")
	public String deleteById() {
		int id = Integer.parseInt(request.getParameter("adId"));
		addressService.deleteById(id);
		return "ok";
	}

	@RequestMapping(params = "p=getAll")
	public String getAll() {
		List list = addressService.getAll();
		request.setAttribute("list", list);
		// List list2 = addressService.getAllProvice();
		// request.setAttribute("list2", list2);
		return "/pc/gerenzhongxin/shouhuo.jsp";
	}

	@ResponseBody
	@RequestMapping(params = "p=addAddress")
	public String addAddress() {
		System.out.println("come on!");
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		int id = userinfo.getUsersId();
		// int id = Integer.parseInt(request.getParameter("userid")); // 用户ID
		int address = Integer.parseInt(request.getParameter("address2")); // 区县ID
		String xxaddress = request.getParameter("xxaddress2");// 详情地址ID
		String name = request.getParameter("shrName");
		String phone = request.getParameter("phoneNumber");
		int status = Integer.parseInt(request.getParameter("status"));
		addressService.addAddress(id, address, xxaddress, name, phone, status);

		return "ok";
	}

	@ResponseBody
	@RequestMapping(params = "p=getProvinces")
	public String getProvinces() {
		String json = addressService.getProvinces();
		return json;
	}

	@ResponseBody
	@RequestMapping(params = "p=getCity")
	public String getCity() {
		int id = Integer.parseInt(request.getParameter("id"));
		String json = addressService.getCity(id);
		return json;
	}

	@ResponseBody
	@RequestMapping(params = "p=getArea")
	public String getArea() {
		int id = Integer.parseInt(request.getParameter("id"));
		String json = addressService.getArea(id);
		return json;
	}

}

package com.action.admin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.util.MD5Util;

@Controller
@RequestMapping("/admin.do")
public class guanliUserAction {

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private com.service.admin.guanliUserService guanliUserService;

	/**
	 * 管理员列表
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(params = "p=adminlisting")
	public String adminlist(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		int n = admin.getAdminPower();
		if (n == 2) {
			return "/admin/nopower.jsp";
		}

		if (admin == null) {
			return "/admin/login.jsp";
		}

		String adminName = request.getParameter("adminName");
		if (request.getMethod().equalsIgnoreCase("GET")) {
			if (adminName != null)
				adminName = new String(adminName.getBytes("iso8859-1"), "utf-8");

		}
		String pageString = request.getParameter("page");
		String sizeString = request.getParameter("size");

		Map adminmap = guanliUserService.adminlist(adminName);
		request.setAttribute("adminmap", adminmap);
		return "admin/guanliUser/adminlisting.jsp";

	}

	/**
	 * 添加管理员
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "p=addAdmin")
	public String addAdmin(HttpServletRequest request,
			HttpServletResponse response) {
		String adminname = request.getParameter("Name");
		String adminPower1 = request.getParameter("adminPower");
		String username = request.getParameter("usersname");
		String password = request.getParameter("newpassword2");
		String pwd = MD5Util.getMD5(MD5Util.getMD5("sunjob" + password));
		int adminPower = Integer.parseInt(adminPower1);

		Admin admin1 = new Admin();
		admin1.setAdminName(adminname);
		admin1.setAdminPower(adminPower);
		admin1.setAdminUsername(username);
		admin1.setAdminPassword(pwd);

		guanliUserService.addAdmin(admin1);

		return "/admin/guanliUser/addAdmin.jsp";
	}

	@RequestMapping(params = "p=addAdminjsp")
	public String addadminjsp(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		int n = admin.getAdminPower();
		if (n == 2) {
			return "/admin/nopower.jsp";
		}
		if (admin == null) {
			return "/admin/login.jsp";
		}
		return "/admin/guanliUser/addAdmin.jsp";
	}

	/**
	 * 名称验证
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "p=yzname")
	@ResponseBody
	public String yzname(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String adminname = request.getParameter("Name");
		String jieguo = guanliUserService.yzname(adminname);
		return jieguo;
	}

	/**
	 * 账号验证
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "p=yzusersname")
	@ResponseBody
	public String yzusersname(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		String usersname = request.getParameter("usersname");
		String jieguo = guanliUserService.yzusersname(usersname);
		return jieguo;
	}

	/*
	 * 编辑
	 */
	@RequestMapping(params = "p=editAdmin")
	public String editAdmin(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}

		int adminId = Integer.parseInt(request.getParameter("adminId"));
		Admin eadmin = guanliUserService.editAdminById(adminId);
		request.setAttribute("eadmin", eadmin);
		return "/admin/guanliUser/EditAdmin.jsp";

	}

	/*
	 * 确认修改
	 * 
	 * @throws IOException
	 */
	@RequestMapping(params = "p=sureEdit")
	@ResponseBody
	public String sureEdit(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int adminPower = Integer.parseInt(request.getParameter("info"));
		int adminId = Integer.parseInt(request.getParameter("adminId"));
		boolean f = guanliUserService.sureEditById(adminPower, adminId);
		if (f)
			response.getWriter().print(true);
		else
			response.getWriter().print(false);

		return null;
	}

	/*
	 * 批量删除
	 */
	@RequestMapping(params = "p=stop_admin")
	@ResponseBody
	public String stop_admin(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");

		if (admin == null) {
			return "/admin/login.jsp";
		}
		String adminIds = request.getParameter("adminId");
		guanliUserService.stopAdminById(adminIds);

		return null;
	}

	/**
	 * 重置密码
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "p=reset_Password")
	@ResponseBody
	public String reset_Password(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int adminId = Integer.parseInt(request.getParameter("adminId"));
		return guanliUserService.reset_Password(adminId) + "";

	}

}

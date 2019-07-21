package com.action.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jruby.RubyProcess.Sys;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.service.admin.AdminloginService;
import com.util.MD5Util;

@Controller
@RequestMapping("/adminlogin.do")

public class AdminloginAction {
	@Autowired
	private AdminloginService loginService;

	//登陆
	@RequestMapping(params="p=login")
	@ResponseBody
	public String login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String yzm = request.getParameter("yzm");
		String code = (String) request.getSession().getAttribute("code");
		 //先判断验证码
	   
		if (yzm.equalsIgnoreCase(code)==false)
	    {
	    	return "-1";
	    }
	    //再判断登录
	    Admin admin = loginService.login(username, password);
	    System.out.println(admin);
	    if (admin==null)
	    {
	    	return "-2";
	    }
		request.getSession().setAttribute("admin", admin);// 我换了位置，且保存对象。
		int n = admin.getAdminPower();
		if(n==0){
			return "0";
		}
		
		 return "1";
		
	  
	}
	
	//验证密码
	@ResponseBody
	@RequestMapping(params="p=Yzpwd")
	public String Yzpsd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String username = admin.getAdminUsername();
		String password = request.getParameter("password");		
		String data = loginService.Yzpwd(username, password);
		return data;
	}

	//修改密码
	@ResponseBody
	@RequestMapping(params="p=adminxiugaipwd")
	public String updatepwd(HttpServletRequest request,HttpServletResponse response)
	{	
		Admin admin1=(Admin) request.getSession().getAttribute("admin");
		if(admin1==null)
		{
			return "/admin/login.jsp";
		}
		
		String oldpassword = request.getParameter("oldPassword");
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		int id =admin.getAdminId();
		String username = admin.getAdminUsername();
		String password = request.getParameter("newpassword");
		String pwd = MD5Util.getMD5(MD5Util.getMD5("sunjob"+password));
        System.out.println(pwd);
		Admin admin2 = loginService.updatepwd(id,pwd);
		if(oldpassword.equals(password)){
			return "false"; 
		}
		if(admin2!=null){
			request.getSession().removeAttribute("admin");
			return "true";
		}
		return "false2";
	}
	//清除session
	
}

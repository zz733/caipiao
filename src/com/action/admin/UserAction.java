package com.action.admin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.formula.functions.Count;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.pojo.Userinfo;
import com.sun.java_cup.internal.internal_error;
import com.util.StringUtil;

/**
 * 
 * @author zn
 *
 */


@Controller
@RequestMapping("/user.do")
public class UserAction {

	@Autowired
	private com.service.admin.UserService userService;
	
	/**
	 * 用户列表
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	
	@RequestMapping(params="p=userlisting")
	public String Userlisting(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		Userinfo userinfo=(Userinfo) request.getSession().getAttribute("userinfo");
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}              
		
		
		String pageString=request.getParameter("page");
		String sizeString=request.getParameter("size");
		
/*		if(StringUtil.isNotNull(pageString)&&pageString.trim().length()>0){
			page=Integer.parseInt(pageString);
		}
		
		if(StringUtil.isNotNull(sizeString)&&sizeString.trim().length()>0){
			size=Integer.parseInt(sizeString);
		}
	*/
		
		String begindate=request.getParameter("mintime");
		Timestamp begintime=null;
		if(StringUtil.isNotNull(begindate)&&begindate.trim().length()>0){
			begintime=Timestamp.valueOf(begindate +" 00:00:00");
		}
		String enddate=request.getParameter("maxtime");
		Timestamp endtime=null;
		if(StringUtil.isNotNull(enddate)&&enddate.trim().length()>0){
			endtime=Timestamp.valueOf(enddate+" 23:59:59");
		}
	
		String username=request.getParameter("usersName");
		if(request.getMethod().equalsIgnoreCase("GET"))
		{
			if(username!=null)
				username=new String(username.getBytes("iso8859-1"),"utf-8");
		}
		int type=Integer.parseInt(request.getParameter("type"));
		
		Map usersmap=userService.userlisting(type, begintime, endtime,username);
		
		request.setAttribute("usersmap", usersmap); 
		request.setAttribute("username", username);
	
	   if(type==2){ 
		return "/admin/user/member-list.jsp";
	   }
	   if(type==1){  
		   return "/admin/user/VIPmember-list.jsp";
	   }
	   
	   if(type==0){   
		   return "/admin/user/Putongmember-list.jsp";
	   }
	   
	   
		
	   return null;
	}
	
     @RequestMapping(params="p=xiugaitype")
     public String xiugaitype(HttpServletRequest request,HttpServletResponse response) throws IOException{
    	 Admin admin=(Admin) request.getSession().getAttribute("admin");
			if(admin==null)
			{
				return "/admin/login.jsp";
			}
    	 
    	 int id=Integer.parseInt(request.getParameter("id"));
    	 Userinfo userinfo=userService.xiugaitype(id);
    	 response.getWriter().print(userinfo.getUsersType());
    	 return null;
    }
	
	
}

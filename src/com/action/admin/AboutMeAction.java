package com.action.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.listener.WeixinGetAccessTokenListen;
import com.pojo.Admin;


@Controller
@RequestMapping("/aboutme.do")
public class AboutMeAction {
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping(params="p=get")
	@ResponseBody
	public String get() throws IOException
	{
		File file = new File(WeixinGetAccessTokenListen.SERVER_REAL_PATH+"/WEB-INF/classes/aboutme.properties");
		InputStream is = new FileInputStream(file);
		Properties  p = new Properties();
		p.load(is);
		String str = p.getProperty("content");
		is.close();
		return str;
	}
	
	@RequestMapping(params="p=update")
	public String update() throws IOException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		
		File file = new File(WeixinGetAccessTokenListen.SERVER_REAL_PATH+"/WEB-INF/classes/aboutme.properties");
		InputStream is = new FileInputStream(file);
		Properties  p = new Properties();
		p.load(is);
		String str = p.getProperty("content");
		is.close();
		request.setAttribute("content", str);
		return "/admin/aboutme/updateAboutme.jsp";
		
	}
	
	@RequestMapping(params="p=save")
	@ResponseBody
	public String update(String content) throws IOException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "no login";
		}
		
		File file = new File(WeixinGetAccessTokenListen.SERVER_REAL_PATH+"/WEB-INF/classes/aboutme.properties");
		FileOutputStream os = new FileOutputStream(file);
		InputStream is = new FileInputStream(file);
		Properties  p = new Properties();
		p.load(is);
		p.setProperty("content", content);
		p.store(os, "");
		os.close();
		is.close();
		return "success";
	}
	
	

}

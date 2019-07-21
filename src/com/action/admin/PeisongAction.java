package com.action.admin;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.pojo.Peisongcorp;
import com.service.admin.PeisongService;

/**
 * 
 * @author ltz
 * 
 */
@Controller
@RequestMapping("/peisong.do")
public class PeisongAction {
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private PeisongService peisongService;
	
	@RequestMapping(params="p=addCompany")
	public String addCompany(HttpServletResponse response) throws IOException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		
		String cname = request.getParameter("cName");
		String ename = request.getParameter("eName");
		String status = request.getParameter("status");
		int status2 = Integer.parseInt(status);
		String url = request.getParameter("url");
		String detail = request.getParameter("detail");
		peisongService.addCompany(cname, ename, status2, url,detail);
//		response.setContentType("text/html;charset=utf-8");
//		String resStr =  "<script>alert('123添加成功！');</script>";
//		response.getWriter().print(resStr);
		return null;
	}
	
	@RequestMapping(params="p=fenye")
	public String fenye()
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		
		String sosuo = request.getParameter("sosuo");
		String pageString = request.getParameter("page");
		String sizeString = request.getParameter("size");
		int page =1;
		int size = 3;
		if (pageString!=null)
			page = Integer.parseInt(pageString);
		if (sizeString!=null)
			size = Integer.parseInt(sizeString);
		Map map = peisongService.fenye(sosuo, size, page);
		request.setAttribute("map", map);
		return "/admin/peisong/searchCompany.jsp";
	}
	
	
	@RequestMapping(params="p=getAllById")
	public String getAll()
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		Peisongcorp ps = peisongService.getAllById(id);
		request.setAttribute("ps", ps);
		return "/admin/peisong/updateCompany.jsp";
		
	}
	
	@RequestMapping(params="p=updateCorp")
	public String updateCorp(HttpServletResponse response) throws IOException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("pid"));
		String cname = request.getParameter("cName");
		String ename = request.getParameter("eName");
		String status = request.getParameter("status");
		int status2 = Integer.parseInt(status);
		String url = request.getParameter("url");
		String detail = request.getParameter("detail");
		System.out.println(detail);
		peisongService.updateCorp(cname, ename, status2, url, detail, id);
		return null;
	}
	
	/**
	 * 修改配送公司状态  禁用 or 启用
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params="p=updatestatus")
	public String updatestatus(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		peisongService.updatestatus(id);
		return null;
	}

}

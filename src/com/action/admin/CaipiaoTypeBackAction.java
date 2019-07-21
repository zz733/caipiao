package com.action.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.pojo.CaipiaoType;
import com.service.admin.CaipiaoTypeBackService;

/**
 * 彩票类别管理
 * @author lgh
 *
 */

@Controller
@RequestMapping("/caipiaoTypeManager.do")
public class CaipiaoTypeBackAction {
   
	
	@Autowired
	private CaipiaoTypeBackService  caipiaoTypeBackService;
	
	@Autowired
	private HttpServletRequest request;
	
	/**
	 * 添加彩票
	 * @param caipiaoType
	 * @return
	 */
	@RequestMapping(params="p=add")
	@ResponseBody
	public String add(CaipiaoType caipiaoType)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "405";
		}
		
		//System.out.println(caipiaoType.getPrice_return());
		boolean f  = caipiaoTypeBackService.addCaiType(caipiaoType);
		return f+"";
		
		
	}
	
	/**
	 * 获取所有彩票类型 
	 * @return
	 */
	@RequestMapping(params="p=findAll")
	public String findAll()
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		List list = caipiaoTypeBackService.findAll();
		request.setAttribute("list", list);
		return "/admin/caipiao_type/showCaipiao_type.jsp";
	}
	
	/**
	 * 修改状态 
	 * @param id
	 * @return
	 */
	@RequestMapping(params="p=updatestatus")
	@ResponseBody
	public String updatestatus(int id)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "405";
		}
		
		caipiaoTypeBackService.updateStatus(id);
		return "success";
	}
	
	/**
	 * 修改状态类型
	 * @return
	 */
	@RequestMapping(params="p=updateCaipiaoType")
	@ResponseBody
	public String updateCaipiaoType(CaipiaoType caipiaoType)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "405";
		}
		
		caipiaoTypeBackService.updateCaipiaoType(caipiaoType);
		return "success";
	}
	
	
	@RequestMapping(params="p=getById")
	public String getById(int id)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		
		CaipiaoType ps = caipiaoTypeBackService.findById(id);
		request.setAttribute("ps", ps);
		return "/admin/caipiao_type/updateCaipiao_type.jsp";
	}
	
	
	
	
}

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
import com.pojo.Yuche;
import com.service.admin.YucheBackService;

@Controller
@RequestMapping("/yucheBack.do")
public class YucheBackAction {
	
	@Autowired
	private YucheBackService  yucheBackService;
	
	@Autowired
	private HttpServletRequest request;
	
	/**
	 * 分页查询
	 * @param page
	 * @param size
	 * @param type   彩票类型 
	 * @param qishu  第几期
	 * @return
	 */
	@RequestMapping(params="p=fenye")
	public String fenye(@RequestParam(defaultValue="1") int page,@RequestParam(defaultValue="10") int size,Integer type, String qishu)
	{
		Admin admin1=(Admin) request.getSession().getAttribute("admin");
		if(admin1==null)
		{
			return "/admin/login.jsp";
		}
		
		List list = yucheBackService.getAllCaipiaoType();
		request.setAttribute("list", list);
		
		
		Map map = yucheBackService.fenye(qishu, type, page, size);
		request.setAttribute("map", map);
		return "/admin/caipiao_yuche/show_yuche.jsp";
	}
	
	
	@RequestMapping(params="p=toAdd")
	public String toAdd()
	{
		Admin admin1=(Admin) request.getSession().getAttribute("admin");
		if(admin1==null)
		{
			return "/admin/login.jsp";
		}
		
		List list = yucheBackService.getAllCaipiaoType();
		request.setAttribute("list", list);
		return "/admin/caipiao_yuche/add_yuche.jsp";
	}
	
	
	@RequestMapping(params="p=add")
	@ResponseBody
	public String addYuche(Integer type,String qihao,String kaijiangtime, String content)
	{
		Admin admin1=(Admin) request.getSession().getAttribute("admin");
		if(admin1==null)
		{
			return "/admin/login.jsp";
		}
		boolean f = yucheBackService.addYuche(qihao, type, content, kaijiangtime);
		if (f)
			return "success";
		
		else
			return "false";
		
	}
	
	@RequestMapping(params="p=toUpdate")
	public String toUpdate(Integer id)
	{
		Admin admin1=(Admin) request.getSession().getAttribute("admin");
		if(admin1==null)
		{
			return "/admin/login.jsp";
		}
		Yuche  yuche = yucheBackService.findById(id);
		System.out.println(yuche);
		request.setAttribute("yuche", yuche);
		
		List list = yucheBackService.getAllCaipiaoType();
		request.setAttribute("list", list);
		return "/admin/caipiao_yuche/update_yuche.jsp";
	}
	
	

	@RequestMapping(params="p=update")
	@ResponseBody
	public String addYuche(Integer type,String qihao,String kaijiangtime, String content,Integer id)
	{
		Admin admin1=(Admin) request.getSession().getAttribute("admin");
		if(admin1==null)
		{
			return "/admin/login.jsp";
		}
		boolean f = yucheBackService.updateYuche(id,qihao, type, content, kaijiangtime);
		if (f)
			return "success";
		
		else
			return "false";
		
	}
	

}







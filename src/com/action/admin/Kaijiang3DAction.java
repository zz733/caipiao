package com.action.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.pojo.Kaijiang3d;
import com.service.admin.Kaijiang3DService;

@Controller
@RequestMapping("/kaijiang3d.do")
public class Kaijiang3DAction {

	@Autowired
	private Kaijiang3DService kaijiang3dService;

	@Autowired
	private HttpServletRequest request;

	/**
	 * 分页查数据
	 * @param kjQishu
	 * @param mintime
	 * @param maxtime
	 * @param page
	 * @param size
	 * @return
	 */
	@RequestMapping(params="p=fenye")
	public String fenye(String kjQishu, String mintime, String maxtime,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int size) {
		
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		
		 Map map = kaijiang3dService.getAllKaijiang3d(kjQishu, mintime, maxtime, page, size);
         request.setAttribute("map", map);
         return "/admin/kaijiang_3d/show.jsp";
	}
	
	/**
	 * 得最大期数
	 * @return
	 */
	@RequestMapping(params="p=getMaxQishu")
	public String getMaxQishu()
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		
		String max = kaijiang3dService.getMaxQishu();
		request.setAttribute("max", max);
		return "/admin/kaijiang_3d/addqiuhao.jsp";
	}
	
	/**
	 * 新增
	 * @param kaijiang3d
	 * @return
	 */
	@RequestMapping(params="p=add3D")
	@ResponseBody
	public String add3D(Kaijiang3d kaijiang3d)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "false";
		}
		
		boolean f  = kaijiang3dService.checkQishu(kaijiang3d.getQishu());
		if (f)
			return "用户已注册";
		
		kaijiang3dService.addqiuhao(kaijiang3d);
		return "注册成功";
	}
	
	/**
	 * 新增
	 * @param kaijiang3d
	 * @return
	 */
	@RequestMapping(params="p=update")
	@ResponseBody
	public String update(Kaijiang3d kaijiang3d)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "false";
		}
		
		kaijiang3dService.updateKaiJiang(kaijiang3d);
		return "修改成功";
	}
	
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@RequestMapping(params="p=del")
	@ResponseBody
	public String del(int id)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "false";
		}
		
		boolean f = kaijiang3dService.del(id);
		return f+"";
	}
	
	/**
	 * 去编辑
	 * @param id
	 * @return
	 */
	@RequestMapping(params="p=toEdit")
	public String toEdit(int id)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		Kaijiang3d  kaijiang3d = kaijiang3dService.getKaijiang3dById(id);
		request.setAttribute("k", kaijiang3d);
		return "/admin/kaijiang_3d/update.jsp";
	}

}

package com.action.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.pojo.Qianquzoushi3d;
import com.service.admin.Qianquzoushi3dService;

@Controller
@RequestMapping("/qianquzoushi3d.do")
public class Qianquzoushi3DAction {
	
	//qsw
	
	@Autowired
	private Qianquzoushi3dService qianquzoushi3dService;

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
		
		 Map map = qianquzoushi3dService.getAllQianquzoushi3d(kjQishu, mintime, maxtime, page, size);
         request.setAttribute("map", map);
         return "/admin/qianquzoushi_3d/show.jsp";
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
		
		String max = qianquzoushi3dService.getMaxQishu();
		request.setAttribute("max", max);
		return "/admin/qianquzoushi_3d/addqiuhao.jsp";
	}
	
	/**
	 * 新增
	 * @param kaijiang3d
	 * @return
	 */
	@RequestMapping(params="p=add3D")
	@ResponseBody
	public String add3D(Qianquzoushi3d qianquzoushi3d)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "false";
		}
		
		boolean f  = qianquzoushi3dService.checkQishu(qianquzoushi3d.getQishu());
		if (f)
			return "用户已注册";
		
		qianquzoushi3dService.addqiuhao(qianquzoushi3d);
		return "注册成功";
	}
	
	/**
	 * 新增
	 * @param kaijiang3d
	 * @return
	 */
	@RequestMapping(params="p=update")
	@ResponseBody
	public String update(Qianquzoushi3d qianquzoushi3d)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "false";
		}
		
		qianquzoushi3dService.updateQianquzoushi(qianquzoushi3d);
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
		
		boolean f = qianquzoushi3dService.del(id);
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
		Qianquzoushi3d  kaijiang3d = qianquzoushi3dService.getQianquzoushi3dById(id);
		request.setAttribute("k", kaijiang3d);
		return "/admin/qianquzoushi_3d/update.jsp";
	}

}

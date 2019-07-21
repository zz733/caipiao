package com.action.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.pojo.Pailiewu;
import com.service.admin.PailiewuService;

@Controller
@RequestMapping("/pailiewu.do")
public class PailiewuAction {

	@Autowired
	private PailiewuService pailiewuService;

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
	@RequestMapping(params = "p=fenye")
	public String fenye(String kjQishu, String mintime, String maxtime,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int size) {

		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}

		Map map = pailiewuService.getAllPailiewu(kjQishu, mintime, maxtime,
				page, size);
		request.setAttribute("map", map);
		return "/admin/pailiewu/show.jsp";
	}

	/**
	 * 得最大期数
	 * @return
	 */
	@RequestMapping(params = "p=getMaxQishu")
	public String getMaxQishu() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}

		String max = pailiewuService.getMaxQishu();
		request.setAttribute("max", max);
		return "/admin/pailiewu/addqiuhao.jsp";
	}

	/**
	 * 新增
	 * @param Pailiewu
	 * @return
	 */
	@RequestMapping(params = "p=addPailie")
	@ResponseBody
	public String addPailie(Pailiewu pailiewu) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "false";
		}

		boolean f = pailiewuService.checkQishu(pailiewu.getQishu());
		if (f)
			return "用户已注册";

		pailiewuService.addqiuhao(pailiewu);
		return "注册成功";
	}

	/**
	 * 修改
	 * @param Pailiewu
	 * @return
	 */
	@RequestMapping(params = "p=update")
	@ResponseBody
	public String update(Pailiewu pailiewu) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "false";
		}

		pailiewuService.updatePailie(pailiewu);
		return "修改成功";
	}

	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@RequestMapping(params = "p=del")
	@ResponseBody
	public String del(int id) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "false";
		}

		boolean f = pailiewuService.del(id);
		return f + "";
	}

	/**
	 * 去编辑
	 * @param id
	 * @return
	 */
	@RequestMapping(params = "p=toEdit")
	public String toEdit(int id) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		Pailiewu pailiewu = pailiewuService.getPailiewuById(id);
		request.setAttribute("k", pailiewu);
		return "/admin/pailiewu/update.jsp";
	}

}

package com.action.pc;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.action.JccsConfig;
import com.pojo.Userinfo;
import com.service.pc.UserinfoService;

@Controller
@RequestMapping("/userinfo.do")
public class UserinfoAction {

	@Autowired
	private UserinfoService userinfoService;

	@Autowired
	private HttpServletRequest request;

	// 通过id去查userinfo中的信息，如果他没有绑定微信号，就跳到绑定页面，若绑定了就显示绑定信息
	@RequestMapping(params = "p=findById")
	public String findById(HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		Userinfo userinfo1 = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo1 == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		int id = userinfo1.getUsersId();
		List<Userinfo> list = userinfoService.getAllWX(id);
		for (Userinfo userinfo : list) {
			if (userinfo.getUsersBdwx() == 0) {
				response.getWriter().print(
						"<script>alert('你还没有绑定微信账号的')</script>");
				return "/pc/gerenzhongxin/bangdingwx.jsp";
			} else {
				request.setAttribute("list", list);
				return "/pc/gerenzhongxin/bdwx.jsp";
			}
		}
		return null;

	}

	// 根据id去查userinfo中的信息，如果他没有绑定支付宝号，就跳到绑定页面，若绑定了就显示绑定信息
	@RequestMapping(params = "p=findByUsid")
	public String findByIdToZhFB(HttpServletResponse response)
			throws IOException {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		int id = userinfo.getUsersId();
		String zhifubao = userinfo.getUsersZhifubao();
		if (zhifubao == null) {
			return "/pc/gerenzhongxin/bangdingzhfb.jsp";
		} else {
			List list = userinfoService.getAllZFB(id);
			request.setAttribute("list", list);
			return "/pc/gerenzhongxin/bdzhfb.jsp";
		}

	}

	@RequestMapping(params = "p=addwx")
	public String addwx() {
		Userinfo userinfo1 = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo1 == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		int id = userinfo1.getUsersId();
		String wxid = request.getParameter("wxid");
		userinfoService.addwx(id, wxid);
		List list = userinfoService.getAllWX(id);
		request.setAttribute("list", list);
		return "/pc/gerenzhongxin/bdwx.jsp";

	}

	@RequestMapping(params = "p=addzhfb")
	public String addzhfb() {
		Userinfo userinfo1 = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo1 == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		int id = userinfo1.getUsersId();
		String zhfbid = request.getParameter("zhfbid");
		String zhfbName = request.getParameter("zhfbName");
		userinfoService.addzhfbao(id, zhfbid, zhfbName);
		List list = userinfoService.getAllWX(id);
		request.setAttribute("list", list);
		return "/pc/gerenzhongxin/bdzhfb.jsp";
	}

	// 用户得到个人信息
	@RequestMapping(params = "p=gerenxinxi")
	public String gerenxinxi() {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		int id = userinfo.getUsersId();
		Map xinximap = userinfoService.getgerenxinxi(id);
		Userinfo userinfo2 = userinfoService.findById(id);
		request.getSession().setAttribute("userinfo", userinfo2);
		request.setAttribute("xinximap", xinximap);
		return "/pc/gerenzhongxin/gerenxinxi.jsp";
	}

	// 用户得到信息去提现界面
	@RequestMapping(params = "p=gerenxinxitotixian")
	public String gerenxinxitotixian() {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		int id = userinfo.getUsersId();
		Map xinximap = userinfoService.getgerenxinxi(id);
		request.setAttribute("xinximap", xinximap);
		return "/pc/fubeichongzhi/fubeimaichu.jsp";
	}

	// 用户得到信息去充值界面
	@RequestMapping(params = "p=gerenxinxitochongzhi")
	public String gerenxinxitochongzhi() throws FileNotFoundException, IOException {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		
		int id = userinfo.getUsersId();
		userinfo = userinfoService.getUserNoCache(id);
		Map xinximap = userinfoService.getgerenxinxi(id);
		xinximap.put("fubei", JccsConfig.fubei);
		//获取配置谁的中人民币同福贝比率
		request.setAttribute("xinximap", xinximap);
		return "/pc/fubeichongzhi/fbchongzhi.jsp";
	}
	
	
	// 用户得到信息去购买界面  用于购买视频
	@RequestMapping(params = "p=gerenxinxitogoumai")
	public String gerenxinxitogoumai() throws FileNotFoundException, IOException {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		Float price=Float.parseFloat(request.getParameter("price"));
		Integer gid=Integer.parseInt(request.getParameter("gid"));
		int id = userinfo.getUsersId();
		userinfo = userinfoService.getUserNoCache(id);
		Map xinximap = userinfoService.getgerenxinxi(id);
		xinximap.put("price", price);
		xinximap.put("gid", gid);
		request.setAttribute("xinximap", xinximap);
		return "/pc/mingshijiangyan/goumai.jsp";
	}
	

	// 用户注销清理Session
	@RequestMapping(params = "p=zhuxiao")
	public String zhuxiao() {
		request.getSession().removeAttribute("userinfo");
		return "/pc/yonghudenglu/denglu.jsp";
	}

	// 修改用户昵称
	@ResponseBody
	@RequestMapping(params = "p=userxiugainame")
	public String updatepwd(HttpServletRequest request,
			HttpServletResponse response) {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		int id = userinfo.getUsersId();
		String username = request.getParameter("name");
		Userinfo userinfo2 = userinfoService.updateusername(id, username);
		if (userinfo2 != null) {
			return "true";
		}
		return "false";
	}

	// 修改用户支付宝
	@ResponseBody
	@RequestMapping(params = "p=userxiugaizfb")
	public String updatezfb(HttpServletRequest request,
			HttpServletResponse response) {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		int id = userinfo.getUsersId();
		String userzfb = request.getParameter("zhifubao");
		Userinfo userinfo2 = userinfoService.updateuserzfb(id, userzfb);
		if (userinfo2 != null) {
			return "true";
		}
		return "false";
	}

	// VIP 判断是否登陆 判断登陆了是否为会员
	@ResponseBody
	@RequestMapping(params = "p=panduan")
	public String panduan(HttpServletRequest request,
			HttpServletResponse response) {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "meidenglu";
		}
		userinfo = userinfoService.getUserNoCache(userinfo.getUsersId());
		if (userinfo==null || userinfo.getUsersEndtime()==null)
			return "novip";
		
		int type = userinfo.getUsersType(); // 得到用户类型
		if (type == 1 && userinfo.getUsersEndtime().getTime()>System.currentTimeMillis()) { // 登陆了 是会员
			return "vip";
		} else // 登陆了不是会员
		{
			return "novip";
		}

	}
}

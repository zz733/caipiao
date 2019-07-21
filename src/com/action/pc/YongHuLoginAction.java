package com.action.pc;

//登录Action
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Userinfo;
import com.pojo.Yuche;
import com.pojo.YucheOrder;
import com.service.pc.YongHuLoginService;
import com.service.pc.YucheService;
import com.util.JsonFilter;
import com.util.MD5Util;

@Controller
@RequestMapping("/yonghuLogin.do")
public class YongHuLoginAction {

	@Autowired
	private YongHuLoginService yongHuLoginService;
	
	@Autowired
	private YucheService  	yucheService;

	// 判断登录时用户名和密码是否正确
	@RequestMapping(params = "p=login")
	@ResponseBody
	public String yhlogin(HttpServletRequest request,
			HttpServletResponse response) {

		String userphone = request.getParameter("username");
		String password = request.getParameter("password");
		

		String yzm = request.getParameter("yzm");
		String code = (String) request.getSession().getAttribute("code");
		// 先判断验证码
		if (yzm.equalsIgnoreCase(code) == false) {
			return "-1";
		}
		// 再判断登录
		Userinfo userinfo = yongHuLoginService.login(userphone, password);
		if (userinfo == null) {
			return "-2";
		}
		request.getSession().setAttribute("userinfo", userinfo);//
		
		if (userinfo.getUsersEndtime()==null || userinfo.getUsersEndtime().getTime()<System.currentTimeMillis())
           return "0";
		
		return "1";

	}
	
	
	
	// 判断登录时用户名和密码是否正确
	@RequestMapping(params = "p=login2")
	@ResponseBody
	public String yhlogin2(HttpServletRequest request,
			HttpServletResponse response) {

		String userphone = request.getParameter("username");
		String password = request.getParameter("password");
        String yid  = request.getParameter("yid");
		String yzm = request.getParameter("yzm");
		String code = (String) request.getSession().getAttribute("code");
		// 先判断验证码
		if (yzm.equalsIgnoreCase(code) == false) {
			return "-1";
		}
		// 再判断登录
		Userinfo userinfo = yongHuLoginService.login(userphone, password);
		if (userinfo == null) {
			return "-2";
		}
		request.getSession().setAttribute("userinfo", userinfo);//
		
		
		YucheOrder  yucheOrder = yucheService.getYucheOrder(userinfo.getUsersId(), Integer.parseInt(yid));
		if (yucheOrder==null)
           return "0";
		
		Yuche yuche = yucheService.findById(Integer.parseInt(yid));
		
		JsonConfig  config = new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json = JSONObject.fromObject(yuche,config).toString();
		return json;

	}

	// 忘记密码
	@RequestMapping(params = "p=forget")
	@ResponseBody
	public String wjpass(HttpServletRequest request,
			HttpServletResponse response) {
        
		if (request.getSession().getAttribute("resetPwd")==null)
		{
			return "false";
		}
		
		String iPhone = request.getParameter("uname");
		String mima = request.getParameter("mima");

		yongHuLoginService.update(iPhone, mima);

		return "true";

	}

	// 验证密码
	@ResponseBody
	@RequestMapping(params = "p=Yzpwd")
	public String Yzpsd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		String userphone = userinfo.getUsersPhone();
		String password = request.getParameter("password");
		String data = yongHuLoginService.Yzpassword(userphone, password);
		return data;
	}

	// 修改密码
	@ResponseBody
	@RequestMapping(params = "p=userxiugaipwd")
	public String updatepwd(HttpServletRequest request,
			HttpServletResponse response) {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}

		String oldpassword = request.getParameter("oldPassword");
		int id = userinfo.getUsersId();
		String username = userinfo.getUsersName();
		String password = request.getParameter("newpassword");
		String pwd = MD5Util.getMD5(MD5Util.getMD5("sunjob" + password));

		Userinfo userinfo2 = yongHuLoginService.updatepwd(id, pwd);
		if (oldpassword.equals(password)) {
			return "false";
		}
		if (userinfo2 != null) {
			request.getSession().removeAttribute("userinfo");
			return "true";
		}
		return "false2";
	}

}

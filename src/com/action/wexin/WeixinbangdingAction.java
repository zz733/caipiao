package com.action.wexin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import weixin.popular.api.OpenIdAPI;
import weixin.popular.bean.AccessToken;

import com.action.WeixinConfig;
import com.dao.UserinfoDAO;
import com.service.pc.UserinfoService;

@Controller
@RequestMapping("/weixin_bangding.do")
public class WeixinbangdingAction {
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private UserinfoDAO userinfoDAO;
	@Autowired
	private UserinfoService userinfoService;

	@RequestMapping(params = "w=weixin_bangding")
	@ResponseBody
	public String bangding(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		// ------------------获取客户的微信号 :@author lgh ------------------//
		String code = request.getParameter("code");
		String appid = WeixinConfig.APPID;
		String secret = WeixinConfig.APPSECRET;
		AccessToken accessToken = new OpenIdAPI()
				.getOpenId(appid, secret, code);
		String weixinhao = accessToken.getOpenid();
		// System.out.println("客户微信号------------"+weixinhao);
		// --------------- end 获取客户的微信号----------------//
		System.out.println("微信号:" + weixinhao);
		if (weixinhao != null)
			userinfoService.addOpenid(id, weixinhao);
		return "绑定成功";
	}
}

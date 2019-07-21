package com.action.wexin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.action.WeixinConfig;
import com.pojo.Userinfo;
import com.util.T2DMa;
import com.util.URLManager;

@Controller
@RequestMapping("/weixinguanzhu.do")
public class GuanzhuToT2DAction {
	@Autowired
	private HttpServletRequest request;

	@RequestMapping(params = "w=idandUrltoT2D")
	public String toT2D() throws UnsupportedEncodingException, IOException {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		int id = userinfo.getUsersId();
		String url = URLManager.getServerURL(request)
				+ "/weixin_bangding.do?w=weixin_bangding&id=" + id;
		String appid = WeixinConfig.APPID;
		String newUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ appid
				+ "&redirect_uri="
				+ URLEncoder.encode(url, "utf-8")
				+ "&scope=snsapi_base&state=1#wechat_redirect";
		T2DMa t2dMa = new T2DMa();
		String imgpath = request.getSession().getServletContext()
				.getRealPath("/t2d/")
				+ "/" + id + ".png";
		String path = id + ".png";
		t2dMa.encoderQRCode(newUrl, imgpath, "png", 20);
		request.getSession().setAttribute("WEIXINT2D", path);
		return "pc/gerenzhongxin/bangdingwx.jsp";

	}
}

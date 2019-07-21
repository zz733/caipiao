package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import weixin.popular.api.PayMchAPI;
import weixin.popular.bean.paymch.Unifiedorder;
import weixin.popular.bean.paymch.UnifiedorderResult;
import weixin.popular.util.MapUtil;
import weixin.popular.util.SignatureUtil;

import com.util.StringUtil;
import com.util.T2DMa;
import com.util.URLManager;

@Controller
@RequestMapping("/weixinPayVIP.do")
public class WeixinPayVIPAction {

	// @Autowired
	// private PayCommonService payCommonService;
	//
	// @Autowired
	// private PayContributionService payContributionService;
	//
	@Autowired
	private HttpServletRequest request;

	/**
	 * 微信扫码支付
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "p=toPayVIP")
	public String toPay(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("payId"); // 订单ID
		float money = Float.parseFloat(request.getParameter("money"));// 支付金额
		// float money = (float) 0.01;
		System.out.println(id);
		System.out.println(money);
		String name = "会员充值";

		String appid = WeixinConfig.APPID;// "wx94df44a32ee2fabc"
		String secret = WeixinConfig.APPSECRET;// "c7c8da0e239b43acde5007fe126dfefc"
		String mch_id = WeixinConfig.MCH_ID; // 商户号
		String payKey = WeixinConfig.PAY_KEY; // 支付key
		String notifyUrl = URLManager.getServerURL(request)
				+ "/wxpayNotifyVIP.do"; // 异步通知地址http://iptv2.vicp.net/jht_1
		Unifiedorder unifiedorder = new Unifiedorder();
		unifiedorder.setAppid(appid);
		unifiedorder.setBody(name);// 商品描述
		unifiedorder.setDevice_info("");
		unifiedorder.setGoods_tag("");
		unifiedorder.setMch_id(mch_id);
		unifiedorder.setNonce_str(UUID.randomUUID().toString()
				.replaceAll("-", ""));
		unifiedorder.setNotify_url(notifyUrl);// 通知地址
		unifiedorder.setOut_trade_no(id); // 外部订单号
		unifiedorder.setProduct_id("131452");// 产品号（二维码时有用)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		unifiedorder.setTime_expire(sdf.format(new java.util.Date(System
				.currentTimeMillis() + 24 * 3600 * 1000)));
		unifiedorder.setTime_start(sdf.format(new Date()));
		unifiedorder.setSpbill_create_ip(request.getLocalAddr());// 客户端ip
		String money2 = money * 100 + ""; //
		int index = money2.indexOf('.');
		if (index > -1) {
			money2 = money2.substring(0, index);
		}

		// money2="1";

		unifiedorder.setTotal_fee(money2); // 订单总金额，分 money
		unifiedorder.setAttach("");
		
		//扫码支付，如果是公众号JSSDK
		unifiedorder.setTrade_type("NATIVE");
		String sign = SignatureUtil.generateSign(
				MapUtil.objectToMap(unifiedorder, "sign"), payKey);
		unifiedorder.setSign(sign);
		UnifiedorderResult unifiedorderResult = new PayMchAPI()
				.payUnifiedorder(unifiedorder);
		String code_url = unifiedorderResult.getCode_url();
		if (StringUtil.isNull(code_url)) {
			response.getWriter().print("微信支付参数配置错误，请联系系统管理员");
			return null;
		}
		String imgPath = request.getSession().getServletContext()
				.getRealPath("/tempImages/" + id + ".png"); // 二维码存放的图片路径，请修改成实际图片
		String encoderContent = code_url;
		System.out.println(encoderContent);
		T2DMa ma = new T2DMa();
		ma.encoderQRCode(encoderContent, imgPath, "png");
		System.out.println(ma.toString());
		request.setAttribute("weixinpay", id + ".png");
		request.setAttribute("orderId", id);
		request.setAttribute("money", money);

		return "/pay/weixinpay/vippay.jsp";

	}

}

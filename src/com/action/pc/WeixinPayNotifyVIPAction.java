package com.action.pc;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import weixin.popular.bean.pay.PayNotify;
import weixin.popular.util.XMLConverUtil;

import com.service.admin.DailiAlipayService;

@Controller
@RequestMapping("/wxpayNotifyVIP.do")
public class WeixinPayNotifyVIPAction {
	@Autowired
	private DailiAlipayService dailiAlipayService;

	/**
	 * 微信支付回调函数
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		Logger logger = Logger.getRootLogger();
		logger.error("回调函数");
		InputStream is = request.getInputStream();
		byte[] b = new byte[1024];
		int size = is.read(b);
		String str = new String(b, 0, size);

		// 获取请求数据
		PayNotify payNotify = XMLConverUtil.convertToObject(PayNotify.class,
				str);

		// 签名判断略...
		{

		}

		System.out.println("##########come on#########");
		System.out.println(payNotify.getResult_code());
		System.out.println(payNotify.getReturn_code());
		System.out.println(payNotify.getOut_trade_no());
		System.out.println(payNotify.getTotal_fee());
		// 支付成功
		if ("SUCCESS".equals(payNotify.getResult_code())
				&& "SUCCESS".equals(payNotify.getReturn_code())) {
			String trade_no = payNotify.getOut_trade_no();
			// if (trade_no.startsWith("jhthg"))
			{
				System.out.println("lailemei:微信支付");
				Double money = 0.0;
				if (payNotify.getTotal_fee() != null) {
					money = Double.parseDouble(payNotify.getTotal_fee()) / 100;
				}
				// String id=trade_no.substring(4);
				// 这里支付成功后修改订单状态
				System.out.println(trade_no);
				dailiAlipayService.updateVIPStatuswx(trade_no, money);
				// payService.payNew(trade_no, null, money + "");
				// String payr = payCommonService.updateOrderStatus(trade_no,
				// money);

				//response.getOutputStream().write("success".getBytes());
				response.getOutputStream().write("<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>')".getBytes());
				return null;
			}

			// if (trade_no.startsWith("JHTWx")) {
			// // System.out.println("lailemei:商品微信支付");
			// float money = 0.0f;
			// if (payNotify.getTotal_fee() != null) {
			// money = Float.parseFloat(payNotify.getTotal_fee()) / 100;
			// }
			// // String id=trade_no.substring(4);
			// // 这里支付成功后修改订单状态
			// //payService.payNew(trade_no, null, money + "");
			//
			// response.getOutputStream().write("success".getBytes());
			// }
			//
			// // 经纪商免费入住 申请 靓号购买
			// if (trade_no.startsWith("zfmfr")) {
			// // System.out.println("lailemei:商品微信支付");
			// float money = 0.0f;
			// if (payNotify.getTotal_fee() != null) {
			// money = Float.parseFloat(payNotify.getTotal_fee()) / 100;
			// }
			// // String id=trade_no.substring(4);
			// // 这里支付成功后修改订单状态
			// //payService.payNew(trade_no, null, money + "");
			//
			// response.getOutputStream().write("success".getBytes());
			// }
			//
			// // 经纪人申请
			// if (trade_no.startsWith("JWXJJ")) {
			// // System.out.println("lailemei:商品微信支付");
			// float money = 0.0f;
			// if (payNotify.getTotal_fee() != null) {
			// money = Float.parseFloat(payNotify.getTotal_fee()) / 100;
			// }
			// // String id=trade_no.substring(4);
			// // 这里支付成功后修改订单状态
			// //payService.payNew(trade_no, null, money + "");
			//
			// response.getOutputStream().write("success".getBytes());
			// }

		} else {
			response.getOutputStream().write("error".getBytes());
		}

		return null;
	}
}

package com.action.pc;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import weixin.popular.api.PayMchAPI;
import weixin.popular.bean.pay.PayNotify;
import weixin.popular.bean.paymch.Unifiedorder;
import weixin.popular.bean.paymch.UnifiedorderResult;
import weixin.popular.util.MapUtil;
import weixin.popular.util.SignatureUtil;
import weixin.popular.util.XMLConverUtil;

import com.action.JccsConfig;
import com.action.WeixinConfig;
import com.action.admin.JccsAction;
import com.pojo.CaipiaoType;
import com.pojo.Userinfo;
import com.pojo.Yuche;
import com.pojo.YucheOrder;
import com.service.pc.YucheService;
import com.util.JsonFilter;
import com.util.StringUtil;
import com.util.T2DMa;
import com.util.URLManager;

@Controller
@RequestMapping("/yuche.do")
public class YucheAction {

	@Autowired
	private YucheService yucheService;

	@Autowired
	private HttpServletRequest request;

	/**
	 * 得所有预测
	 * 
	 * @return
	 */
	@RequestMapping(params = "p=getAllYuche")
	public String getAllYuche() {
		List list = yucheService.getAllYuche();
		System.out.println(list);
		request.setAttribute("list", list);
		return "/pc/yuche/showallyuche.jsp";
	}

	/**
	 * 查看预测
	 * 
	 * @return
	 */
	@RequestMapping(params = "p=view")
	@ResponseBody
	public String view(int yid) {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null)
			return "没有登录";

		int uid = userinfo.getUsersId();
		YucheOrder yucheOrder = yucheService.getYucheOrder(uid, yid);
		if (yucheOrder == null)
			return "还没有购买";

		JsonConfig config = new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json = JSONObject.fromObject(yucheOrder, config).toString();

		return json;

	}
	
	/**
	 * 查看预测:根据预测id
	 * 
	 * @return
	 */
	@RequestMapping(params = "p=go2")
	@ResponseBody
	public String go2(int yid) 
	{
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
		"userinfo");
		Yuche yuche = yucheService.findById(yid);
		if (yuche == null
				|| yuche.getKaijiangTime().getTime() < System
						.currentTimeMillis())
			return "{result:0,msg:'本期没有新的预测'}";

		if (userinfo == null) {
			return "{result:0,msg:'没有登录',yid:" + yuche.getId() + "}";
		}

		int uid = userinfo.getUsersId();
		YucheOrder yucheOrder = yucheService.getYucheOrder(uid, yid);
		if (yucheOrder == null)
			return "{result:0,msg:'还没有购买',yid:" + yuche.getId() + "}";

		JsonConfig config = new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json = JSONObject.fromObject(yuche, config).toString();

		return json;
		
	}
	
	

	/**
	 * 查看预测:根据彩票类型
	 * 
	 * @return
	 */
	@RequestMapping(params = "p=go")
	@ResponseBody
	public String go(int cid) {

		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");

		// 根据彩票类型查看是否有最新预测
		Yuche yuche = yucheService.getYucheByCaipiaoTypeId(cid);
		if (yuche == null
				|| yuche.getKaijiangTime().getTime() < System
						.currentTimeMillis())
			return "{result:0,msg:'本期没有新的预测'}";

		if (userinfo == null) {
			return "{result:0,msg:'没有登录',yid:" + yuche.getId() + "}";
		}

		int uid = userinfo.getUsersId();
		int yid = yuche.getId();
		YucheOrder yucheOrder = yucheService.getYucheOrder(uid, yid);
		if (yucheOrder == null)
			return "{result:0,msg:'还没有购买',yid:" + yuche.getId() + "}";

		JsonConfig config = new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json = JSONObject.fromObject(yuche, config).toString();

		return json;

	}

	@RequestMapping(params = "p=payCheck")
	@ResponseBody
	public String payCheck(float money, String id) {
		YucheOrder yucheOrder = yucheService.getYucheOrder(id);
		if (yucheOrder != null && yucheOrder.getZonjiang() == 0) {
			Yuche yuche = yucheOrder.getYuche();
			JsonConfig config = new JsonConfig();
			JsonFilter.ignoredSet(config);
			String json = JSONObject.fromObject(yuche, config).toString();
			return json;
		}
		return "error";
	}

	/**
	 * 去支付页面
	 * 
	 * @return
	 */
	@RequestMapping(params = "p=toPayView")
	public String toPayView(int yid) {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null)
			return "/pc/yonghudenglu/denglu_yuche.jsp";
		
		Yuche yuche = yucheService.findById(yid);
		CaipiaoType caipiaoType = yuche.getCaipiaoType();

		// 获取预测价格
		//String yuchejiage = JccsConfig.yuchejiage;
		request.setAttribute("yuchejiage", caipiaoType.getPrice());

		// 预测不中返回金额
		String yucehfanxian = JccsConfig.yucehfanxian;
		request.setAttribute("yucehfanxian", caipiaoType.getPrice_return());

		return "/pc/yuche/buy.jsp";
	}

	/**
	 * 保存预测订单`
	 * 
	 * @param radio1
	 * @return
	 */
	@RequestMapping(params = "p=saveOrder")
	public String saveOrder(int radio1, int yid) {

		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null)
			return "/pc/yonghudenglu/denglu_yuche.jsp";

		YucheOrder yucheOrder = yucheService.createOrder(radio1, userinfo, yid);
		float money2 = yucheOrder.getMoney();
		String payId = yucheOrder.getPayid();
		switch (radio1) {
		case 2: // 微信
			return "/yuche.do?p=toWeixinPay&id=" + payId + "&money=" + money2+"&yid="+yid;

		case 1: // 支付宝
			return "/pc/yuche/alipay/alipayapi.jsp?money=" + money2 + "&payId="
					+ payId + ""+"&yid="+yid;
		}

		return null;
	}

	@RequestMapping(params = "p=toWeixinPay")
	public String toWeixinPay(HttpServletResponse response) throws IOException {
		float money = Float.parseFloat(request.getParameter("money"));// 支付金额
		String id = request.getParameter("id");
		// float money = (float) 0.01;

		//System.out.println(money);
		String name = "会员预测";

		String appid = WeixinConfig.APPID;// "wx94df44a32ee2fabc"
		String secret = WeixinConfig.APPSECRET;// "c7c8da0e239b43acde5007fe126dfefc"
		String mch_id = WeixinConfig.MCH_ID; // 商户号
		String payKey = WeixinConfig.PAY_KEY; // 支付key
		String notifyUrl = URLManager.getServerURL(request) + "/yuche.do"; // 异步通知地址http://iptv2.vicp.net/jht_1
		Unifiedorder unifiedorder = new Unifiedorder();
		unifiedorder.setAppid(appid);
		unifiedorder.setBody(name);// 商品描述
		unifiedorder.setDevice_info("");
		unifiedorder.setGoods_tag("");
		unifiedorder.setMch_id(mch_id);
		unifiedorder.setNonce_str(UUID.randomUUID().toString().replaceAll("-",
				""));
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
		unifiedorder.setTrade_type("NATIVE");
		String sign = SignatureUtil.generateSign(MapUtil.objectToMap(
				unifiedorder, "sign"), payKey);
		unifiedorder.setSign(sign);
		UnifiedorderResult unifiedorderResult = new PayMchAPI()
				.payUnifiedorder(unifiedorder);
		String code_url = unifiedorderResult.getCode_url();
		if (StringUtil.isNull(code_url)) {
			response.getWriter().print("微信支付参数配置错误，请联系系统管理员");
			return null;
		}
		String imgPath = request.getSession().getServletContext().getRealPath(
				"/tempImages/" + id + ".png"); // 二维码存放的图片路径，请修改成实际图片
		String encoderContent = code_url;
		System.out.println(encoderContent);
		T2DMa ma = new T2DMa();
		ma.encoderQRCode(encoderContent, imgPath, "png");
		System.out.println(ma.toString());
		request.setAttribute("weixinpay", id + ".png");
		request.setAttribute("orderId", id);
		request.setAttribute("money", money);

		return "/pc/yuche/wxpay/vippay.jsp";

	}

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
				Float money = 0.0F;
				if (payNotify.getTotal_fee() != null) {
					money = Float.parseFloat(payNotify.getTotal_fee()) / 100;
				}
				// String id=trade_no.substring(4);
				// 这里支付成功后修改订单状态
				System.out.println(trade_no);
				yucheService.updateOrderStatus(trade_no, money);
				// payService.payNew(trade_no, null, money + "");
				// String payr = payCommonService.updateOrderStatus(trade_no,
				// money);

				// response.getOutputStream().write("success".getBytes());
				response
						.getOutputStream()
						.write(
								"<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>')"
										.getBytes());
				return null;
			}

		} else {
			response.getOutputStream().write("error".getBytes());
		}

		return null;
	}

}

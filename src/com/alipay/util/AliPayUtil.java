package com.alipay.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.config.AlipayConfig;

/**
 * 支付宝APP支付返回字符串
 * 
 * @author lgh-pc
 * 
 */

public class AliPayUtil {
	
	public static void main(String[] args) {
		String response = pay2persion("3815228@qq.com","刘光华","1");
		System.out.println(response);
		
	}

	/**
	 * 
	 * @param orderId
	 *            订单号，长度不超过32位，全球唯一，最好用UUID
	 * @param money
	 *            付款金额 0.01元
	 * @param notifyUrl
	 *            付款成功后回调URL
	 * @param title
	 *            标题，如打赏
	 * @return 返回null，则生成失败
	 */
	public static String createPayString(String orderId, String money,
			String notifyUrl, String title) {
		// _input_charset=\"utf-8\"&it_b_pay=\"2017-01-11
		// 22:50:50\"&notify_url=\"http://xlsc.wang/alipay.do?p=alipayreturn\"&out_trade_no=\"8CB05A2B48C0A3E505EA955B42097527\"&partner=\"2088902080624821\"&payment_type=\"1\"&seller_id=\"2088902080624821\"&service=\"mobile.securitypay.pay\"&subject=\"携联联盟众筹投资\"&total_fee=\"12.0\"&sign=\"这里写sign签名\"&sign_type=\"RSA\"
		// _input_charset=\"utf-8\"&it_b_pay=\"2017-01-11 22:59:28\"&notify_url=\"https://api.beecloud.cn/2/rest/callback/Ali/44f01a13-965f-4b27-ba9f-da678b47f3f5/3d9bd0ef-e753-4cea-b0e4-5f50466a34bd\"&out_trade_no=\"20170111225324747\"&partner=\"2088801273866834\"&payment_type=\"1\"&seller_id=\"2088801273866834\"&service=\"mobile.securitypay.pay\"&subject=\"DCloud项目捐赠\"&total_fee=\"1.0\"&sign=\"\"&sign_type=\"RSA\""

		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			long da = date.getTime();
			da += 300000;

			Date date2 = new Timestamp(da);

			StringBuffer sb = new StringBuffer();
			sb.append("_input_charset=\"");
			sb.append("utf-8");// 采用相同的编码方式
			sb.append("\"&it_b_pay=\"");
			sb.append(sdf.format(date2));// （订单过期时间 30分钟过期无效）
			sb.append("\"&notify_url=\"");
			sb.append(notifyUrl);// 客户付款后,支付宝调用的页面
			sb.append("\"&out_trade_no=\"");
			sb.append(orderId);// 外部交易号,最好具有唯一性,在获取支付宝发来的付款信息时使用.
			sb.append("\"&partner=\"");
			sb.append(AlipayConfig.partner);// partnerId(合作伙伴ID)
			sb.append("\"&payment_type=\"");// 付款类型 固定值
			sb.append("1");
			sb.append("\"&seller_id=\"");
			sb.append(AlipayConfig.SELLER_ID);// 卖家支付宝ID
			sb.append("\"&service=\"");
			sb.append("mobile.securitypay.pay");// 移动支付
			sb.append("\"&subject=\"");
			sb.append(title);// 支付的名字
			sb.append("\"&total_fee=\"");
			sb.append(money);// 总价
			sb.append("\"&sign=\"");

			Map<String, String> map = new HashMap<String, String>();
			map.put("_input_charset", "\"" + "utf-8" + "\"");
			map.put("it_b_pay", "\"" + sdf.format(date2) + "\"");
			map.put("notify_url", "\"" + notifyUrl + "" + "\"");
			map.put("out_trade_no", "\"" + orderId + "" + "\"");
			map.put("partner", "\"" + AlipayConfig.partner + "" + "\"");
			map.put("payment_type", "\"" + "1" + "\"");
			map.put("seller_id", "\"" + AlipayConfig.SELLER_ID + "" + "\"");
			map.put("service", "\"" + "mobile.securitypay.pay" + "\"");
			map.put("subject", "\"" + title + "\"");
			map.put("total_fee", "\"" + money + "" + "\"");
			String signOrderUrl = AlipaySignature.rsaSign(map,
					AlipayConfig.private_key, "utf-8");
			String ss = URLEncoder.encode(signOrderUrl, "utf-8");
			System.out.println(ss);
			sb.append(ss);// sign签名
			sb.append("\"&sign_type=\"");
			sb.append("RSA");// 签名加密
			sb.append("\"");
			System.out.println(sb.toString());
			return sb.toString();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (AlipayApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 转帐到个人支付宝
	 * 
	 * @param payee_account  收款方支付宝帐号
	 * @param payee_name     收款方真实姓名
	 * @param money          付款金额(单位元，最低金额1)
	 */
	public static String pay2persion(String payee_account, String payee_name,
			String money) {
		Map sParaTemp = new HashMap();
		sParaTemp.put("sign_type", AlipayConfig.pc_sign_type);// 签名方式
		sParaTemp.put("service", "alipay.fund.trans.toacc");// 接口名称
		sParaTemp.put("partner", AlipayConfig.partner);// 合作者身份ID
		sParaTemp.put("out_biz_no", UUID.randomUUID().toString().replaceAll(
				"-", ""));// 商户转账唯一订单号
		sParaTemp.put("payer_type", "ALIPAY_USERID");// 付款方账户类型
		sParaTemp.put("payer_account", AlipayConfig.partner);// 付款方账户
		sParaTemp.put("payer_name", "");// 付款方真实姓名
		sParaTemp.put("payee_type", "ALIPAY_LOGONID");// 收款方账户类型
		sParaTemp.put("payee_account", payee_account);// 收款方账户
		sParaTemp.put("payee_ real_name", payee_name);// 收款方真实姓名
		sParaTemp.put("_input_charset", AlipayConfig.input_charset);// 编码
		sParaTemp.put("amount", money);// 转账金额
		sParaTemp.put("memo", "打赏");// 转账备注
		try {
			String response = AlipaySubmit.buildRequest("", "", sParaTemp);
			return response;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}

package com.action;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 竞猜赔率
 * 
 * @author 肖
 * 
 */
public class JccsConfig {
	public static String qhodds = null; // 竞猜球号的赔率
	public static String dsodds = null; // 竞猜单双大小的赔率
	public static String ysodds = null; // 竞猜余数的赔率
	public static String fubei = null; // 冲福贝送福贝 按 百分比 赠送
	public static String gyjccs = null; // 每天公益竞猜次数
	public static String vipsanyue = null;// VIP三个月的价格
	public static String vipyinian = null;// VIP一年的价格
	public static String viptwonian = null;// VIP两年的价格
	public static String yuchejiage = null; // 彩票预测价格
	public static String yucehfanxian = null;// 彩票预测返现

	public static String getYuchejiage() {
		return yuchejiage;
	}

	public static void setYuchejiage(String yuchejiage) {
		JccsConfig.yuchejiage = yuchejiage;
	}

	public static String getYucehfanxian() {
		return yucehfanxian;
	}

	public static void setYucehfanxian(String yucehfanxian) {
		JccsConfig.yucehfanxian = yucehfanxian;
	}

	public static String getGyjccs() {
		return gyjccs;
	}

	public static void setGyjccs(String gyjccs) {
		JccsConfig.gyjccs = gyjccs;
	}

	public static String getQhodds() {
		return qhodds;
	}

	public static void setQhodds(String qhodds) {
		JccsConfig.qhodds = qhodds;
	}

	public static String getDsodds() {
		return dsodds;
	}

	public static void setDsodds(String dsodds) {
		JccsConfig.dsodds = dsodds;
	}

	public static String getYsodds() {
		return ysodds;
	}

	public static void setYsodds(String ysodds) {
		JccsConfig.ysodds = ysodds;
	}

	public static String getFubei() {
		return fubei;
	}

	public static void setFubei(String fubei) {
		JccsConfig.fubei = fubei;
	}

	public static String getVipsanyue() {
		return vipsanyue;
	}

	public static void setVipsanyue(String vipsanyue) {
		JccsConfig.vipsanyue = vipsanyue;
	}

	public static String getVipyinian() {
		return vipyinian;
	}

	public static void setVipyinian(String vipyinian) {
		JccsConfig.vipyinian = vipyinian;
	}

	public static String getViptwonian() {
		return viptwonian;
	}

	public static void setViptwonian(String viptwonian) {
		JccsConfig.viptwonian = viptwonian;
	}

	static {
		Properties properties = new Properties();
		InputStream is = JccsConfig.class
				.getResourceAsStream("/jccs.properties");
		try {
			properties.load(is);
			qhodds = properties.getProperty("qhodds").trim();
			dsodds = properties.getProperty("dsodds").trim();
			ysodds = properties.getProperty("ysodds").trim();
			fubei = properties.getProperty("fubei").trim();
			gyjccs = properties.getProperty("gyjccs").trim();
			vipsanyue = properties.getProperty("vipsanyue").trim();
			vipyinian = properties.getProperty("vipyinian").trim();
			viptwonian = properties.getProperty("viptwonian").trim();
			yuchejiage = properties.getProperty("yuchejiage").trim();
			yucehfanxian = properties.getProperty("yucehfanxian").trim();
			is.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}

	}

}

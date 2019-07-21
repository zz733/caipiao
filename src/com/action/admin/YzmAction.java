package com.action.admin;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/*
 * 验证码
 * */
@Controller
@RequestMapping("/yzm.do")
public class YzmAction {
	@Autowired
	private HttpServletRequest request;
	
	private static Random random = new Random();
	
	public static final char[] CHARS={ '2', '3', '4', '5', '6', '7', '8',
		'9', 'A', 'Q', 'W', 'E', 'R', 'T', 'G', 'D', 'S', 'G',
		'H','B','C','F','J','K','M','N' };// 随机字符的字典
	
	public static String getRandomString(){
		//字符的缓存
		StringBuffer buf = new StringBuffer();
		for (int i = 0; i < 4; i++) {  //循环 四次
			buf.append(CHARS[random.nextInt(CHARS.length)]);
		}
		return buf.toString();
	}
	
	public static Color getRandomColor(){
		return new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255));
	}
	
	public static Color getReverseColor(Color c){
		return new Color(255-c.getRed(),255-c.getGreen(),255-c.getBlue());
	}
	
	//验证码转成图片
	@RequestMapping(params="p=getCode")
	public void getCode(HttpServletResponse response) throws IOException{
		response.setContentType("image/jpeg");// 设置输出的类型
		String randomString = getRandomString();// 得到返回的字符集
		request.getSession(true).setAttribute("code", randomString);
		int with = 100;
		int hight = 30;// 生成图片的大小
		Color color = getRandomColor();// 用于背景色
		Color reverse = getReverseColor(color);// 用于前景色
		BufferedImage bi = new BufferedImage(with, hight,
				BufferedImage.TYPE_INT_RGB);// 创建一个彩色的图片
		Graphics g = bi.createGraphics();// 获取到绘图对象
		g.setFont(new Font("宋体",Font.BOLD,24));// 设置字体
		g.setColor(color);// 设置颜色
		g.fillRect(0, 0, with, hight);// 绘制背景
		g.setColor(reverse);// 设置颜色
		//画干扰线或点
		g.setColor(Color.black);
		g.drawLine(random.nextInt(80), random.nextInt(20), random.nextInt(80), random.nextInt(20));
		g.drawLine(random.nextInt(80), random.nextInt(20), random.nextInt(80), random.nextInt(20));
		g.drawLine(random.nextInt(80), random.nextInt(20), random.nextInt(80), random.nextInt(20));
		g.drawLine(random.nextInt(80), random.nextInt(20), random.nextInt(80), random.nextInt(20));
		g.drawString(randomString, 18, 20);// 绘制随机字符
		for (int i = 0, n = random.nextInt(30); i < n; i++) {// 画最多100个噪音点
			g.drawRect(random.nextInt(with), random.nextInt(hight), 1, 1);// 随机噪音点
		}
		ServletOutputStream out = response.getOutputStream();
		// 转换图片格式
		//JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
		//encoder.encode(bi);// 对图片进行编码
		ImageIO.write(bi, "jpeg", out);
		out.flush();// 输出
	
	}
	
	//验证验证码
	@RequestMapping(params="p=checkYzm")
	@ResponseBody
	public String checkYzm()
	{
		String yzm = request.getParameter("code");
		String code=  (String) request.getSession().getAttribute("code");
		if (yzm!=null && yzm.equalsIgnoreCase(code))
			return "1";
		
		return "0";
	}
	
	
	
}

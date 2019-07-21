package com.action.admin;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.action.JccsConfig;
import com.pojo.Admin;

/**
 * 
 * @author 肖
 * 
 */
@Controller
@RequestMapping("/jccs.do")
public class JccsAction {
	// 充值福贝赠送福贝
	@RequestMapping(params = "p=jccsfb")
	public String jccsfb(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}

		JccsConfig jccsConfig = new JccsConfig();
		String fubei = jccsConfig.getFubei();
		request.setAttribute("fubei", fubei);
		return "/admin/canshu/chongzhifubei.jsp";
	}

	// 修改 充值福贝送福贝
	@RequestMapping(params = "p=xgjccsfb")
	public String xgjccsfb(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}

		String chongzhifubei = request.getParameter("chongzhifubei");
		// double vipfubeibfb = Double.parseDouble(vipfubei)/100;
		// String fubeizensong =vipfubeibfb+"";
		JccsConfig jccsConfig = new JccsConfig();
		String path = request.getSession().getServletContext()
				.getRealPath("/WEB-INF/classes/jccs.properties"); // 路径
		Properties pro = new Properties();
		InputStream is = JccsAction.class
				.getResourceAsStream("/jccs.properties"); // 读
		pro.load(is);
		pro.setProperty("fubei", chongzhifubei.trim());
		jccsConfig.fubei = chongzhifubei.trim();
		OutputStream out = new FileOutputStream(path); // 写
		pro.store(out, null);
		out.close();
		is.close();
		return "/admin/canshu/chongzhifubei.jsp";
	}

	// 竞猜球号赔率
	@RequestMapping(params = "p=jccsqh")
	public String jccsqh(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		JccsConfig jccsConfig = new JccsConfig();
		String qhodds = jccsConfig.getQhodds();
		request.setAttribute("qhodds", qhodds);
		return "/admin/canshu/qhodds.jsp";
	}

	// 修改竞猜球号赔率
	@RequestMapping(params = "p=xgjccsqh")
	public String xgjccsqh(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String qhodds = request.getParameter("qhodds");
		JccsConfig jccsConfig = new JccsConfig();
		String path = request.getSession().getServletContext()
				.getRealPath("/WEB-INF/classes/jccs.properties"); // 路径
		Properties pro = new Properties();
		InputStream is = JccsAction.class
				.getResourceAsStream("/jccs.properties"); // 读
		pro.load(is);
		pro.setProperty("qhodds", qhodds.trim());
		jccsConfig.qhodds = qhodds.trim();
		OutputStream out = new FileOutputStream(path); // 写
		pro.store(out, null);
		out.close();
		is.close();

		return null;
	}

	// 竞猜单双大小赔率
	@RequestMapping(params = "p=jccsds")
	public String jccsds(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		JccsConfig jccsConfig = new JccsConfig();
		String dsodds = jccsConfig.getDsodds();
		request.setAttribute("dsodds", dsodds);
		return "/admin/canshu/dsodds.jsp";
	}

	// 修改竞猜单双大小赔率
	@RequestMapping(params = "p=xgjccsds")
	public String xgjccsds(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String dsodds = request.getParameter("dsodds");
		JccsConfig jccsConfig = new JccsConfig();
		String path = request.getSession().getServletContext()
				.getRealPath("/WEB-INF/classes/jccs.properties"); // 路径
		Properties pro = new Properties();
		InputStream is = JccsAction.class
				.getResourceAsStream("/jccs.properties"); // 读
		pro.load(is);
		pro.setProperty("dsodds", dsodds.trim());
		jccsConfig.dsodds = dsodds.trim();
		OutputStream out = new FileOutputStream(path); // 写
		pro.store(out, null);
		out.close();
		is.close();
		return null;
	}

	// 公益竞猜次数
	@RequestMapping(params = "p=gyjccs")
	public String gyjccs(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		JccsConfig jccsConfig = new JccsConfig();
		String gyjccs = jccsConfig.getGyjccs();
		request.setAttribute("gyjccs", gyjccs);
		return "/admin/canshu/gyjccs.jsp";
	}

	// 修改公益竞猜次数
	@RequestMapping(params = "p=xggyjccs")
	public String xggyjccs(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String gyjccs = request.getParameter("gyjccs");
		JccsConfig jccsConfig = new JccsConfig();
		String path = request.getSession().getServletContext()
				.getRealPath("/WEB-INF/classes/jccs.properties"); // 路径
		Properties pro = new Properties();
		InputStream is = JccsAction.class
				.getResourceAsStream("/jccs.properties"); // 读
		pro.load(is);
		pro.setProperty("gyjccs", gyjccs.trim());
		jccsConfig.gyjccs = gyjccs.trim();
		OutputStream out = new FileOutputStream(path); // 写
		pro.store(out, null);
		out.close();
		is.close();
		return null;
	}

	// 竞猜余数赔率
	@RequestMapping(params = "p=jccsys")
	public String jccsys(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		JccsConfig jccsConfig = new JccsConfig();
		String ysodds = jccsConfig.getYsodds();
		request.setAttribute("ysodds", ysodds);
		return "/admin/canshu/ysodds.jsp";
	}
	
	// 获取预测价格
	@RequestMapping(params = "p=yuchejiage")
	public String yuchejiage(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		JccsConfig jccsConfig = new JccsConfig();
		String yuchejiage = jccsConfig.getYuchejiage();
		request.setAttribute("yuchejiage", yuchejiage);
		return "/admin/canshu/yucejiage.jsp";
	}

	
	
	// 获取预测返现
	@RequestMapping(params = "p=yucehfanxian")
	public String yucehfanxian(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		JccsConfig jccsConfig = new JccsConfig();
		String yucehfanxian = jccsConfig.getYucehfanxian();
		request.setAttribute("yucehfanxian", yucehfanxian);
		return "/admin/canshu/yucefanxian.jsp";
	}


	// 修改余数赔率
	@RequestMapping(params = "p=xgjccsys")
	public String xgjccsys(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String ysodds = request.getParameter("ysodds");
		JccsConfig jccsConfig = new JccsConfig();
		String path = request.getSession().getServletContext()
				.getRealPath("/WEB-INF/classes/jccs.properties"); // 路径
		Properties pro = new Properties();
		InputStream is = JccsAction.class
				.getResourceAsStream("/jccs.properties"); // 读
		pro.load(is);
		pro.setProperty("ysodds", ysodds.trim());
		jccsConfig.ysodds = ysodds.trim();
		OutputStream out = new FileOutputStream(path); // 写
		pro.store(out, null);
		out.close();
		is.close();
		return null;
	}
	
	
	// 修改预测价格
	@RequestMapping(params = "p=xgyuche_price")
	public String xgyuche_price(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String yuchejiage = request.getParameter("yuchejiage");
		JccsConfig jccsConfig = new JccsConfig();
		String path = request.getSession().getServletContext()
				.getRealPath("/WEB-INF/classes/jccs.properties"); // 路径
		Properties pro = new Properties();
		InputStream is = JccsAction.class
				.getResourceAsStream("/jccs.properties"); // 读
		pro.load(is);
		pro.setProperty("yuchejiage", yuchejiage.trim());
		jccsConfig.yuchejiage = yuchejiage.trim();
		OutputStream out = new FileOutputStream(path); // 写
		pro.store(out, null);
		out.close();
		is.close();
		return null;
	}

	
	// 修改预测价格返现
	@RequestMapping(params = "p=xg_yucehfanxian")
	public String xg_yucehfanxian(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String yucehfanxian = request.getParameter("yucehfanxian");
		JccsConfig jccsConfig = new JccsConfig();
		String path = request.getSession().getServletContext()
				.getRealPath("/WEB-INF/classes/jccs.properties"); // 路径
		Properties pro = new Properties();
		InputStream is = JccsAction.class
				.getResourceAsStream("/jccs.properties"); // 读
		pro.load(is);
		pro.setProperty("yucehfanxian", yucehfanxian.trim());
		jccsConfig.yucehfanxian = yucehfanxian.trim();
		OutputStream out = new FileOutputStream(path); // 写
		pro.store(out, null);
		out.close();
		is.close();
		return null;
	}

	
	
	// VIP开通价格
	@RequestMapping(params = "p=jccsvip")
	public String jccsvip(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		JccsConfig jccsConfig = new JccsConfig();

		Map csmap = new HashMap();
		String sanyue = jccsConfig.getVipsanyue();
		String yinian = jccsConfig.getVipyinian();
		String twonian = jccsConfig.getViptwonian();
		csmap.put("sanyue", sanyue);
		csmap.put("yinian", yinian);
		csmap.put("twonian", twonian);
		request.setAttribute("csmap", csmap);
		return "/admin/canshu/vipjiage.jsp";
	}

	// 修改VIP充值价格
	@RequestMapping(params = "p=xgjccsvip")
	public String xgjccsvip(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String sanyue = request.getParameter("sanyue");
		String yinian = request.getParameter("yinian");
		String twonian = request.getParameter("twonian");
		JccsConfig jccsConfig = new JccsConfig();
		String path = request.getSession().getServletContext()
				.getRealPath("/WEB-INF/classes/jccs.properties"); // 路径
		Properties pro = new Properties();
		InputStream is = JccsAction.class
				.getResourceAsStream("/jccs.properties"); // 读
		pro.load(is);
		pro.setProperty("vipsanyue", sanyue.trim());
		jccsConfig.vipsanyue = sanyue.trim();
		pro.setProperty("vipyinian", yinian.trim());
		jccsConfig.vipyinian = yinian.trim();
		pro.setProperty("viptwonian", twonian.trim());
		jccsConfig.viptwonian = twonian.trim();
		OutputStream out = new FileOutputStream(path); // 写
		pro.store(out, null);
		out.close();
		is.close();
		return null;
	}
}

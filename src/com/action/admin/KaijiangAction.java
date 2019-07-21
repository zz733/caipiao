package com.action.admin;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.pojo.Kaijiang;
import com.service.admin.KaijiangService;
import com.util.StringUtil;

/**
 * 
 * @author xch
 * 
 */
@Controller
@RequestMapping("/kaijiang.do")
public class KaijiangAction {
	@Autowired
	private KaijiangService kaijiangService;
	private String dan;
	private String dsdx;
	private String yusan;
	@RequestMapping(params = "p=updatekaijiang")
	@ResponseBody
	public String updateKaiJiang(HttpServletRequest request){
		
		System.out.println("laile2");
		
		String kjId = request.getParameter("id");
		String qishu = request.getParameter("Qishu");
		String oneRed = request.getParameter("oneRed");
		String twoRed = request.getParameter("twoRed");
		String threeRed = request.getParameter("threeRed");
		String fourRed = request.getParameter("fourRed");
		String fiveRed = request.getParameter("fiveRed");
		String sixRed = request.getParameter("sixRed");
		String blue = request.getParameter("Blue");
		String time = request.getParameter("commentdatemin");
		
		int mykjId = Integer.parseInt(kjId);
		int Blue = Integer.parseInt(blue);
		int Redone = Integer.parseInt(oneRed);
		int Redtwo = Integer.parseInt(twoRed);
		int Redthree = Integer.parseInt(threeRed);
		int Redfour = Integer.parseInt(fourRed);
		int Redfive = Integer.parseInt(fiveRed);
		int Redsix = Integer.parseInt(sixRed);
		Kaijiang kaijiang = new Kaijiang();
		Timestamp mytime = Timestamp.valueOf(time); 
		kaijiang.setKjBlue(Blue);
		kaijiang.setKjId(mykjId);
		kaijiang.setKjQishu(qishu);
		kaijiang.setKjRedfive(Redfive);
		kaijiang.setKjRedfour(Redfour);
		kaijiang.setKjRedone(Redone);
		kaijiang.setKjRedsix(Redsix);
		kaijiang.setKjRedthree(Redthree);
		kaijiang.setKjRedtwo(Redtwo);
		kaijiang.setKjTime(mytime);
		
		int n = kaijiangService.updateKaiJiang( kaijiang);
		return "success";
	}
	
	@RequestMapping(params = "p=getKaiJiangById")
	public String getKaiJiangById(HttpServletRequest request){
		String mykjid = request.getParameter("id");
		List list = kaijiangService.getKaiJiangById(Integer.parseInt(mykjid));
		request.setAttribute("list", list);
		System.out.println("laile");
		return "/admin/kaijiang/updatekaijiang.jsp";
	}
	
	
	@RequestMapping(params = "p=piliangshanchu")
	public String batchDelete(HttpServletRequest request,
			HttpServletResponse response){
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		System.out.println("laile");
		String kjid = request.getParameter("kjId");
		kaijiangService.plShanChu(kjid);
		return "/admin/kaijiang/qiuhaoruku.jsp";
	}
	
	@RequestMapping(params = "p=zhongjiangjilu")
	public String Allzhongjiangjilurecord(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int page = 1;
		int size = 1;
		String pageString = request.getParameter("page");
		String sizeString = request.getParameter("size");
		String username = request.getParameter("usersName");
		String mindate = request.getParameter("mintime");
		Timestamp mintime = null;
		if (StringUtil.isNotNull(mindate) && mindate.trim().length() > 0)
			mintime = Timestamp.valueOf(mindate + " 00:00:00");
		String maxdate = request.getParameter("maxtime");
		Timestamp maxtime = null;
		if (StringUtil.isNotNull(maxdate) && maxdate.trim().length() > 0)
			maxtime = Timestamp.valueOf(maxdate + " 23:59:59");
		if (pageString != null && pageString.trim().length() > 0)
			page = Integer.parseInt(pageString);
		if (sizeString != null && sizeString.trim().length() > 0)
			size = Integer.parseInt(sizeString);
		Map zhongjiangmap = kaijiangService.getAllzhongjiang(username, mintime,
				maxtime);
		request.setAttribute("zhongjiangmap", zhongjiangmap);
		return "/admin/kaijiang/zhongjiangjilu.jsp";
	}

	// 中奖详情
	@RequestMapping(params = "p=zhongjiangxiangqing")
	public String zhongjiangxiangqing(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String id = request.getParameter("id");
		Map xiangqingmap = kaijiangService.getXiangqingById(id);
		request.setAttribute("xiangqingmap", xiangqingmap);
		return "/admin/kaijiang/zhongjiangxiangqing.jsp";

	}

	// 查询所有往期开奖
	@RequestMapping(params = "p=getAllkaijiang")
	public String getAllkaijiang(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int page = 1;
		int size = 1;
		String pageString = request.getParameter("page");
		String sizeString = request.getParameter("size");
		String kjQishu = request.getParameter("kjQishu");
		String mindate = request.getParameter("mintime");
		Timestamp mintime = null;
		if (StringUtil.isNotNull(mindate) && mindate.trim().length() > 0)
			mintime = Timestamp.valueOf(mindate + " 00:00:00");
		String maxdate = request.getParameter("maxtime");
		Timestamp maxtime = null;
		if (StringUtil.isNotNull(maxdate) && maxdate.trim().length() > 0)
			maxtime = Timestamp.valueOf(maxdate + " 23:59:59");
		if (pageString != null && pageString.trim().length() > 0)
			page = Integer.parseInt(pageString);
		if (sizeString != null && sizeString.trim().length() > 0)
			size = Integer.parseInt(sizeString);
		Map kaijiangmap = kaijiangService.getAllkaijiang(kjQishu, mintime,
				maxtime);
		request.setAttribute("kaijiangmap", kaijiangmap);
		return "/admin/kaijiang/qiuhaoruku.jsp";
	}

	// 查询最大期数
	@RequestMapping(params = "p=getMaxQishu")
	public String getMaxQishu(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		List maxqishulist = kaijiangService.getMaxQishu();
		request.setAttribute("maxqishulist", maxqishulist);
		return "/admin/kaijiang/addqiuhao.jsp";
	}

	// 查询所有中奖人员
	public void zhongjiang(String qishu, int blueqiu) {
		String blueqiu2 = blueqiu + "";
		if (blueqiu % 2 == 0 && blueqiu <= 8) {
			dsdx = "双小";
		} else if (blueqiu % 2 == 0 && blueqiu > 8) {
			dsdx = "双大";
		} else if (blueqiu % 2 != 0 && blueqiu <= 8) {
			dsdx = "单小";
		} else {
			dsdx = "单大";
		}

		if (blueqiu % 3 == 0) {
			yusan = "余0";
		} else if (blueqiu % 3 == 1) {
			yusan = "余1";
		} else {
			yusan = "余2";
		}
		kaijiangService.updatejcodWinning(qishu, dsdx, blueqiu2, yusan);

	}

	// 球号入库 每期开奖写入数据库
	@RequestMapping(params = "p=addQiuhao")
	public String addQiuhao(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String commentdatemin = request.getParameter("commentdatemin");
		Timestamp kaijiangtime = null;
		if (StringUtil.isNotNull(commentdatemin)
				&& commentdatemin.trim().length() > 0)
			kaijiangtime = Timestamp.valueOf(commentdatemin);

		String qishu = request.getParameter("Qishu");
		String oneRed = request.getParameter("oneRed");
		String twoRed = request.getParameter("twoRed");
		String threeRed = request.getParameter("threeRed");
		String fourRed = request.getParameter("fourRed");
		String fiveRed = request.getParameter("fiveRed");
		String sixRed = request.getParameter("sixRed");
		String blue = request.getParameter("Blue");
		int Blue = Integer.parseInt(blue);
		int Redone = Integer.parseInt(oneRed);
		int Redtwo = Integer.parseInt(twoRed);
		int Redthree = Integer.parseInt(threeRed);
		int Redfour = Integer.parseInt(fourRed);
		int Redfive = Integer.parseInt(fiveRed);
		int Redsix = Integer.parseInt(sixRed);
		int[] a = new int[] { Redone, Redtwo, Redthree, Redfour, Redfive,
				Redsix };
		for (int i = 0; i < a.length; i++) {
			for (int j = 0; j < a.length - 1; j++) {
				int t = 0;
				if (a[j] > a[j + 1]) {
					t = a[j];
					a[j] = a[j + 1];
					a[j + 1] = t;
				}
			}
		}
		Date date = new Date();

		Kaijiang kaijiang = new Kaijiang();
		kaijiang.setKjQishu(qishu);
		kaijiang.setKjRedone(a[0]);
		kaijiang.setKjRedtwo(a[1]);
		kaijiang.setKjRedthree(a[2]);
		kaijiang.setKjRedfour(a[3]);
		kaijiang.setKjRedfive(a[4]);
		kaijiang.setKjRedsix(a[5]);
		kaijiang.setKjBlue(Blue);
		kaijiang.setKjTime(kaijiangtime);
		kaijiangService.addqiuhao(kaijiang);
		zhongjiang(qishu, Blue);
		return "/admin/kaijiang/qiuhaoruku.jsp";

	}
}

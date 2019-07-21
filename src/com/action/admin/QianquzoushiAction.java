package com.action.admin;

import java.sql.Timestamp;
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
import com.pojo.Qianquzoushi;
import com.service.admin.QianquzoushiService;
import com.util.StringUtil;

@Controller
@RequestMapping("/qianquzoushi.do")
public class QianquzoushiAction {
	@Autowired
	private QianquzoushiService qianquzoushiService;
	private String dan;
	private String dsdx;
	private String yusan;
	@RequestMapping(params = "p=updateqianquzoushi")
	@ResponseBody
	public String updateQianquzoushi(HttpServletRequest request){
		
		System.out.println("laile2");
		
		String kjId = request.getParameter("id");
		String qishu = request.getParameter("Qishu");
		String oneRed = request.getParameter("oneRed");
		String twoRed = request.getParameter("twoRed");
		String threeRed = request.getParameter("threeRed");
		String fourRed = request.getParameter("fourRed");
		String fiveRed = request.getParameter("fiveRed");
		
		String oneBlue = request.getParameter("oneBlue");
		String twoBlue = request.getParameter("twoBlue");
		String time = request.getParameter("commentdatemin");
		
		int mykjId = Integer.parseInt(kjId);
		int Blueone = Short.parseShort(oneBlue);
		int Bluetwo =  Short.parseShort(twoBlue);
		int Redone = Integer.parseInt(oneRed);
		int Redtwo = Integer.parseInt(twoRed);
		int Redthree = Integer.parseInt(threeRed);
		int Redfour = Integer.parseInt(fourRed);
		int Redfive = Integer.parseInt(fiveRed);
		
		Qianquzoushi kaijiang = new Qianquzoushi();
		Timestamp mytime = Timestamp.valueOf(time); 
		kaijiang.setQqzsBlueone(Blueone);
		kaijiang.setQqzsBluetwo(Bluetwo);
		kaijiang.setQqzsId(mykjId);
		kaijiang.setQqzsQishu(qishu);
		kaijiang.setQqzsRedfive(Redfive);
		kaijiang.setQqzsRedfour(Redfour);
		kaijiang.setQqzsRedone(Redone);
		kaijiang.setQqzsRedthree(Redthree);
		kaijiang.setQqzsRedtwo(Redtwo);
		kaijiang.setQqzsTime(mytime);
		
		int n = qianquzoushiService.updateQianquzoushi(kaijiang);
		return "success";
	}
	
	@RequestMapping(params = "p=getQianquzoushiById")
	public String getQianquzoushiById(HttpServletRequest request){
		String mykjid = request.getParameter("id");
		List list = qianquzoushiService.getQianquzoushiById(Integer.parseInt(mykjid));
		request.setAttribute("list", list);
		System.out.println("laile");
		return "/admin/qianquzoushi/updateqianquzoushi.jsp";
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
		qianquzoushiService.plShanChu(kjid);
		return "/admin/qianquzoushi/qiuhaoruku.jsp";
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
		Map zhongjiangmap = qianquzoushiService.getAllQianquzoushi(username, mintime,
				maxtime);
		request.setAttribute("zhongjiangmap", zhongjiangmap);
		return "/admin/qianquzoushi/qianquzoushijilu.jsp";
	}

	// 中奖详情
	@RequestMapping(params = "p=qianquzoushixiangqing")
	public String zhongjiangxiangqing(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String id = request.getParameter("id");
		Map xiangqingmap = qianquzoushiService.getXiangqingById(id);
		request.setAttribute("xiangqingmap", xiangqingmap);
		return "/admin/kaijiang/zhongjiangxiangqing.jsp";

	}

	// 查询所有往期开奖
	@RequestMapping(params = "p=getAllqianquzoushi")
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
		Map kaijiangmap = qianquzoushiService.getAllQianquzoushi(kjQishu, mintime,
				maxtime);
		request.setAttribute("qianquzoushimap", kaijiangmap);
		return "/admin/qianquzoushi/qiuhaoruku.jsp";
	}

	// 查询最大期数
	@RequestMapping(params = "p=getMaxQishu")
	public String getMaxQishu(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		List maxqishulist = qianquzoushiService.getMaxQishu();
		request.setAttribute("maxqishulist", maxqishulist);
		return "/admin/qianquzoushi/addqiuhao.jsp";
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
		qianquzoushiService.updatejcodWinning(qishu, dsdx, blueqiu2, yusan);

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
		String oneBlue = request.getParameter("oneBlue");
		String twoBlue = request.getParameter("twoBlue");
		int Blueone = Integer.parseInt(oneBlue);
		int Bluetwo = Integer.parseInt(twoBlue);
		int Redone = Integer.parseInt(oneRed);
		int Redtwo = Integer.parseInt(twoRed);
		int Redthree = Integer.parseInt(threeRed);
		int Redfour = Integer.parseInt(fourRed);
		int Redfive = Integer.parseInt(fiveRed);
		
		int[] a = new int[] { Redone, Redtwo, Redthree, Redfour, Redfive };
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
		
		int[] b = new int[] { Blueone, Bluetwo};
		for (int i = 0; i < b.length; i++) {
			for (int j = 0; j < b.length - 1; j++) {
				int t = 0;
				if (b[j] > b[j + 1]) {
					t = b[j];
					b[j] = b[j + 1];
					b[j + 1] = t;
				}
			}
		}
		Date date = new Date();
		
		Qianquzoushi kaijiang = new Qianquzoushi();
		kaijiang.setQqzsQishu(qishu);
		kaijiang.setQqzsRedone(a[0]);
		kaijiang.setQqzsRedtwo(a[1]);
		kaijiang.setQqzsRedthree(a[2]);
		kaijiang.setQqzsRedfour(a[3]);
		kaijiang.setQqzsRedfive(a[4]);
		kaijiang.setQqzsBlueone(b[0]);
		kaijiang.setQqzsBluetwo(b[1]);
		kaijiang.setQqzsTime(kaijiangtime);
		qianquzoushiService.addqiuhao(kaijiang);
		//zhongjiang(qishu, Blue);
		return "/admin/kaijiang/qiuhaoruku.jsp";

	}
}

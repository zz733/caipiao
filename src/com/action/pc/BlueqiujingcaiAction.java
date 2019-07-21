package com.action.pc;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.action.JccsConfig;
import com.dindan.GenerateNum;
import com.pojo.Jingcaiorderdetail;
import com.pojo.Userinfo;
import com.service.pc.BlueqiujingcaiService;
import com.service.pc.UserinfoService;
import com.util.StringUtil;

@Controller
@RequestMapping("/bluejingcai.do")
public class BlueqiujingcaiAction {
	@Autowired
	private BlueqiujingcaiService blueqiujingcaiService;

	@Autowired
	private UserinfoService userinfoService;

	// 获得本期竞猜期数
	@RequestMapping(params = "p=getMaxQishu")
	public String getMaxQishu(HttpServletRequest request,
			HttpServletResponse response) {
		List maxqishulist = blueqiujingcaiService.getMaxQishu();
		request.setAttribute("maxqishulist", maxqishulist);
		JccsConfig jccsConfig = new JccsConfig();
		Map csmap = new HashMap();
		csmap.put("qiuhao", jccsConfig.qhodds);
		csmap.put("daxiao", jccsConfig.dsodds);
		csmap.put("yusan", jccsConfig.ysodds);
		request.setAttribute("csmap", csmap);

		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		System.out.println(userinfo);
		if (userinfo != null) {
			userinfo = userinfoService.getUserNoCache(userinfo.getUsersId());
			request.getSession().setAttribute("userinfo", userinfo);
		}

		return "/pc/gongyijingcai/gongyijingcai.jsp";
	}

	// 竞猜蓝球添加一条记录
	@RequestMapping(params = "p=blueqiujingcai")
	@ResponseBody
	public String blueqiujingcai(HttpServletRequest request,
			HttpServletResponse response) {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		Date date = new Date();
		String ddh = "ssq" + GenerateNum.getInstance().GenerateOrder(); // 生成订单号
		int id = userinfo.getUsersId();
		Double fubeiyuer = userinfo.getUsersFubei();// 得到余额
		Double fubei = Double.parseDouble(request.getParameter("total"));
		String qishu = request.getParameter("qishu");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf2.format(date);
		Timestamp jingcaitime = null;
		if (StringUtil.isNotNull(time) && time.trim().length() > 0)
			jingcaitime = Timestamp.valueOf(time);
		JccsConfig csConfig = new JccsConfig();
		Double qhcs = Double.parseDouble(csConfig.getQhodds());
		Double dscs = Double.parseDouble(csConfig.getDsodds());
		Double yscs = Double.parseDouble(csConfig.getYsodds());
		if (fubei < fubeiyuer) {
			List<Jingcaiorderdetail> list = new ArrayList();
			String blueone = request.getParameter("blueone");
			int one = Integer.parseInt(blueone);
			if (one != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("1");
				jc.setJcodNum(one);
				jc.setJcodType(4);
				jc.setJcodCost(qhcs);
				list.add(jc);
			}
			String bluetwo = request.getParameter("bluetwo");
			int two = Integer.parseInt(bluetwo);
			if (two != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("2");
				jc.setJcodNum(two);
				jc.setJcodType(4);
				jc.setJcodCost(qhcs);
				list.add(jc);
			}
			String bluesan = request.getParameter("bluesan");
			int san = Integer.parseInt(bluesan);
			if (san != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("3");
				jc.setJcodNum(san);
				jc.setJcodType(4);
				jc.setJcodCost(qhcs);
				list.add(jc);
			}
			String bluesi = request.getParameter("bluesi");
			int si = Integer.parseInt(bluesi);
			if (si != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("4");
				jc.setJcodNum(si);
				jc.setJcodType(4);
				jc.setJcodCost(qhcs);
				list.add(jc);
			}
			String bluewu = request.getParameter("bluewu");
			int wu = Integer.parseInt(bluewu);
			if (wu != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("5");
				jc.setJcodNum(wu);
				jc.setJcodType(4);
				jc.setJcodCost(qhcs);
				list.add(jc);
			}
			String blueliu = request.getParameter("blueliu");
			int liu = Integer.parseInt(blueliu);
			if (liu != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("6");
				jc.setJcodNum(liu);
				jc.setJcodType(4);
				jc.setJcodCost(qhcs);
				list.add(jc);
			}
			String blueqi = request.getParameter("blueqi");
			int qi = Integer.parseInt(blueqi);
			if (qi != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("7");
				jc.setJcodNum(qi);
				jc.setJcodType(4);
				jc.setJcodCost(qhcs);
				list.add(jc);
			}
			String blueba = request.getParameter("blueba");
			int ba = Integer.parseInt(blueba);
			if (ba != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("8");
				jc.setJcodNum(ba);
				jc.setJcodType(4);
				jc.setJcodCost(qhcs);
				list.add(jc);
			}
			String bluejiu = request.getParameter("bluejiu");
			int jiu = Integer.parseInt(bluejiu);
			if (jiu != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("9");
				jc.setJcodNum(jiu);
				jc.setJcodType(4);
				jc.setJcodCost(qhcs);
				list.add(jc);
			}
			String blueshi = request.getParameter("blueshi");
			int shi = Integer.parseInt(blueshi);
			if (shi != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("10");
				jc.setJcodNum(shi);
				jc.setJcodType(4);
				jc.setJcodCost(qhcs);
				list.add(jc);
			}
			String blueshiyi = request.getParameter("blueshiyi");
			int shiyi = Integer.parseInt(blueshiyi);
			if (shiyi != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("11");
				jc.setJcodNum(shiyi);
				jc.setJcodType(4);
				jc.setJcodCost(qhcs);
				list.add(jc);
			}
			String blueshier = request.getParameter("blueshier");
			int shier = Integer.parseInt(blueshier);
			if (shier != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("12");
				jc.setJcodNum(shier);
				jc.setJcodType(4);
				jc.setJcodCost(qhcs);
				list.add(jc);
			}
			String blueshisan = request.getParameter("blueshisan");
			int shisan = Integer.parseInt(blueshisan);
			if (shisan != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("13");
				jc.setJcodNum(shisan);
				jc.setJcodType(4);
				jc.setJcodCost(qhcs);
				list.add(jc);
			}
			String blueshisi = request.getParameter("blueshisi");
			int shisi = Integer.parseInt(blueshisi);
			if (shisi != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("14");
				jc.setJcodNum(shisi);
				jc.setJcodType(4);
				jc.setJcodCost(qhcs);
				list.add(jc);
			}
			String blueshiwu = request.getParameter("blueshiwu");
			int shiwu = Integer.parseInt(blueshiwu);
			if (shiwu != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("15");
				jc.setJcodNum(shiwu);
				jc.setJcodType(4);
				jc.setJcodCost(qhcs);
				list.add(jc);
			}
			String blueshiliu = request.getParameter("blueshiliu");
			int shiliu = Integer.parseInt(blueshiliu);
			if (shiliu != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("16");
				jc.setJcodNum(shiliu);
				jc.setJcodType(4);
				jc.setJcodCost(qhcs);
				list.add(jc);
			}
			String danxiao = request.getParameter("danxiao");
			int danxiao2 = Integer.parseInt(danxiao);
			if (danxiao2 != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("单小");
				jc.setJcodNum(danxiao2);
				jc.setJcodType(1);
				jc.setJcodCost(dscs);
				list.add(jc);
			}
			String danda = request.getParameter("danda");
			int danda2 = Integer.parseInt(danda);
			if (danda2 != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("单大");
				jc.setJcodNum(danda2);
				jc.setJcodType(1);
				jc.setJcodCost(dscs);
				list.add(jc);
			}
			String shuangxiao = request.getParameter("shuangxiao");
			int shuangxiao2 = Integer.parseInt(shuangxiao);
			if (shuangxiao2 != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("双小");
				jc.setJcodNum(shuangxiao2);
				jc.setJcodType(2);
				jc.setJcodCost(dscs);
				list.add(jc);
			}
			String shuangda = request.getParameter("shuangda");
			int shuangda2 = Integer.parseInt(shuangda);
			if (shuangda2 != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("双大");
				jc.setJcodNum(shuangda2);
				jc.setJcodType(2);
				jc.setJcodCost(dscs);
				list.add(jc);
			}
			String yuling = request.getParameter("yuling");
			int yuling2 = Integer.parseInt(yuling);
			if (yuling2 != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("余0");
				jc.setJcodNum(yuling2);
				jc.setJcodType(3);
				jc.setJcodCost(yscs);
				list.add(jc);
			}
			String yuyi = request.getParameter("yuyi");
			int yuyi2 = Integer.parseInt(yuyi);
			if (yuyi2 != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("余1");
				jc.setJcodNum(yuyi2);
				jc.setJcodType(3);
				jc.setJcodCost(yscs);
				list.add(jc);
			}
			String yuer = request.getParameter("yuer");
			int yuer2 = Integer.parseInt(yuer);
			if (yuer2 != 0) {
				Jingcaiorderdetail jc = new Jingcaiorderdetail();
				jc.setJcodValue("余2");
				jc.setJcodNum(yuer2);
				jc.setJcodType(3);
				jc.setJcodCost(yscs);
				list.add(jc);
			}
			blueqiujingcaiService.addjingcaidingdan(ddh, fubei, jingcaitime,
					list, id, qishu);
			return "true";
		}
		return "false";
	}
}

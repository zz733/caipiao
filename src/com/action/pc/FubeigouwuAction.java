package com.action.pc;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dindan.GenerateNum;
import com.pojo.Goods;
import com.pojo.Userinfo;
import com.service.pc.FubeigouwuService;

@Controller
@RequestMapping("/getgoods.do")
public class FubeigouwuAction {

	@Autowired
	private FubeigouwuService fubeigouwuservice;

	@Autowired
	private HttpServletRequest request;

	// 得到所有商品
	@RequestMapping(params = "p=getAllGoods")
	public String getAllGoods() {
		List list = fubeigouwuservice.getAllGoods();
		request.setAttribute("list", list);
		return "/pc/fubeiduihuan/fubeigouwu.jsp";
	}
	

	// 根据ID查询商品详情
	@RequestMapping(params = "p=getGoodsdetail")
	public String getGoodsdetail() throws IllegalArgumentException, Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		Map map = fubeigouwuservice.getGoodsdetail(id);
		request.setAttribute("map", map);

		return "/pc/fubeiduihuan/goodsdetail.jsp";
	}

	// 根据ID查询商品详情 和用户收货地址
	@RequestMapping(params = "p=getGoodsdetailandRess")
	public String getGoodsdetailandRess() throws IllegalArgumentException,
			Exception {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo"); // 得到当前登录用户对象
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu_sm.jsp";
		}
		
		int id = Integer.parseInt(request.getParameter("id"));
		Map goodmap = fubeigouwuservice.getGoodsdetail(id);
		request.setAttribute("goodmap", goodmap);
		
		
		int userid = userinfo.getUsersId();
		List resslist = fubeigouwuservice.getuserRess(userid);
		request.setAttribute("resslist", resslist);
		return "/pc/fubeiduihuan/goodsorder.jsp";
	}
	
	
	// 根据ID查询商品详情 和用户收货地址
	@RequestMapping(params = "p=getGoodsdetailandRess2")
	public String getGoodsdetailandRess2() throws IllegalArgumentException,Exception {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute("userinfo"); // 得到当前登录用户对象
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu_sm.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		Map goodmap = fubeigouwuservice.getGoodsdetail2(id);
		request.setAttribute("goodmap", goodmap);
		int userid = userinfo.getUsersId();
		List resslist = fubeigouwuservice.getuserRess(userid);
		request.setAttribute("resslist", resslist);
		return "/pc/mingshijiangyan/detail.jsp";
	}
	

	// 生成订单
	@RequestMapping(params = "p=Goodduihuan")
	@ResponseBody
	public String Goodduihuan(HttpServletRequest request,
			HttpServletResponse response) {
		int goodid = Integer.parseInt(request.getParameter("gid"));// 商品ID
		int adid = Integer.parseInt(request.getParameter("adid"));// 收货地址ID
		Goods goods = fubeigouwuservice.goodsfindByid(goodid); // 根据ID查询商品对象
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo"); // 得到当前登录用户对象
		if (userinfo == null) {
			return "/pc/yonghudenglu/denglu.jsp";
		}
		Double fubei = userinfo.getUsersFubei();// 得到用户余额
		Double money = goods.getGprice();// 商品价格
		if (fubei >= money) {
			int userid = userinfo.getUsersId();// 得到用户ID
			int num = 1; // 商品数量
			String ddh = "bcydh" + GenerateNum.getInstance().GenerateOrder(); // 订单编号
			Timestamp orderTime = new Timestamp(System.currentTimeMillis());// 下单时间
			fubeigouwuservice.addduihuandingdan(goodid, userid, money, num,
					adid, ddh, orderTime);
			return "true";
		}
		return "false";

	}
}

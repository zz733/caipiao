package com.action.admin;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.aliyun.oss.OSSClientFactory;
import com.aliyun.openservices.oss.OSSClient;
import com.dao.GoodsDAO;
import com.pojo.Admin;
import com.pojo.Goods;
import com.pojo.Userinfo;
//import com.qikemi.packages.alibaba.aliyun.oss.OSSClientFactory;
import com.service.admin.GoodsService;
import com.service.admin.GoumairecordService;
import com.util.FileCopy;
import com.util.StringUtil;
import com.util.VideoUtil;

/**
 * 功能: 添加商品 商品上架 商品下架 立即购买
 */

@Controller
@RequestMapping("/goods.do")
public class GoodsAction {
	private static final Logger logger = Logger.getLogger(GoodsAction.class);

	@Autowired
	private GoodsService goodsService;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private GoumairecordService goumairecordService;

	@Autowired
	private GoodsDAO goodsDAO;

	//private static com.aliyun.oss.OSSClient client = OSSClientFactory.create();
	/** 通过支付宝订单编号以及购买状态查找到购买的商品对象 */
	/** 查询所有购买记录 */
	@RequestMapping(params = "p=getGoumairecordByOrderId")
	public String getGoumairecordByOrderId(String orderId) {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute("userinfo");
		if (userinfo == null) {
			return "false";
		}
		Goods goods = goumairecordService.getGoumairecordByOrderId(orderId);
		goods.setGduration(VideoUtil.formatVideoDuration(Long.parseLong(goods.getGduration())));
		request.setAttribute("goods", goods);
		return "video.jsp";
	}

	/** 通过用户编号、商品编号以及购买状态查找到购买的商品对象 */
	/** 查询所有购买记录 */
	/** 通过通过用户编号和商品编号以及购买状态查找到购买的商品对象 */
	@RequestMapping(params = "p=getGoumairecordByGidAndUserid")
	@ResponseBody
	public String getGoumairecordByGidAndUserid(String gid) {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute("userinfo");
		if (userinfo == null) {
			return "false";
		}
		Goods goods = goumairecordService.getGoumairecordByGidAndUserid(gid,userinfo.getUsersId() + "");
		if (goods != null) {
			goods.setGduration(VideoUtil.formatVideoDuration(Long.parseLong(goods.getGduration())));
			request.getSession().setAttribute("goods", goods);
			return "true";
		} else {
			return "false";
		}
	}

	// 添加视频商品
		@RequestMapping(params = "p=addVideoGoods")
		@ResponseBody
		public String addVideoGoods() throws IOException {
			Admin admin = (Admin) request.getSession().getAttribute("admin");
			if (admin == null) {
				return "/admin/login.jsp";
			}
			String goodname = request.getParameter("goodname"); // 商品名称
			String gooddetail = request.getParameter("gooddetail"); // 商品详情
			String goodpriceString = request.getParameter("goodprice"); // 商品价格
			Double goodprice = Double.parseDouble(goodpriceString);
			String leijixiaoshou = request.getParameter("leijixiaoshou");
			String file = request.getParameter("files"); // 商品图片
			String gVSrc=request.getParameter("gvsrc");
			String gDuration=request.getParameter("gduration");
			
			org.json.JSONArray jsonArray = new org.json.JSONArray(file);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			String str = sdf.format(date);
			String detaImage = null;
			StringBuffer sb = new StringBuffer();
			String files[] = new String[5];
			if (jsonArray.length() > 0) {
				// 遍历数组中的图片
				for (int i = 0; i < jsonArray.length(); i++) {
					JSONObject jsonObject = jsonArray.getJSONObject(i);
					detaImage = jsonObject.getString("image").trim();// 得到图片名称
					// sb.append(detaImage+",");
					files[i] = detaImage;
				}
			}
			String file1 = null;
			String file2 = null;
			String file3 = null;
			String file4 = null;
			String file5 = null;
			// 第一张图片
			if (files[0] != null) {
				file1 = files[0];
			}
			// 第二张图片
			if (files.length >= 2 && files[1] != null) {
				file2 = files[1];
			} else {
				file2 = null;
			}
			// 第三张图片
			if (files.length >= 3 && files[2] != null) {
				file3 = files[2];
			} else {
				file3 = null;
			}
			// 第四张图片
			if (files.length >= 4 && files[3] != null) {
				file4 = files[4];
			} else {
				file4 = null;
			}
			// 第五张图片
			if (files.length >= 5 && files[4] != null) {
				file5 = files[4];
			} else {
				file5 = null;
			}
			FileCopy.copy(request, "/temp", "/images", file1);
			if (file2 != null) {
				FileCopy.copy(request, "/temp", "/images", file2);
			}
			if (file3 != null) {
				FileCopy.copy(request, "/temp", "/images", file3);
			}
			if (file4 != null) {
				FileCopy.copy(request, "/temp", "/images", file4);
			}
			if (file5 != null) {
				FileCopy.copy(request, "/temp", "/images", file5);
			}
			Goods goods = new Goods();
			goods.setGname(goodname);
			goods.setGdetail(gooddetail);
			goods.setGprice(goodprice);
			goods.setGbegin(Timestamp.valueOf(str));
			goods.setGend(Timestamp.valueOf(str));
			goods.setGstatus(1);
			goods.setGimages("images/" + file1);
			goods.setGtype("video");
			goods.setGduration(gDuration);
			goods.setGvsrc(gVSrc);
			int kucun=1;

			if (leijixiaoshou != null && StringUtil.isDigit(leijixiaoshou)) {
				goods.setLeijixiaoshou(Integer.parseInt(leijixiaoshou));
			} else {
				goods.setLeijixiaoshou(0);
			}
			if (file2 != null) {
				goods.setGimages2("images/" + file2);
			}
			if (file3 != null) {
				goods.setGimages3("images/" + file3);
			}
			if (file4 != null) {
				goods.setGimages3("images/" + file4);
			}
			if (file4 != null) {
				goods.setGimages3("images/" + file4);
			}
			goodsService.addGoods(goods);
			return "true";
		}
		
		
	/* 查找所有的视频详情分页查询 */
	@RequestMapping(params = "p=getAllVideoGoods")
	public String getAllVideoGoods(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "30") int size) {
		Map map = goodsService.getAllVideoGoods((page - 1) * size, size);
		request.getSession().setAttribute("map", map);
		return "mingshijiangyan.jsp";
	}

	/**
	 * 查找单个商品资源
	 * 
	 * @throws IOException
	 */
	@RequestMapping(params = "p=findVideoBygid")
	public String findVideoBygid(String id) throws IOException {
		List<Goods> list = goodsService.getGoodById(id);
		Goods goods = list.get(0);
		request.setAttribute(
				"video",
				com.alibaba.aliyun.oss.properties.OSSClientProperties.ossEndPoint
						+ goods.getGname());
		return "video.jsp";
	}

	// 添加商品
	@RequestMapping(params = "p=addGoods")
	@ResponseBody
	public String addGoods() throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String goodname = request.getParameter("goodname"); // 商品名称
		String gooddetail = request.getParameter("gooddetail"); // 商品详情
		String goodpriceString = request.getParameter("goodprice"); // 商品价格
		Double goodprice = Double.parseDouble(goodpriceString);
		String kuchun = request.getParameter("kuchun");
		String leijixiaoshou = request.getParameter("leijixiaoshou");
		String file = request.getParameter("files"); // 商品图片
		
		org.json.JSONArray jsonArray = new org.json.JSONArray(file);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String str = sdf.format(date);
		String detaImage = null;
		StringBuffer sb = new StringBuffer();
		String files[] = new String[5];
		if (jsonArray.length() > 0) {
			// 遍历数组中的图片
			for (int i = 0; i < jsonArray.length(); i++) {
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				detaImage = jsonObject.getString("image").trim();// 得到图片名称
				// sb.append(detaImage+",");
				files[i] = detaImage;
			}
		}
		String file1 = null;
		String file2 = null;
		String file3 = null;
		String file4 = null;
		String file5 = null;
		// 第一张图片
		if (files[0] != null) {
			file1 = files[0];
		}
		// 第二张图片
		if (files.length >= 2 && files[1] != null) {
			file2 = files[1];
		} else {
			file2 = null;
		}
		// 第三张图片
		if (files.length >= 3 && files[2] != null) {
			file3 = files[2];
		} else {
			file3 = null;
		}
		// 第四张图片
		if (files.length >= 4 && files[3] != null) {
			file4 = files[4];
		} else {
			file4 = null;
		}
		// 第五张图片
		if (files.length >= 5 && files[4] != null) {
			file5 = files[4];
		} else {
			file5 = null;
		}
		FileCopy.copy(request, "/temp", "/images", file1);
		if (file2 != null) {
			FileCopy.copy(request, "/temp", "/images", file2);
		}
		if (file3 != null) {
			FileCopy.copy(request, "/temp", "/images", file3);
		}
		if (file4 != null) {
			FileCopy.copy(request, "/temp", "/images", file4);
		}
		if (file5 != null) {
			FileCopy.copy(request, "/temp", "/images", file5);
		}
		Goods goods = new Goods();
		goods.setGname(goodname);
		goods.setGdetail(gooddetail);
		goods.setGprice(goodprice);
		goods.setGbegin(Timestamp.valueOf(str));
		goods.setGend(Timestamp.valueOf(str));
		goods.setGstatus(1);
		goods.setGimages("images/" + file1);
		if (kuchun != null && StringUtil.isDigit(kuchun)) {
			goods.setKuchun(Integer.parseInt(kuchun));
		} else {
			goods.setKuchun(0);
		}

		if (leijixiaoshou != null && StringUtil.isDigit(leijixiaoshou)) {
			goods.setLeijixiaoshou(Integer.parseInt(leijixiaoshou));
		} else {
			goods.setLeijixiaoshou(0);
		}
		if (file2 != null) {
			goods.setGimages2("images/" + file2);
		}
		if (file3 != null) {
			goods.setGimages3("images/" + file3);
		}
		if (file4 != null) {
			goods.setGimages3("images/" + file4);
		}
		if (file4 != null) {
			goods.setGimages3("images/" + file4);
		}
		goods.setGtype("other");
		goodsService.addGoods(goods);
		return "true";
	}
	/* 所有商品显示在上架页面 */
	@RequestMapping(params = "p=goodsShangjia")
	public String getAllGoods() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String gstatua = request.getParameter("gstatua");
		Map map = goodsService.getShangjiaGood(gstatua);
		request.setAttribute("map", map);
		return "admin/goods/GoodsShangjia.jsp";
	}

	/* 所有商品显示在下架页面 */
	@RequestMapping(params = "p=goodsXiajia")
	public String getAllGoods2() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String gstatua = request.getParameter("gstatua");
		Map map = goodsService.getXiajiaGoods(gstatua);
		request.setAttribute("map", map);
		return "admin/goods/GoodsXiajia.jsp";
	}

	/* 上架:根据条件查找商品 */
	@RequestMapping(params = "p=findGoods")
	public String findGoods() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String gstatus = request.getParameter("gstatus");
		String begingprice = request.getParameter("begingprice");
		String endgprice = request.getParameter("endgprice");
		String gname = request.getParameter("gname");
		Map map = goodsService
				.findGoods(begingprice, endgprice, gname, gstatus);
		request.setAttribute("map", map);
		return "admin/goods/GoodsShangjia.jsp";
	}

	/* 下架:根据条件查找商品 */
	@RequestMapping(params = "p=findGoods1")
	public String findGoods1() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String gstatus = request.getParameter("gstatus");
		String begingprice = request.getParameter("begingprice");
		String endgprice = request.getParameter("endgprice");
		String gname = request.getParameter("gname");
		Map map = goodsService
				.findGoods(begingprice, endgprice, gname, gstatus);
		request.setAttribute("map", map);
		return "admin/goods/GoodsXiajia.jsp";
	}

	/* 修改商品状态 */
	@RequestMapping(params = "p=updateGsatus")
	public String updateGstatus() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String id = request.getParameter("id");
		Goods goods = goodsService.updateStatus(id);
		return goods.getGstatus() + "";
	}

	/* 批量下架 */
	@RequestMapping(params = "p=MostupdateGsatus0")
	public String MostupdateGsatus0(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String gid = request.getParameter("gid");
		goodsService.MostupdateGsatus0(gid);
		return null;
	}

	/* 批量上架 */
	@RequestMapping(params = "p=MostupdateGsatus1")
	public String MostupdateGsatus1(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String gid = request.getParameter("gid");
		goodsService.MostupdateGsatus1(gid);
		return null;
	}

	/* 根据ID查找商品 */
	@RequestMapping(params = "p=getGoodsById")
	public String getGoodsById() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String id = request.getParameter("id");
		List list = goodsService.getGoodById(id);
		request.setAttribute("list", list);
		return "admin/goods/ueditGoodsShangjia.jsp";
	}

	/* 修改商品 */
	@RequestMapping(params = "p=updateGoods")
	@ResponseBody
	public String updateGoods() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		Integer gId = Integer.parseInt(request.getParameter("gId"));
		String gName = request.getParameter("goodname"); // 商品名称
		String gDetail = request.getParameter("gDetail"); // 商品详情
		System.out.println(gDetail);
		Double gPrice = Double.parseDouble(request.getParameter("gPrice")); // 商品价格
		Integer gstatus = Integer.parseInt(request.getParameter("gstatus"));
		String json = request.getParameter("files"); // 商品图片
		String kuchun = request.getParameter("kuchun");
		String leijixiaoshou = request.getParameter("leijixiaoshou");

		goodsService.edit(request, gId, gName, gDetail, gPrice, gstatus, json,
				kuchun, leijixiaoshou);
		return "true";
	}

	/* 根据ID查找商品详情 */
	@RequestMapping(params = "p=getGoodsDetailById")
	public String getGoodsDetailById() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String id = request.getParameter("id");
		List list = goodsService.getGoodById(id);
		request.setAttribute("list", list);
		return "admin/goods/GoodsDetail.jsp";
	}

}

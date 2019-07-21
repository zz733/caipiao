package com.service.admin;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.GoodsDAO;
import com.dao.HQLDAO;
import com.pojo.Goods;
import com.util.FileCopy;
import com.util.StringUtil;

/**
 * 
 * @author yzh
 * 
 */

@Service
public class GoodsService {

	@Autowired
	private GoodsDAO goodsDAO;

	@Autowired
	private HQLDAO hqlDAO;

	/* 新增商品 */
	public void addGoods(Goods goods) {
		goodsDAO.save(goods);
	}

	/* 根据id修改商品状态 */
	public Goods updateStatus(String id) {
		Goods goods = goodsDAO.findById(Integer.parseInt(id));
		int status = goods.getGstatus();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String str = sdf.format(date);

		if (status == 1) {
			goods.setGstatus(0);
			goods.setGend(Timestamp.valueOf(str));
			goodsDAO.save(goods);
		} else {
			goods.setGstatus(1);
			goods.setGbegin(Timestamp.valueOf(str));
			goodsDAO.save(goods);
		}
		return goods;
	}

	/* 根据条件查找商品 */
	public Map findGoods(String begingprice, String endgprice, String gname,
			String gstatua) {
		StringBuffer sb = new StringBuffer();
		List paramList = new ArrayList();
		sb.append(" where 1=1 and gstatus = " + Integer.parseInt(gstatua));
		if (begingprice != null && begingprice.trim().length() > 0) {
			Double gprice1 = Double.parseDouble(begingprice);
			sb.append(" and gprice>=?");
			paramList.add(gprice1);
		}
		if (endgprice != null && endgprice.trim().length() > 0) {
			Double gprice2 = Double.parseDouble(endgprice);
			sb.append(" and gprice<=?");
			paramList.add(gprice2);
		}
		if (gname != null && gname.trim().length() > 0) {
			sb.append(" and gname like ?");
			paramList.add("%" + gname + "%");
		}
		String sumhql = "select count(*) from Goods " + sb.toString();
		int sum = (int) hqlDAO.unique(sumhql, paramList.toArray());

		String hql = "from Goods " + sb.toString();
		List list = hqlDAO.query(hql, paramList.toArray());
		Map map = new HashMap();
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}

	/* 根据id查找商品 */
	public List getGoodById(String gid) {
		String hql = "from Goods where gid=? ";
		List list = hqlDAO.query(hql, Integer.parseInt(gid));
		return list;
	}

	/* 根据id修改商品 */
	public Goods edit(HttpServletRequest request, Integer gId, String gName,
			String gDetail, Double gPrice, Integer gstatus, String json,
			String kuchun, String leijixiaoshou) {
		Goods goods = goodsDAO.findById(gId);
		goods.setGname(gName);
		goods.setGprice(gPrice);
		goods.setGdetail(gDetail);
		goods.setGstatus(gstatus);

		if (kuchun != null && StringUtil.isDigit(kuchun)) {
			goods.setKuchun(Integer.parseInt(kuchun));
		}

		if (leijixiaoshou != null && StringUtil.isDigit(leijixiaoshou)) {
			goods.setLeijixiaoshou(Integer.parseInt(leijixiaoshou));
		}

		goodsDAO.merge(goods);

		String files[] = new String[5];
		org.json.JSONArray jsonArray = new org.json.JSONArray(json);
		String detaImage = null;
		StringBuffer sb = new StringBuffer();
		String gImages = null;
		String gImages2 = null;
		String gImages3 = null;
		String gImages4 = null;
		String gImages5 = null;

		if (jsonArray.length() > 0) {
			// 遍历数组中的图片
			for (int i = 0; i < jsonArray.length(); i++) {
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				detaImage = jsonObject.getString("image").trim();// 得到图片名称
				files[i] = detaImage;
				FileCopy.copy(request, "/temp", "/images", files[i]);
				if (files[i] != null) {
					FileCopy.copy(request, "/temp", "/images", files[i]);
				}
				// if(files[i]!=null){
				// FileCopy.copy(request, "/temp", "/images", files[i]);
				// }
				// if(files[i]!=null){
				// FileCopy.copy(request, "/temp", "/images", files[i]);
				// }
				// if(files[i]!=null){
				// FileCopy.copy(request, "/temp", "/images", files[i]);
				// }

				int id = jsonObject.getInt("id");
				if (id == 0) {
					goods.setGimages("images/" + files[i]);
					goodsDAO.merge(goods);
				}
				if (id == 1) {
					goods.setGimages2("images/" + files[i]);
					goodsDAO.merge(goods);
				}
				if (id == 2) {
					goods.setGimages3("images/" + files[i]);
					goodsDAO.merge(goods);
				}
				if (id == 3) {
					goods.setGimages4("images/" + files[i]);
					goodsDAO.merge(goods);
				}
				if (id == 4) {
					goods.setGimages5("images/" + files[i]);
					goodsDAO.merge(goods);
				}
			}
		}
		return goods;
	}

	/* 批量下架商品 */
	public void MostupdateGsatus0(String gid) {
		String hql = "update Goods set gstatus=0  where gid in(" + gid + ")";
		hqlDAO.bulkUpdate(hql);
	}

	/* 批量上架商品 */
	public void MostupdateGsatus1(String gid) {
		String hql = "update Goods set gstatus=1  where gid in(" + gid + ")";
		hqlDAO.bulkUpdate(hql);
	}

	/* 查询上架商品 */
	public Map getShangjiaGood(String gstatua) {
		String sumHQL = "select count(*) from Goods where gstatus= "
				+ Integer.parseInt(gstatua);
		int sum = (int) hqlDAO.unique(sumHQL);
		String hql = "from Goods where gstatus= " + Integer.parseInt(gstatua)
				+ " order by gbegin desc";
		List list = hqlDAO.query(hql);
		Map map = new HashMap();
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}

	/* 查询下架商品 */
	public Map getXiajiaGoods(String gstatua) {
		String sumHQL = "select count(*) from Goods where gstatus= "
				+ Integer.parseInt(gstatua);
		int sum = (int) hqlDAO.unique(sumHQL);
		String hql = "from Goods where gstatus= " + Integer.parseInt(gstatua)
				+ " order by gend desc";
		List list = hqlDAO.query(hql);
		Map map = new HashMap();
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}

	/** 查询出所有的视频类型的视频，分页查询 fenye */
	public Map getAllVideoGoods(int page, int size) {
		Map map = new HashMap();
		String sumHQL = "select count(*) from Goods where gtype='video' ";
		int sum = (int) hqlDAO.unique(sumHQL);
		if (sum < 1) {
			map.put("sum", 0);
			map.put("count", 0);
			map.put("page", 0);
			return map;
		}

		int count = sum % size == 0 ? sum / size : sum / size + 1;
		// 越界检查
		if (page < 1)
			page = 1;
		if (page > count)
			page = count;

		String hql = "from Goods where gtype='video'";
		List list = hqlDAO.pageQuery(hql, page, size, null);
		map.put("size", size);
		map.put("page", page);
		map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}

	public int updateVideosByGoodsname(String videoFile, String url) {
		String hql = "update Goods set videos='" + url + "' where videos='"
				+ videoFile + "'";
		int n = hqlDAO.update(hql, null);
		return n;
	}
}

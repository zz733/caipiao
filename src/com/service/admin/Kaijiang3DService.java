package com.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.dao.Kaijiang3dDAO;
import com.dao.RechargerecordDAO;
import com.dao.UserinfoDAO;
import com.pojo.Kaijiang3d;
import com.util.MathUtil;
import com.util.StringUtil;

@Service
public class Kaijiang3DService {

	@Autowired
	private Kaijiang3dDAO kaijiang3dDAO;

	@Autowired
	private UserinfoDAO userinfoDAO;

	@Autowired
	private RechargerecordDAO rechargerecordDAO;

	@Autowired
	private HQLDAO hqldao;

	/**
	 * 更新3D
	 * 
	 * @param Kaijiang3d
	 * @return
	 */
	public int updateKaiJiang(Kaijiang3d kaijiang3d) {
		short a = kaijiang3d.getQiu1();
		short b = kaijiang3d.getQiu2();
		short c = kaijiang3d.getQiu3();

		int max = MathUtil.max(a % 10, b % 10, c % 10);
		int min = MathUtil.min(a % 10, b % 10, c % 10);
		kaijiang3d.setKudu((short) (max - min));// 跨度

		short yu0 = MathUtil.chu3yu0_count(a, b, c);
		short yu1 = MathUtil.chu3yu1_count(a, b, c);
		short yu2 = MathUtil.chu3yu2_count(a, b, c);
		kaijiang3d.setChu3yu0(yu0);
		kaijiang3d.setChu3yu1(yu1);
		kaijiang3d.setChu3yu2(yu2); // 除3余几的个数

		short jishu_count = MathUtil.jishu_count(a, b, c);
		kaijiang3d.setJishuNum(jishu_count); // 奇数个数

		short even_count = MathUtil.even_count(a, b, c);
		kaijiang3d.setOushuNum(even_count); // 偶数个数

		short prime_count = MathUtil.prime_count(a, b, c);
		kaijiang3d.setZhishuNum(prime_count);// 质数个数

		short heshu_count = MathUtil.heshu_count(a, b, c);
		kaijiang3d.setHeshuNum(heshu_count);// 合数个数

		short dashu_count = MathUtil.dashu_count(a, b, c);
		kaijiang3d.setDashuNum(dashu_count);// 大数个数

		short xiaoshu_count = MathUtil.xiaoshu_count(a, b, c);
		kaijiang3d.setXiaoshuNum(xiaoshu_count);// 小数个数

		short hewei = MathUtil.hewei(a, b, c);
		kaijiang3d.setHewei(hewei);

		// kaijiang3dDAO.save(kaijiang3d);
		kaijiang3dDAO.merge(kaijiang3d);
		return 1;
	}

	/*
	 * 根据id查询中奖纪录
	 */
	public Kaijiang3d getKaijiang3dById(int id) {
		return kaijiang3dDAO.findById(id);
	}

	/**
	 * 批量删除
	 */
	public void plShanChu(String kjId) {
		String hql = "delete from Kaijiang3d where id in (" + kjId + ")";
		hqldao.bulkUpdate(hql);
	}

	// 查询所有往期开奖
	public Map getAllKaijiang3d(String kjQishu, String mintime, String maxtime,
			int page, int size) {
		Map map = new HashMap();
		StringBuffer sb = new StringBuffer();
		List listparam = new ArrayList();
		sb.append(" where 1=1 ");

		if (kjQishu != null && kjQishu.trim().length() > 0) {
			sb.append("and qishu like ?");
			listparam.add("%" + kjQishu + "%");
		}
		if (StringUtil.isNotNull(mintime)) {
			sb.append("and time>=?");
			listparam.add(java.sql.Timestamp.valueOf(mintime + " 00:00:00"));
		}
		if (StringUtil.isNotNull(maxtime)) {
			sb.append(" and time<=?");
			listparam.add(java.sql.Timestamp.valueOf(maxtime) + " 23:59:59");
		}

		String sumHQL = "select count(*) from Kaijiang3d " + sb.toString();

		int sum = (int) hqldao.unique(sumHQL, listparam.toArray());

		if (sum < 1) {
			map.put("sum", 0);
			map.put("count", 0);
			map.put("page", 0);
			return map;
		}

		int count = sum % size == 0 ? sum / size : sum / size + 1;
		//
		// //越界检查
		if (page < 1)
			page = 1;
		if (page > count)
			page = count;

		String hql = "from Kaijiang3d " + sb.toString() + " order by id desc";
		List list = hqldao.pageQuery(hql, page, size, listparam.toArray());

		map.put("size", size);
		map.put("page", page);
		map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}

	// 查询最大期数
	public String getMaxQishu() {
		String hql = "select max(k.qishu) from Kaijiang3d k";
		List list = hqldao.query(hql);
		Object obj = list.get(0);
		if (obj == null)
			return "";
		return Long.parseLong(obj.toString()) + 1 + "";
	}

	// 球号入库 每期开奖写入数据库
	public void addqiuhao(Kaijiang3d kaijiang3d) {
		short a = kaijiang3d.getQiu1();
		short b = kaijiang3d.getQiu2();
		short c = kaijiang3d.getQiu3();

		int max = MathUtil.max(a % 10, b % 10, c % 10);
		int min = MathUtil.min(a % 10, b % 10, c % 10);
		kaijiang3d.setKudu((short) (max - min));// 跨度

		short yu0 = MathUtil.chu3yu0_count(a, b, c);
		short yu1 = MathUtil.chu3yu1_count(a, b, c);
		short yu2 = MathUtil.chu3yu2_count(a, b, c);
		kaijiang3d.setChu3yu0(yu0);
		kaijiang3d.setChu3yu1(yu1);
		kaijiang3d.setChu3yu2(yu2); // 除3余几的个数

		short jishu_count = MathUtil.jishu_count(a, b, c);
		kaijiang3d.setJishuNum(jishu_count); // 奇数个数

		short even_count = MathUtil.even_count(a, b, c);
		kaijiang3d.setOushuNum(even_count); // 偶数个数

		short prime_count = MathUtil.prime_count(a, b, c);
		kaijiang3d.setZhishuNum(prime_count);// 质数个数

		short heshu_count = MathUtil.heshu_count(a, b, c);
		kaijiang3d.setHeshuNum(heshu_count);// 合数个数

		short dashu_count = MathUtil.dashu_count(a, b, c);
		kaijiang3d.setDashuNum(dashu_count);// 大数个数

		short xiaoshu_count = MathUtil.xiaoshu_count(a, b, c);
		kaijiang3d.setXiaoshuNum(xiaoshu_count);// 小数个数

		short hewei = MathUtil.hewei(a, b, c);
		kaijiang3d.setHewei(hewei);

		kaijiang3d.setTime(java.sql.Timestamp.valueOf(kaijiang3d
				.getCommentdatemin()));

		kaijiang3dDAO.save(kaijiang3d);
	}

	/**
	 * 期数是否存在
	 * 
	 * @param qishu
	 * @return true存在
	 */
	public boolean checkQishu(String qishu) {
		String hql = "from Kaijiang3d where qishu=?";
		List list = hqldao.pageQuery(hql, 1, 1, qishu);
		if (list.size() > 0)
			return true;
		return false;
	}

	public boolean del(int id) {
		Kaijiang3d kaijiang3d = kaijiang3dDAO.findById(id);
		if (kaijiang3d == null)
			return false;
		kaijiang3dDAO.delete(kaijiang3d);
		return true;
	}

}

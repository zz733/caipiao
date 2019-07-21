package com.service.admin;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.dao.PailiewuDAO;
import com.dao.RechargerecordDAO;
import com.dao.UserinfoDAO;
import com.pojo.Pailiewu;
import com.util.JsonFilter;
import com.util.MathUtil;
import com.util.SortKaijiang;
import com.util.StringUtil;

@Service
public class PailiewuService {

	@Autowired
	private PailiewuDAO pailiewuDAO;

	@Autowired
	private UserinfoDAO userinfoDAO;

	@Autowired
	private RechargerecordDAO rechargerecordDAO;

	@Autowired
	private HQLDAO hqldao;

	/**
	 * 更新3D
	 * 
	 * @param Pailiewu
	 * @return
	 */
	public int updatePailie(Pailiewu pailiewu) {
		short a = pailiewu.getQiu1();
		short b = pailiewu.getQiu2();
		short c = pailiewu.getQiu3();
		short e = pailiewu.getQiu4();
		short f = pailiewu.getQiu5();

		int max = MathUtil.max(a % 10, b % 10, c % 10, e % 10, f % 10);
		int min = MathUtil.min(a % 10, b % 10, c % 10, e % 10, f % 10);
		pailiewu.setKudu((short) (max - min));// 跨度

		short yu0 = MathUtil.chu3yu0_count(a, b, c, e, f);
		short yu1 = MathUtil.chu3yu1_count(a, b, c, e, f);
		short yu2 = MathUtil.chu3yu2_count(a, b, c, e, f);
		pailiewu.setChu3yu0(yu0);
		pailiewu.setChu3yu1(yu1);
		pailiewu.setChu3yu2(yu2); // 除3余几的个数

		short hewei = MathUtil.hewei(a, b, c);
		pailiewu.setHewei(hewei);
		// kaijiang3dDAO.save(kaijiang3d);
		pailiewuDAO.merge(pailiewu);
		return 1;
	}

	/*
	 * 根据id查询中奖纪录
	 */
	public Pailiewu getPailiewuById(int id) {
		return pailiewuDAO.findById(id);
	}

	/**
	 * 批量删除
	 */
	public void plShanChu(String kjId) {
		String hql = "delete from Pailiewu where id in (" + kjId + ")";
		hqldao.bulkUpdate(hql);
	}

	// 查询所有往期开奖
	public Map getAllPailiewu(String kjQishu, String mintime, String maxtime,
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

		String sumHQL = "select count(*) from Pailiewu " + sb.toString();

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

		String hql = "from Pailiewu " + sb.toString() + " order by id desc";
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
		String hql = "select max(k.qishu) from Pailiewu k";
		List list = hqldao.query(hql);
		Object obj = list.get(0);
		if (obj == null)
			return "";
		return Long.parseLong(obj.toString()) + 1 + "";
	}

	// 球号入库 每期开奖写入数据库
	public void addqiuhao(Pailiewu pailiewu) {
		short a = pailiewu.getQiu1();
		short b = pailiewu.getQiu2();
		short c = pailiewu.getQiu3();
		short e = pailiewu.getQiu4();
		short f = pailiewu.getQiu5();

		int max = MathUtil.max(a % 10, b % 10, c % 10, e % 10, f % 10);
		int min = MathUtil.min(a % 10, b % 10, c % 10, e % 10, f % 10);
		pailiewu.setKudu((short) (max - min));// 跨度

		short yu0 = MathUtil.chu3yu0_count(a, b, c, e, f);
		short yu1 = MathUtil.chu3yu1_count(a, b, c, e, f);
		short yu2 = MathUtil.chu3yu2_count(a, b, c, e, f);
		pailiewu.setChu3yu0(yu0);
		pailiewu.setChu3yu1(yu1);
		pailiewu.setChu3yu2(yu2); // 除3余几的个数
		short hewei = MathUtil.hewei(a, b, c);
		pailiewu.setHewei(hewei);

		pailiewu.setTime(java.sql.Timestamp.valueOf(pailiewu
				.getCommentdatemin()));

		pailiewuDAO.save(pailiewu);
	}

	/**
	 * 期数是否存在
	 * 
	 * @param qishu
	 * @return true存在
	 */
	public boolean checkQishu(String qishu) {
		String hql = "from Pailiewu where qishu=?";
		List list = hqldao.pageQuery(hql, 1, 1, qishu);
		if (list.size() > 0)
			return true;
		return false;
	}

	public boolean del(int id) {
		Pailiewu pailiewu = pailiewuDAO.findById(id);
		if (pailiewu == null)
			return false;
		pailiewuDAO.delete(pailiewu);
		return true;
	}

	/** 排列五的直选走势提供期号以及5个球的球号 */
	public String paiwuzhixuan() {
		// 期数，球1，球2，球3，球4，球5
		String hql = "select qishu, qiu1, qiu2,qiu3,qiu4,qiu5 from Pailiewu order by qishu desc";
		List list = hqldao.pageQuery(hql, 1, 30);
		Collections.reverse(list);
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig);
		return JSONArray.fromObject(list, jsonConfig).toString();
	}

	/** 排列五的排五综合选，提供期号，1-5的球号，除3余0，除3余1，除3余2 ,跨度*/
	public String paiwuzonghexuan() {
		// 期数，球1，球2，球3，球4，球5,尾数
		String hql = "select qishu, qiu1, qiu2,qiu3,qiu4,qiu5,chu3yu0,chu3yu1,chu3yu2,kudu from Pailiewu order by qishu desc";
		List list = hqldao.pageQuery(hql, 1, 30);
		Collections.reverse(list);
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig);
		return JSONArray.fromObject(list, jsonConfig).toString();
	}

	/** 排列五的前排3组选 */
	public String qianpaisanzuxuan() {
		// 期数，球1，球2，球3，跨度，和尾,除3余0个数,除3余1个数,除3余2个数
		String hql = "select qishu, qiu1, qiu2,qiu3,kudu,hewei,chu3yu0,chu3yu1,chu3yu2 from Pailiewu order by qishu desc";
		List<Object[]> list = hqldao.pageQuery(hql, 1, 30);
		Collections.reverse(list);
		for (Object[] row : list)
		{
			Short qiu1 = (Short)row[1];
			Short qiu2 = (Short)row[2];
			Short qiu3 = (Short)row[3];
			int max = MathUtil.max(qiu1,qiu2,qiu3);
			int min = MathUtil.min(qiu1,qiu2,qiu3);
			int kuadu = max-min;
			row[4] = kuadu;
			row[5] = MathUtil.hewei(qiu1,qiu2,qiu3);
			row[6] = MathUtil.chu3yu0_count(qiu1,qiu2,qiu3);
			row[7] = MathUtil.chu3yu1_count(qiu1,qiu2,qiu3);
			row[8] = MathUtil.chu3yu2_count(qiu1,qiu2,qiu3);
			
			
			
		}
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig);
		return JSONArray.fromObject(list, jsonConfig).toString();
	}

	/*** 排列五的后三排组选 */
	public String housanzuxuan() {
		// 期数，球3，球4，球5
		String hql = "select qishu,qiu3,qiu4,qiu5 from Pailiewu order by qishu desc";
		List list = hqldao.pageQuery(hql, 1, 30);
		Collections.reverse(list);
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig);
		return JSONArray.fromObject(list, jsonConfig).toString();
	}

}

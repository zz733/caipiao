package com.service.pc;

import java.util.Collections;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.util.JsonFilter;
import com.util.SortKaijiang;

@Service
public class Daletou_FindRedService {

	@Autowired
	private HQLDAO hqldao;

	public Integer getUsersCount() {
		String hql = "select count(*) from Qianquzoushi";
		List list = hqldao.pageQuery(hql, null, null, null);
		Number num = (Number) list.get(0);
		return num.intValue();
	}

	public List getRed() {
		// System.out.println(getUsersCount());
		// long t1 = System.currentTimeMillis();
		// String hqlsum = "select count(*) from Kaijiang";
		String hql = "select qqzsQishu,qqzsRedone,qqzsRedtwo,qqzsRedthree,qqzsRedfour,qqzsRedfive from Qianquzoushi order by qqzsQishu desc ";
		List list = hqldao.pageQuery(hql, 1, 30);
		return list;
	}

	public List getRed2() {
		// System.out.println(getUsersCount());
		// long t1 = System.currentTimeMillis();
		// String hqlsum = "select count(*) from Kaijiang";
		String hql = "select qqzsQishu,qqzsRedone,qqzsRedtwo,qqzsRedthree,qqzsRedfour,qqzsRedfive from Qianquzoushi order by qqzsQishu desc ";
		List list = hqldao.pageQuery(hql, 1, 30);
		return list;
	}

	public String getRedJson() {
		List list = getRed();
		Collections.sort(list, new SortKaijiang());
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig);
		return JSONArray.fromObject(list, jsonConfig).toString();
	}

	public String getRedJson2() {
		List list = getRed2();
		Collections.sort(list, new SortKaijiang());
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig);
		return JSONArray.fromObject(list, jsonConfig).toString();
	}

	/**
	 * 获取3d
	 * 
	 * 期号 球1 球2 球3 和尾 除3余0个数 除3余1个数 除3余2个数
	 * */
	public String get3d2() {
		String hql = "select qishu, qiu1, qiu2,qiu3,qiu4,qiu5, hewei, chu3yu0, chu3yu1,chu3yu2 from Qianquzoushi3d order by qishu desc";
		List list = hqldao.pageQuery(hql, 1, 30);
		Collections.sort(list, new SortKaijiang());
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig);
		return JSONArray.fromObject(list, jsonConfig).toString();
	}

	/** 业务：红球的前区走势/区间走势/前区位置走势 */
	public String get3d1() {

		// 期数，球1，球2，球3，球4，球5
		String hql = "select qishu, qiu1, qiu2,qiu3,qiu4,qiu5 from Qianquzoushi3d order by qishu desc";
		List list = hqldao.pageQuery(hql, 1, 30);
		Collections.sort(list, new SortKaijiang());
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig);
		return JSONArray.fromObject(list, jsonConfig).toString();
	}

	/** 红球的尾数走势 */
	public String get3d3() {

		// 期数，球1，球2，球3，球4，球5,尾数
		String hql = "select qishu, qiu1, qiu2,qiu3,qiu4,qiu5,chu3yu0,chu3yu1,chu3yu2 from Qianquzoushi3d order by qishu desc";
		List<Object[]> list = hqldao.pageQuery(hql, 1, 30);
		Collections.sort(list, new SortKaijiang());
		
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig);
		return JSONArray.fromObject(list, jsonConfig).toString();
	}
}

package com.service.pc;

import java.util.Collections;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import oracle.net.aso.s;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.mysql.jdbc.Util;
import com.util.HibernateSessionFactory;
import com.util.JsonFilter;
import com.util.SortKaijiang;

@Service
public class FindRedService {

	@Autowired
	private HQLDAO hqldao;
	
	public Integer getUsersCount() {  
		  String hql = "select count(*) from Kaijiang";  
		  List list = hqldao.pageQuery(hql, null, null, null);  
		  Number num = (Number) list.get(0);  
		  return num.intValue();  
		  }  
	

	public List getRed() {
//		System.out.println(getUsersCount());
		// long t1 = System.currentTimeMillis();
//	    String hqlsum = "select count(*) from Kaijiang";
		String hql = "select kjQishu,kjRedone,kjRedtwo,kjRedthree,kjRedfour,kjRedfive,kjRedsix from Kaijiang order by kjQishu desc ";
	    List list = hqldao.pageQuery(hql, 1, 30);
	    return list;
	}
	
	public List getRed2() {
//		System.out.println(getUsersCount());
		// long t1 = System.currentTimeMillis();
//	    String hqlsum = "select count(*) from Kaijiang";
		String hql = "select kjQishu,kjRedone,kjRedtwo,kjRedthree,kjRedfour,kjRedfive,kjRedsix from Kaijiang order by kjQishu desc ";
	    List list = hqldao.pageQuery(hql, 1, 30);
	    return list;
	}
	

	public String getRedJson() {
		List list = getRed();
		Collections.sort(list,new SortKaijiang());
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig);
		return JSONArray.fromObject(list, jsonConfig).toString();
	}
	
	public String getRedJson2() {
		List list = getRed2();
		Collections.sort(list,new SortKaijiang());
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig);
		return JSONArray.fromObject(list, jsonConfig).toString();
	}

	
    /**获取3d
     * 
     *  期号  球1  球2  球3   和尾  除3余0个数   除3余1个数           除3余2个数
     * */
	public String get3d2() {
		String hql = "select qishu, qiu1, qiu2,qiu3, hewei, chu3yu0, chu3yu1,chu3yu2 from Kaijiang3d order by qishu desc";
		List list = hqldao.pageQuery(hql, 1, 30);
		Collections.sort(list,new SortKaijiang());
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig);
		return JSONArray.fromObject(list, jsonConfig).toString();
	}


	public String get3d1() {
		
		//期数，球1，球2，球3，跨度，和尾
		String hql = "select qishu, qiu1, qiu2,qiu3,kudu, hewei, chu3yu0, chu3yu1,chu3yu2 from Kaijiang3d order by qishu desc";
		List list = hqldao.pageQuery(hql, 1, 30);
		Collections.sort(list,new SortKaijiang());
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig);
		return JSONArray.fromObject(list, jsonConfig).toString();
	}
}













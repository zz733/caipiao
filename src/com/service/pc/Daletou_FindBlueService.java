package com.service.pc;

import java.util.Collections;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.util.HibernateSessionFactory;
import com.util.JsonFilter;
import com.util.SortKaijiang;

@Service
public class Daletou_FindBlueService {

	@Autowired
	private HQLDAO hqldao;
	public Integer getUsersCount() {  
		  String hql = "select count(*) from Qianquzoushi";  
		  List list = hqldao.pageQuery(hql, null, null, null);  
		  Number num = (Number) list.get(0);  
		  return num.intValue();  
		  }  
	
    /**蓝球的后区走势*/
	public List getBlue() {
		String hql = "select qishu,blue1,blue2,hewei from Qianquzoushi3d order by qishu desc";
		return hqldao.pageQuery(hql, 1, 30);
	}
	
	public String getBlueJson() {
		List list = getBlue();
		Collections.sort(list,new SortKaijiang());
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig);
		return JSONArray.fromObject(list,jsonConfig).toString();
	}
	
}

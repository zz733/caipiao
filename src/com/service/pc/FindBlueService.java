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
public class FindBlueService {

	@Autowired
	private HQLDAO hqldao;
	public Integer getUsersCount() {  
		  String hql = "select count(*) from Kaijiang";  
		  List list = hqldao.pageQuery(hql, null, null, null);  
		  Number num = (Number) list.get(0);  
		  return num.intValue();  
		  }  
	
     
	public List getBlue() {
		String hql = "select kjQishu,kjBlue from Kaijiang order by kjQishu desc";
		return hqldao.pageQuery(hql, 1, 20);
	}
	
	public String getBlueJson() {
		List list = getBlue();
		Collections.sort(list,new SortKaijiang());
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig);
		return JSONArray.fromObject(list,jsonConfig).toString();
	}
	
}

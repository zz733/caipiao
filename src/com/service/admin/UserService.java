package com.service.admin;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.httpclient.cookie.IgnoreCookiesSpec;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.dao.HQLDAO;
import com.dao.UserinfoDAO;
import com.pojo.Userinfo;
import com.sun.java_cup.internal.internal_error;

/**
 * 
 * @author zn
 *
 */

@Service
public class UserService {

	@Autowired
	private HQLDAO hqldao;
	
	@Autowired
	private UserinfoDAO userinfoDAO;
	

	public Map userlisting(int type, Timestamp begintime, Timestamp endtime,String name) {
	StringBuffer sb=new StringBuffer(" where 1=1 ");
	List paramList=new ArrayList();
    if(begintime!=null){
    	sb.append(" and usersCreatetime>=?");
    	paramList.add(begintime);
    }
    if(endtime!=null){
    	sb.append(" and usersCreatetime<=?");
    	paramList.add(endtime);
    }
    if(name!=null){
    	sb.append(" and usersName like ? ");
    	paramList.add("%"+name +"%" );
    }
    String hqlsum=null;
    String hql=null;
    List list=null;
    List sumList = null;
    int sum=0;
    if(type==0){
    	hqlsum="select count(*) from Userinfo " + sb.toString()+" and usersType=0";
    	sumList=hqldao.query(hqlsum, paramList.toArray());
    	hql=" from Userinfo "+sb.toString()+" and usersType=0 order by usersId desc";
    	list=hqldao.query(hql, paramList.toArray());
    	Object obj= sumList.get(0);   
         sum = Integer.parseInt(obj.toString());   
        
    }
    if(type==1){
    	hqlsum="select count(*) from Userinfo "+ sb.toString()+" and usersType=1";
    	sumList=hqldao.query(hqlsum, paramList.toArray());
    	hql=" from Userinfo "+sb.toString()+" and usersType=1 order by usersId desc";
    	list=hqldao.query(hql, paramList.toArray()); 
    	Object obj= sumList.get(0);   
         sum = Integer.parseInt(obj.toString());   
    }
    if(type==2){
    	hqlsum="select count(*) from Userinfo"+ sb.toString();
    	sumList=hqldao.query(hqlsum, paramList.toArray());
    	hql="from Userinfo "+sb.toString()+" order by usersId desc";
    	list=hqldao.query(hql,paramList.toArray());
    	Object obj= sumList.get(0);   
         sum = Integer.parseInt(obj.toString());   
    }

    
    if(sum<1) return new HashMap();
    
/*    int count=sum%size==0? sum/size:sum/size+1;              越界检查
    if(page<1)page=1;
    if(page>count)page=count;             */
    
    Map map=new HashMap();
//    map.put("page", page);
//    map.put("size",size);
    map.put("list", list);
    map.put("sum", sum);
//    map.put("count",count);
    map.put("type",type);  
    return map;
    
	}
	
	
	public Userinfo xiugaitype(int id){
			Userinfo userinfo=userinfoDAO.findById(id);
			int type=userinfo.getUsersType();
			if(userinfo!=null)
				userinfo.setUsersType(1-type);
			userinfoDAO.save(userinfo);
			return userinfo;
	}
	
	
	
	
}

package com.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Service;

import com.dao.AdminDAO;
import com.dao.HQLDAO;
import com.pojo.Admin;
import com.sun.java_cup.internal.internal_error;
import com.util.MD5Util;

@Service
public class guanliUserService {

	@Autowired
	private HQLDAO hqldao;
	
	@Autowired
	private AdminDAO adminDAO;
	
	
	/*
	 * 分页+查询
	 */
	public Map adminlist(String adminName){
		
		StringBuffer sb=new StringBuffer(" where 1=1 ");
		List paramlist=new ArrayList();
		if(adminName!=null){
			sb.append(" and adminUsername like ? ");
			paramlist.add("%"+adminName +"%");
		}
		
		String hqlsum="select count(*) from Admin "+sb.toString();
		List sumList=hqldao.query(hqlsum , paramlist.toArray());
		String hql="from Admin "+sb.toString()+" order by adminId desc";
		List list=hqldao.query(hql , paramlist.toArray());
		
		Object obj=sumList.get(0);
		int sum=Integer.parseInt(obj.toString());  
		if(sum<1) return new HashMap();
		
		Map map=new HashMap();
		map.put("list",list);
		map.put("sum",sum);
		map.put("adminName",adminName);
		return map;
	}

	
	
	
	
	public void addAdmin(Admin admin1){
		adminDAO.save(admin1);
	}
	
	
	//验证管理员名称
	public String  yzname(String adminname){
		String hql="from Admin where adminName=?";
		List list=hqldao.query(hql,adminname);
		
		if(list.size()>0)
			return "false";
		return "true";
	}
	
	
	//验证管理员账号
	public String  yzusersname(String usersname){
		String hql="from Admin where adminUsername=?";
		List list=hqldao.query(hql,usersname);
		if(list.size()>0)
			return "false";
		return "true";
	}
	
	
	public Admin editAdminById(int adminId){
		Admin admin=adminDAO.findById(adminId);
		return admin;
	}
	
	
	
	public boolean sureEditById(int adminPower,int adminId){
		 Admin admin=adminDAO.findById(adminId);
		 if(admin!=null){
			 admin.setAdminPower(adminPower);
			 adminDAO.save(admin);
			 return true;
		 }
		 return false;
	}
	
	/*
     * 根据Id值查找
     */
	  public Admin findById(int ids) {
	        Session session = hqldao.getSessionFactory().getCurrentSession();
	        Admin admin = (Admin) session.get(Admin.class, ids);
	        return admin;
	    }
	
	
	  /*
	   * 循环删除多条记录
	   */
	public void stopAdminById(String adminId){
	
    String[] id=adminId.split(",");
    Session session=hqldao.getSessionFactory().getCurrentSession();
    for(int i=0; i<id.length ;i++){
    	
         int ids=Integer.parseInt(id[i]);    	
    	 Admin admin=this.findById(ids);
    	 admin.setAdminPower(0);
    	 adminDAO.save(admin);
         }	
		
	}




	public boolean reset_Password(int adminId) {
            Admin admin=adminDAO.findById(adminId);
            String number="123456";
            
            if(admin!=null){
            String password=MD5Util.getMD5(MD5Util.getMD5("sunjob"+number));
            admin.setAdminPassword(password);
            adminDAO.save(admin);
            return true; 
            }
            
		    return false;
            
	}   
	 
	
	
	
	
	
	
	
	
	
	
	
}

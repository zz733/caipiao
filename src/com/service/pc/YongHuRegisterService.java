package com.service.pc;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.dao.UserinfoDAO;
import com.pojo.Userinfo;
import com.util.MD5Util;

@Service
public class YongHuRegisterService {

	@Autowired
	private HQLDAO hqldao;
	@Autowired
	private UserinfoDAO userinfoDAO;

	/*
	 * public List findByName(String uname) {
	 * 
	 * List list=userinfoDAO.findByUsersPhone(uname); return list; }
	 */

	public List findByMobile(String mobile) {

		// TODO Auto-generated method stub
		List list = userinfoDAO.findByUsersPhone(mobile);
		return list;

	}

	public void zhuce(String mobile, String password) {
		System.out.println("service");
		String pwd = MD5Util.getMD5(MD5Util.getMD5("sunjob" + password));
		Userinfo user = new Userinfo();
		user.setUsersPhone(mobile);
		user.setUsersPassword(pwd);
		// 设置默认设定值
		user.setUsersName(mobile);// 用户名
		java.util.Date date = new java.util.Date();
		Timestamp time = new Timestamp(date.getTime());
		user.setUsersCreatetime(time);// 用户注册时间
		user.setUsersType(0);// 设置用户为普通会员
		user.setUsersFubei(0.0);
		userinfoDAO.save(user);
	}

}

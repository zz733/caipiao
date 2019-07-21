package com.service.pc;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.dao.UserinfoDAO;
import com.pojo.Userinfo;
import com.util.MD5Util;

@Service
public class YongHuLoginService {
	@Autowired
	private HQLDAO hqldao;
	@Autowired
	private UserinfoDAO userinfoDAO;

	// 登录
	public Userinfo login(String userphone, String password) {

		String hql = "from Userinfo where usersPhone=? and usersPassword=?";
		String pwd = MD5Util.getMD5(MD5Util.getMD5("sunjob" + password));
		//System.out.println(pwd);
		//List<Userinfo> list = hqldao.pageQuery(hql, 1, 1, userphone, pwd);
		List<Userinfo> list = hqldao.pageQuery(hql, 1, 1, userphone, pwd);
		if (list.size() > 0)
		{
			Userinfo userinfo =  list.get(0);
			Date endDate = userinfo.getUsersEndtime();
			if (endDate==null || endDate.getTime()<System.currentTimeMillis())
			{
				userinfo.setUsersType(0);
				
			}else
			{
				//userinfo.setUsersType(1);
				
			}
			userinfoDAO.merge(userinfo);
			
			return userinfo;
		}

		return null;
	}

	// 验证密码
	public String Yzpassword(String userphone, String password) {
		String hql = "from Userinfo where usersPhone=? and usersPassword=?";
		String pwd = MD5Util.getMD5(MD5Util.getMD5("sunjob" + password));
		List list = hqldao.pageQuery(hql, 1, 1, userphone, pwd);
		if (list.size() > 0)
			return "true";
		return "false";
	}

	// 修改密码
	public void update(String usersPhone, String usersPassword) {
		String pwd = MD5Util.getMD5(MD5Util.getMD5("sunjob" + usersPassword));
		String hql = " update Userinfo set usersPassword=? where usersPhone=?";
		hqldao.bulkUpdate(hql, pwd, usersPhone);

	}

	// 修改密码
	public Userinfo updatepwd(int id, String passwords) {
		Userinfo userinfo = userinfoDAO.findById(id);
		if (userinfo != null)
			userinfo.setUsersPassword(passwords);
		userinfoDAO.save(userinfo);
		return userinfo;

	}

}

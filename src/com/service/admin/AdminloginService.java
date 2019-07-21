package com.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AdminDAO;
import com.dao.HQLDAO;
import com.pojo.Admin;
import com.util.MD5Util;

/**
 * 
 * @author 肖
 * 
 */
@Service
public class AdminloginService {
	@Autowired
	private HQLDAO hqlDAO;

	@Autowired
	private AdminDAO adminDAO;

	// 登录
	public Admin login(String username, String password) {
		String hql = "from Admin where adminUsername=? and adminPassword=?";

		String pwd = MD5Util.getMD5(MD5Util.getMD5("sunjob" + password));
        System.out.println(username); 
		System.out.println(pwd);
		List<Admin> list = hqlDAO.pageQuery(hql, 1, 1, username, pwd);
		if (list.size() > 0)
			return list.get(0);
		return null;

	}

	// 验证密码
	public String Yzpwd(String username, String password) {
		String hql = "from Admin where adminUsername=? and adminPassword=?";
		String pwd = MD5Util.getMD5(MD5Util.getMD5("sunjob" + password));
		List list = hqlDAO.pageQuery(hql, 1, 1, username, pwd);
		if (list.size() > 0)
			return "true";
		return "false";

	}

	// 修改密码
	public Admin updatepwd(int id, String passwords) {
		Admin admin = adminDAO.findById(id);
		if (admin != null)
			admin.setAdminPassword(passwords);
		adminDAO.save(admin);
		return admin;

	}

}

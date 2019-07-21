package com.service.pc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.dao.UserinfoDAO;
import com.pojo.Userinfo;
import com.util.StringUtil;

@Service
public class UserinfoService {
	@Autowired
	private HQLDAO hqldao;
	@Autowired
	private UserinfoDAO userinfoDAO;

	private HttpServletRequest request;

	// 根据用户id查询绑定的微信账号和支付宝账号
	public List getAllWX(int id) {
		String hql = "from Userinfo where usersId=?";
		List list = hqldao.findByHQL(hql, id);
		return list;
	}

	public List getAllZFB(int id) {
		String hql = "from Userinfo where usersId=?";
		List list = hqldao.findByHQL(hql, id);
		return list;
	}

	// 根据用户id查询个人信息
	public Map getgerenxinxi(int id) {
		String hql = "from Userinfo where usersId=?";
		List list = hqldao.findByHQL(hql, id);
		Map map = new HashMap();
		map.put("list", list);
		return map;
	}

	// 根据用户id查询个人信息
	public Userinfo findById(int id) {
		String hql = "from Userinfo where usersId=?";
		List list = hqldao.pageQuery(hql, 1, 1, id);
		if (list.size() > 0)
			return (Userinfo) list.get(0);

		return null;
	}

	// 绑定微信
	public void addwx(int id, String usersWeixin) {
		Userinfo userinfo = userinfoDAO.findById(id);
		userinfo.setUsersWeixin(usersWeixin);
		userinfo.setUsersBdwx(1);
		userinfoDAO.save(userinfo);
	}

	// 绑定支付宝
	public void addzhfbao(int id, String usersZhifubao, String usersZhifubaoName) {
		Userinfo userinfo = userinfoDAO.findById(id);
		userinfo.setUsersZhifubao(usersZhifubao);
		userinfo.setUsersZhifubaoName(usersZhifubaoName);
		userinfo.setUsersBdzfb(1);
		userinfoDAO.save(userinfo);
	}

	// 绑定微信openID
	public void addOpenid(int id, String openid) {
		Userinfo userinfo = userinfoDAO.findById(id);
		userinfo.setUsersWeixinOpenid(openid);
		userinfo.setUsersWeixinStatus(1);
		userinfoDAO.save(userinfo);
	}

	// 修改用户名
	public Userinfo updateusername(int id, String username) {
		Userinfo userinfo = userinfoDAO.findById(id);
		if (userinfo != null)
			userinfo.setUsersName(username);
		userinfoDAO.save(userinfo);
		return userinfo;

	}

	// 修改支付宝账号
	public Userinfo updateuserzfb(int id, String userzfb) {
		Userinfo userinfo = userinfoDAO.findById(id);
		if (userinfo != null)
			userinfo.setUsersZhifubao(userzfb);
		userinfoDAO.save(userinfo);
		return userinfo;

	}

	public Userinfo getUserNoCache(Integer usersId) {
		String hql = "from Userinfo where usersId=?";
		List list = hqldao.pageQuery(hql, 1, 1, usersId);
		if (list.size()>0)
			return (Userinfo) list.get(0);
		return null;
	}

	/*
	 * 绑定微信
	 */
	public boolean bindWeixin(String weixinhao, String userId) {
		Userinfo userinfo = userinfoDAO.findById(Integer.parseInt(userId));
		if (userinfo==null)
			return false;
		if (StringUtil.isNotNull(weixinhao))
		{
			userinfo.setUsersBdwx(1);
			userinfo.setUsersWeixinOpenid(weixinhao);
			userinfoDAO.merge(userinfo);
			return true;
		}
		
		 
		return false;
		
	}
}









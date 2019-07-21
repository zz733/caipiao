package com.service.admin;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.util.SmsUtil;

@Service
public class TongjiService {
	@Autowired
	private HQLDAO hqlDAO;
	 
	public Map tongjilisting(String daydate,String yesterday,String monthone, String monthlast) {
		
		
		String userhqlsum="select count(*) from Userinfo where usersType=?";	
		int vipusersum=(int) hqlDAO.unique(userhqlsum,1);	 //总共有多少个会员
		int usersum=(int) hqlDAO.unique(userhqlsum,0);   //总共有多少个普通用户
		//今日总共注册多少个会员
		String userday="select count(*) from Userinfo where  usersType=? and usersCreatetime>=? and usersCreatetime<=? ";	
		int vipudsum=(int) hqlDAO.unique(userday,1,Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		//今日总共注册多少个普通用户
		int udsum=(int) hqlDAO.unique(userday,0, Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		
		//昨天总共注册多少个会员
		String useryesterday="select count(*) from Userinfo where  usersType=? and usersCreatetime>=? and usersCreatetime<=? ";	
		int vipuseryestersum=(int) hqlDAO.unique(useryesterday,1,Timestamp.valueOf(yesterday+"00:00:00"),Timestamp.valueOf(yesterday+"23:59:59"));
		//昨天总共注册多少个普通用户
		int useryestersum=(int) hqlDAO.unique(useryesterday,0,Timestamp.valueOf(yesterday+"00:00:00"),Timestamp.valueOf(yesterday+"23:59:59"));
		
		//本月总共注册多少个会员
		String vipusermonth="select count(*) from Userinfo where  usersType=? and usersCreatetime>=? and usersCreatetime<=? ";	
		int vipusermonthsum=(int) hqlDAO.unique(vipusermonth,1,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		//本月总共注册多少个普通用户
		int usermonthsum=(int) hqlDAO.unique(vipusermonth,0, Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		
		//待发货数量
		String orderhqlsum="select count(*) from Goodsorders where orStatus=?";
		int ordersum=(int) hqlDAO.unique(orderhqlsum, 1);		//总订单数  已付款的
		int daiordersum=(int) hqlDAO.unique(orderhqlsum, 2);	//总订单数  代发货的
		//今日下订单总数量  已付款的
		String orderday="select count(*) from Goodsorders where orStatus=? and orTime>=? and orTime<=?";
		int odsum=(int) hqlDAO.unique(orderday, 1,Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		int daiodsum=(int) hqlDAO.unique(orderday, 2,Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		//昨天下订单总数量 代发货
		String orderyersterday="select count(*) from Goodsorders where orStatus=? and orTime>=? and orTime<=?";
		int orderyestersum=(int) hqlDAO.unique(useryesterday,1,Timestamp.valueOf(yesterday+"00:00:00"),Timestamp.valueOf(yesterday+"23:59:59"));
		int daioyestersum=(int) hqlDAO.unique(useryesterday,2,Timestamp.valueOf(yesterday+"00:00:00"),Timestamp.valueOf(yesterday+"23:59:59"));
		//本月下订单总数量 已付款的
		String ordermonth="select count(*) from Goodsorders where orStatus=? and orTime>=? and orTime<=?";
		int ordermonthsum=(int) hqlDAO.unique(ordermonth, 1,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		int daiomsum= (int) hqlDAO.unique(ordermonth, 2,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		
		//总的提现申请
		String  Txapply ="select count(*) from Withdrawrecord where wrStatus=?";
		int txapplysum = (int) hqlDAO.unique(Txapply, 2);   //总的提现申请数
		//今天的提现申请数量
		String  dayTxapply ="select count(*) from Withdrawrecord where wrStatus=? and wrTime>=? and wrTime<=?";
		int daytxapplysum=(int) hqlDAO.unique(dayTxapply, 2,Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		//昨天的提现申请数量
		String  yesterdayTxapply ="select count(*) from Withdrawrecord where wrStatus=? and wrTime>=? and wrTime<=?";
		int yesterdaytxapplysum=(int) hqlDAO.unique(yesterdayTxapply, 2,Timestamp.valueOf(yesterday+"00:00:00"),Timestamp.valueOf(yesterday+"23:59:59"));
		//本月的提现申请数量
		String  monthTxapply ="select count(*) from Withdrawrecord where wrStatus=? and wrTime>=? and wrTime<=?";
		int monthtxapplysum=(int) hqlDAO.unique(monthTxapply, 2,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		
		
		int msg=SmsUtil.getMessageCount();		//会员注册剩余短信通知总条数
		
		Map map=new HashMap();
		map.put("usersum", usersum);
		map.put("vipusersum", vipusersum);
		map.put("vipudsum", vipudsum);
		map.put("udsum", udsum);
		map.put("vipuseryestersum", vipuseryestersum);
		map.put("useryestersum",useryestersum);
		map.put("usermonthsum",usermonthsum);
		map.put("vipusermonthsum",vipusermonthsum);
		map.put("ordersum", ordersum);
		map.put("daiordersum", daiordersum);
		map.put("odsum", odsum);
		map.put("daiodsum", daiodsum);
		map.put("orderyestersum", orderyestersum);
		map.put("daioyestersum", daioyestersum);
		map.put("ordermonthsum", ordermonthsum);
		map.put("daiomsum", daiomsum);
		map.put("txapplysum", txapplysum);
		map.put("daytxapplysum", daytxapplysum);
		map.put("yesterdaytxapplysum",yesterdaytxapplysum);
		map.put("monthtxapplysum",monthtxapplysum);
		map.put("msg", msg);
		return map;
	}
}

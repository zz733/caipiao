package com.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.dao.Qianquzoushi3dDAO;
import com.dao.RechargerecordDAO;
import com.dao.UserinfoDAO;
import com.pojo.Qianquzoushi3d;
import com.util.MathUtil;
import com.util.StringUtil;

@Service
public class Qianquzoushi3dService {
	
	@Autowired
	private Qianquzoushi3dDAO qianquzoushi3dDAO;
	
	@Autowired
	private UserinfoDAO userinfoDAO;

	@Autowired
	private RechargerecordDAO rechargerecordDAO;

	@Autowired
	private HQLDAO hqldao;

	/**
	 * 更新3D
	 * 
	 * @param Qianquzoushi3d
	 * @return
	 */
	public int updateQianquzoushi(Qianquzoushi3d qianquzoushi3d) {
		short a  = qianquzoushi3d.getQiu1();
		short b  = qianquzoushi3d.getQiu2();
		short c  = qianquzoushi3d.getQiu3();
		short d  = qianquzoushi3d.getQiu4();
		short e  = qianquzoushi3d.getQiu5();
		
		int max = MathUtil.max(a%10,b%10,c%10,d%10,e%10);
		int min = MathUtil.min(a%10,b%10,c%10,d%10,e%10);
		qianquzoushi3d.setKudu((short)(max-min));//跨度
		
		short yu0 = MathUtil.chu3yu0_count(a,b,c,d,e);
		short yu1 = MathUtil.chu3yu1_count(a,b,c,d,e);
		short yu2 = MathUtil.chu3yu2_count(a,b,c,d,e);
		qianquzoushi3d.setChu3yu0(yu0);
		qianquzoushi3d.setChu3yu1(yu1);
		qianquzoushi3d.setChu3yu2(yu2); //除3余几的个数
		
		short jishu_count = MathUtil.jishu_count(a,b,c,d,e);
		qianquzoushi3d.setJishuNum(jishu_count);  //奇数个数
		
		short even_count = MathUtil.even_count(a,b,c,d,e);
		qianquzoushi3d.setOushuNum(even_count); //偶数个数
		
		short prime_count = MathUtil.prime_count(a,b,c,d,e);
		qianquzoushi3d.setZhishuNum(prime_count);//质数个数
		
		short heshu_count = MathUtil.heshu_count(a,b,c,d,e);
		qianquzoushi3d.setHeshuNum(heshu_count);//合数个数
		
		short dashu_count = MathUtil.dashu_count(a,b,c,d,e);
		qianquzoushi3d.setDashuNum(dashu_count);//大数个数
		
		short xiaoshu_count  = MathUtil.xiaoshu_count(a,b,c,d,e);
		qianquzoushi3d.setXiaoshuNum(xiaoshu_count);//小数个数
		
		short hewei = MathUtil.hewei(a,b,c,d,e);
		qianquzoushi3d.setHewei(hewei);
		
		//kaijiang3dDAO.save(kaijiang3d);
		qianquzoushi3dDAO.merge(qianquzoushi3d);
		return 1;
	}

	/*
	 * 根据id查询中奖纪录
	 */
	public Qianquzoushi3d getQianquzoushi3dById(int id) {
		return qianquzoushi3dDAO.findById(id);
	}

	/**
	 * 批量删除
	 */
	public void plShanChu(String kjId) {
		String hql = "delete from Qianquzoushi3d where id in (" + kjId + ")";
		hqldao.bulkUpdate(hql);
	}

	// 查询所有往期开奖
	public Map getAllQianquzoushi3d(String kjQishu, String mintime, String maxtime,
			int page, int size) {
		Map map = new HashMap();
		StringBuffer sb = new StringBuffer();
		List listparam = new ArrayList();
		sb.append(" where 1=1 ");

		if (kjQishu != null && kjQishu.trim().length() > 0) {
			sb.append("and qishu like ?");
			listparam.add("%" + kjQishu + "%");
		}
		if (StringUtil.isNotNull(mintime)) {
			sb.append("and time>=?");
			listparam.add(java.sql.Timestamp.valueOf(mintime + " 00:00:00"));
		}
		if (StringUtil.isNotNull(maxtime)) {
			sb.append(" and time<=?");
			listparam.add(java.sql.Timestamp.valueOf(maxtime) + " 23:59:59");
		}

		String sumHQL = "select count(*) from Qianquzoushi3d " + sb.toString();

		int sum = (int) hqldao.unique(sumHQL, listparam.toArray());

		if (sum < 1) {
			map.put("sum", 0);
			map.put("count", 0);
			map.put("page", 0);
			return map;
		}

		int count = sum % size == 0 ? sum / size : sum / size + 1;
		//
		// //越界检查
		if (page < 1)
			page = 1;
		if (page > count)
			page = count;

		String hql = "from Qianquzoushi3d " + sb.toString() + " order by id desc";
		List list = hqldao.pageQuery(hql, page, size, listparam.toArray());

		map.put("size", size);
		map.put("page", page);
		map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}

	// 查询最大期数
	public String getMaxQishu() {
		String hql = "select max(k.qishu) from Qianquzoushi3d k";
		List list = hqldao.query(hql);
		Object obj = list.get(0);
		if (obj==null)
			return "";
		return Long.parseLong(obj.toString())+1+"";
	}

	// 球号入库 每期开奖写入数据库
	public void addqiuhao(Qianquzoushi3d qianquzoushi3d) {
		short a  = qianquzoushi3d.getQiu1();
		short b  = qianquzoushi3d.getQiu2();
		short c  = qianquzoushi3d.getQiu3();
		short d  = qianquzoushi3d.getQiu4();
		short e  = qianquzoushi3d.getQiu5();
		
		int max = MathUtil.max(a%10,b%10,c%10,d%10,e%10);
		int min = MathUtil.min(a%10,b%10,c%10,d%10,e%10);
		qianquzoushi3d.setKudu((short)(max-min));//跨度
		
		short yu0 = MathUtil.chu3yu0_count(a,b,c,d,e);
		short yu1 = MathUtil.chu3yu1_count(a,b,c,d,e);
		short yu2 = MathUtil.chu3yu2_count(a,b,c,d,e);
		qianquzoushi3d.setChu3yu0(yu0);
		qianquzoushi3d.setChu3yu1(yu1);
		qianquzoushi3d.setChu3yu2(yu2); //除3余几的个数
		
		short jishu_count = MathUtil.jishu_count(a,b,c,d,e);
		qianquzoushi3d.setJishuNum(jishu_count);  //奇数个数
		
		short even_count = MathUtil.even_count(a,b,c,d,e);
		qianquzoushi3d.setOushuNum(even_count); //偶数个数
		
		short prime_count = MathUtil.prime_count(a,b,c,d,e);
		qianquzoushi3d.setZhishuNum(prime_count);//质数个数
		
		short heshu_count = MathUtil.heshu_count(a,b,c,d,e);
		qianquzoushi3d.setHeshuNum(heshu_count);//合数个数
		
		short dashu_count = MathUtil.dashu_count(a,b,c,d,e);
		qianquzoushi3d.setDashuNum(dashu_count);//大数个数
		
		short xiaoshu_count  = MathUtil.xiaoshu_count(a,b,c);
		qianquzoushi3d.setXiaoshuNum(xiaoshu_count);//小数个数
		
		short hewei = MathUtil.hewei(a,b,c,d,e);
		qianquzoushi3d.setHewei(hewei);
		
		qianquzoushi3d.setTime(java.sql.Timestamp.valueOf(qianquzoushi3d.getCommentdatemin()));
		
	    qianquzoushi3dDAO.save(qianquzoushi3d);
	}

	/**
	 * 期数是否存在
	 * @param qishu
	 * @return true存在
	 */
	public boolean checkQishu(String qishu) {
		String hql = "from Qianquzoushi3d where qishu=?";
		List list = hqldao.pageQuery(hql, 1, 1, qishu);
		if (list.size()>0)
			return true;
		return false;
	}

	public boolean del(int id) {
		Qianquzoushi3d kaijiang3d = qianquzoushi3dDAO.findById(id);
		if (kaijiang3d==null)
			return false;
		qianquzoushi3dDAO.delete(kaijiang3d);
		return true;
	}

}

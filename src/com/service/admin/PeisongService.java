package com.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jruby.compiler.ir.operands.Array;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.dao.PeisongcorpDAO;
import com.pojo.Peisongcorp;
import com.util.StringUtil;

@Service
public class PeisongService {
	
	@Autowired
	private HQLDAO hqldao;
	
	@Autowired
	private PeisongcorpDAO peisongcorpDAO;
	
	/*
	 * 修改状态
	 */
	public Peisongcorp updatestatus(int id) {
		Peisongcorp corp=peisongcorpDAO.findById(id);
		int status=corp.getPscStatus();
		if(corp!=null)
			corp.setPscStatus(1-status);
			peisongcorpDAO.save(corp);
		return corp;
		
	}

	/*
	 * 修改公司
	 */
	public void updateCorp(String cname,String ename,int status,String url,String detail,int pid)
	{
		String hql = "update Peisongcorp set pscChinesename=?,pscEnglishname=?,pscUrl=?,pscDetail=?,pscStatus=? where pscId=?";
		hqldao.bulkUpdate(hql, cname,ename,url,detail,status,pid);
	}
	
	
	/*
	 * 通过ID得到所有传到修改界面
	 */
	public Peisongcorp getAllById(int id)
	{
		Peisongcorp peisongcorp = peisongcorpDAO.findById(id);
		peisongcorpDAO.save(peisongcorp);
		return peisongcorp;
	}
	/*
	 * 添加配送公司
	 */
	public void addCompany(String cname,String ename,int status,String url,String detail)
	{
		Peisongcorp corp = new Peisongcorp();
		corp.setPscChinesename(cname);
		corp.setPscEnglishname(ename);
		corp.setPscStatus(status);
		corp.setPscUrl(url);
		corp.setPscDetail(detail);
		peisongcorpDAO.save(corp);
	}
	
	/*
	 * 分页、查询
	 */
	public Map fenye(String sosuo,int size,int page)
	{
		StringBuffer sb = new StringBuffer(" where 1=1 ");
		List paramList = new ArrayList();
		if(StringUtil.isNotNull(sosuo))
		{
			sb.append(" and pscChinesename like ? ");
			paramList.add("%"+sosuo+"%");
		}
		
		//总条数
		String hql = "select count(*) from Peisongcorp "+sb.toString();
		Object listSum = hqldao.query(hql, paramList.toArray()).get(0);
		int sum = Integer.parseInt(listSum.toString());
		if(sum<1) return new HashMap();
		
		//总页数
		int count = sum % size ==0 ? sum/size : sum/size+1;
		
		//越界检查
		if(page<1) page=1;
		if(page>count) page=count;
		
		//查询
		String hql2 = "from Peisongcorp "+sb.toString();
		List list = hqldao.pageQuery(hql2, page, size, paramList.toArray());
		
		Map map = new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("list", list);
		map.put("count", count);
		map.put("sum", sum);
		
		return map;
	}

}

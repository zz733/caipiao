package com.service.pc;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;
import com.dao.JihuomaDAO;
import com.pojo.Jihuoma;


@Service
public class YzmService {

	
	@Autowired
	private JihuomaDAO jihuomaDAO;
	
	@Autowired
	private HQLDAO hqldao;
	
	
	public List findBycode(String mobile,String code) {
		String hql="from Jihuoma where message=? and phone=?";
		List list=hqldao.findByHQL(hql, code,mobile);
		return list;
	}

	public void savecode(String code, String mobile) {
		/*System.out.println("保存了");*/
		Date date=new Date();
		Timestamp time=new Timestamp(date.getTime());
		
		Jihuoma jihuoma=new Jihuoma();
		jihuoma.setMessage(code);
		jihuoma.setPhone(mobile);
		jihuoma.setTime(time);
		jihuomaDAO.save(jihuoma);
		
	}
}

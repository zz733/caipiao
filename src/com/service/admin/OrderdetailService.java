package com.service.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.dao.GoodsorderdetailDAO;
import com.dao.HQLDAO;

/**
 * 
 * @author yzh
 *
 */

@Service
public class OrderdetailService {
	@Autowired
	private HQLDAO hqlDAO;
	
	@Autowired
	private GoodsorderdetailDAO orderdetailDAO;
	
	public static void main(String[] args) {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("app*.xml");
		OrderdetailService orderdetailService = applicationContext.getBean(OrderdetailService.class);
//		List list = orderdetailService.getOrderdetaiById("10");
//		System.out.println(list);
	}
	
	public Map getOrderdetaiById(String id){
		String sumhql = "select count(*) from Goodsorderdetail where orId= "+Integer.parseInt(id);
		int sum = (int) hqlDAO.unique(sumhql);
		String hql = "from Goodsorderdetail g join fetch g.goodsorders where g.goodsorders.orId= "+Integer.parseInt(id);
		List list = hqlDAO.query(hql);
		Map map = new HashMap();
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}
}

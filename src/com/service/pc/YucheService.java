package com.service.pc;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.action.JccsConfig;
import com.dao.HQLDAO;
import com.dao.YucheDAO;
import com.dao.YucheOrderDAO;
import com.pojo.CaipiaoType;
import com.pojo.Userinfo;
import com.pojo.Yuche;
import com.pojo.YucheOrder;


@Service
public class YucheService {
	
	@Autowired
	private YucheDAO  yucheDAO;
	
	@Autowired
	private YucheOrderDAO  yucheOrderDAO;
	
	@Autowired
	private HQLDAO  hqldao;
	
	/**
	 * 
	 * @param uid  用户编号
	 * @param yid  预测编号
	 * @return 获取用户的预测订单
	 */
	public YucheOrder getYucheOrder(int uid, int yid)
	{
		try {
			String hql = "from  YucheOrder where userinfo.usersId=? and yuche.id=? and zonjiang>-1";
			List<YucheOrder> list = hqldao.pageQuery(hql, 1, 1, uid,yid);
			if (list.size()>0)
				return list.get(0);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	/**
	 * 得所有可用预测,用于显示预测列表
	 * @return
	 */
	public List<YucheOrder> getAllYuche()
	{
		String hql = "from Yuche where kaijiangTime>?";
		List list = hqldao.findByHQL(hql,new Date());
		return list;
	}

	/**
	 * 创建订单
	 * @param radio1
	 */
	public YucheOrder createOrder(int payType, Userinfo userinfo, int  yid) {
		YucheOrder  order = new YucheOrder();
		Yuche yuche = yucheDAO.findById(yid);
		CaipiaoType caipiaoType = yuche.getCaipiaoType();
		order.setFangMoney(caipiaoType.getPrice_return());
		order.setMoney(caipiaoType.getPrice());
		order.setPayid(UUID.randomUUID().toString().replaceAll("-", ""));
		order.setPaytype(payType); //1支付宝  2微信
		order.setTime(new Timestamp(System.currentTimeMillis()));
		order.setUserinfo(userinfo);
		
		order.setYuche(yuche);
		order.setZonjiang((short)-1L);//未支付
		yucheOrderDAO.save(order);
		return order;
	}
	
	public boolean updateOrderStatus(String payId,float money)
	{
		System.out.println("payid:"+payId);
		System.out.println("money:"+money);
		String hql = "from YucheOrder where payid=?";
		List list = hqldao.pageQuery(hql, 1, 1, payId);
		System.out.println("list:"+list);
		if (list.size()==0)
			return false;
		YucheOrder yucheOrder = (YucheOrder) list.get(0);
		Float money2 = yucheOrder.getMoney();
		System.out.println(money2.floatValue());
		System.out.println(yucheOrder.getMoney());
		if (money2.floatValue()==money)
		{
			yucheOrder.setZonjiang((short)0);
			yucheOrderDAO.merge(yucheOrder);
			return true;
		}
		
		return false;
		
	}

	/**
	 * 根据预测订单编号查预测 
	 * @param id
	 * @return
	 */
	public YucheOrder getYucheOrder(String id) {
		String hql = "from YucheOrder where payid=?";
		List list = hqldao.pageQuery(hql, 1, 1, id);
		if (list.size()==0)
			return null;
		return (YucheOrder) list.get(0);
	}

	/**
	 * 根据彩票类型查看预测
	 * @param cid
	 * @return
	 */
	public Yuche getYucheByCaipiaoTypeId(int cid) {
		String hql = "from Yuche where caipiaoType.id=? order by kaijiangTime desc";
		List list = hqldao.pageQuery(hql, 1, 1, cid);
		if (list.size()>0)
			return (Yuche) list.get(0);
		return null;
	}

	public Yuche findById(int yid) {
		// TODO Auto-generated method stub
		return yucheDAO.findById(yid);
	}
	

}

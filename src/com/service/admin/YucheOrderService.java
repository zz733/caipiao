package com.service.admin;

/**
 * 预测订单管理
 */
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import weixin.popular.redbag.RedPacketApi;
import weixin.popular.redbag.RedbagApi;

import com.dao.HQLDAO;
import com.dao.YucheOrderDAO;
import com.pojo.Userinfo;
import com.pojo.YucheOrder;
import com.util.StringUtil;

@Service
public class YucheOrderService {

	@Autowired
	private YucheOrderDAO yucheOrderDAO;

	@Autowired
	private HQLDAO hqldao;

	/**
	 * 
	 * @param usersPhone
	 *            用户的手机号码
	 * @param beginTime
	 *            开始时间
	 * @param endTime
	 *            结束时间
	 * @param orderId
	 *            订单号
	 * @param payType
	 *            支付类型1支付宝 2微信
	 * @param zonjiang
	 *            0未处理 1中奖 2未中奖
	 * @return
	 */
	public Map fenye(String usersPhone, String beginTime, String endTime,
			String orderId, Integer payType, Integer zonjiang, Integer type,
			String qishu, int page, int size, Integer op) {
		List paramList = new ArrayList();
		Map map = new HashMap();
		StringBuffer sb = new StringBuffer(" where 1=1  ");
		if (StringUtil.isNotNull(usersPhone)) {
			sb.append(" and userinfo.usersPhone=? ");
			paramList.add(usersPhone);
		}

		if (StringUtil.isNotNull(beginTime)) {
			sb.append(" and time>=?");
			paramList.add(java.sql.Timestamp.valueOf(beginTime + " 00:00:00"));
		}

		if (StringUtil.isNotNull(endTime)) {
			sb.append(" and time<=?");
			paramList.add(java.sql.Timestamp.valueOf(endTime + " 23:59:59"));
		}

		if (StringUtil.isNotNull(orderId)) {
			sb.append(" and payid=?");
			paramList.add(orderId);
		}

		if (payType != null) {
			sb.append(" and paytype=?");
			paramList.add(payType);
		}

		if (zonjiang != null) {
			sb.append(" and zonjiang=?");
			paramList.add(zonjiang.shortValue());
		}

		if (type != null) {
			sb.append(" and yuche.caipiaoType.id=?");
			paramList.add(type);
		}

		if (StringUtil.isNotNull(qishu)) {
			sb.append(" and yuche.caipiaoQishu=?");
			paramList.add(qishu);
		}

		String hqlsum = "select count(*) from YucheOrder " + sb.toString();
		int sum = (int) hqldao.unique(hqlsum, paramList.toArray());
		int count = sum % size == 0 ? sum / size : sum / size + 1;
		if (page < 1)
			page = 1;
		if (page > count)
			page = count;

		String hql = "from YucheOrder " + sb.toString() + " order by time desc";

		// 批量返款
		if (op != null && op == 2) {
			final List<YucheOrder> listAll = hqldao.query(hql, paramList
					.toArray());
			new Thread() {
				public void run() {

					for (YucheOrder yucheOrder : listAll) {
						unzonjiang(yucheOrder.getId());
					}

				};
			}.start();

			return null;
		}

		List list = hqldao.pageQuery(hql, page, size, paramList.toArray());

		map.put("page", page);
		map.put("sum", sum);
		map.put("count", count);
		map.put("list", list);
		map.put("size", size);

		return map;
	}

	/**
	 * 预测订单:中奖
	 * 
	 * @param id
	 */
	public boolean zonjiang(long id) {

		YucheOrder yucheOrder = yucheOrderDAO.findById(id);
		if (yucheOrder != null) {
			Short old = yucheOrder.getZonjiang();
			if (old == null || old == 0) {
				yucheOrder.setZonjiang((short) 1);
				yucheOrderDAO.merge(yucheOrder);
				return true;
			}

		}
		return false;
	}

	/**
	 * 预测订单:未中奖
	 * 
	 * @param id
	 */
	public String unzonjiang(long id) {

		String hql = "from YucheOrder y join fetch  y.userinfo u where y.id=?";
		YucheOrder yucheOrder = (YucheOrder) hqldao.pageQueryNewSession(hql, 1,
				1, id).get(0);
		if (yucheOrder != null) {
			Short old = yucheOrder.getZonjiang();
			if (old == null || old == 0) {
				Userinfo userinfo = yucheOrder.getUserinfo();
				Integer wx = userinfo.getUsersBdwx();
				Integer zfb = userinfo.getUsersBdzfb();
				String openId = userinfo.getUsersWeixinOpenid();
				if (wx != null && wx == 1) {
					// 发微信
					RedPacketApi redbagApi = new RedPacketApi();
					if (openId == null)
						return "用户不存在";
					float money = yucheOrder.getFangMoney();
					int amount = (int) (money * 100);
					boolean f = redbagApi.sendRedPacket(openId, amount, "易乐智能");
					if (f) {
						yucheOrder.setFangTime(new Timestamp(System
								.currentTimeMillis()));
						yucheOrder.setFangType(2);
					} else {
						return "可能余额不足";
					}
				} else if (zfb != null && zfb == 1) {
					// 发支付宝
				} else {
					return "未绑定微信";
				}

				yucheOrder.setZonjiang((short) 2);
				yucheOrderDAO.merge(yucheOrder);
				return "true";
			}

		}
		return "false";
	}

}

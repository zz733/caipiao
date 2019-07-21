package com.service.admin;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CaipiaoTypeDAO;
import com.dao.HQLDAO;
import com.dao.YucheDAO;
import com.pojo.CaipiaoType;
import com.pojo.Yuche;
import com.util.StringUtil;

/*
 * 预测信息管理
 */
@Service
public class YucheBackService {

	@Autowired
	private YucheDAO yucheDAO;

	@Autowired
	private HQLDAO hqldao;

	@Autowired
	private CaipiaoTypeDAO caipiaoTypeDAO;

	/**
	 * 得所有可用的彩票类型
	 * 
	 * @return
	 */
	public List getAllCaipiaoType() {
		String hql = "from CaipiaoType  where status=1";
		List list = hqldao.findByHQL(hql);
		return list;
	}

	/**
	 * 新增预测
	 * 
	 * @param qishu
	 *            期数
	 * @param type
	 *            类型
	 * @param neiron
	 *            内容
	 * @param kaijiangTime
	 *            开奖时间
	 * @return
	 */
	public boolean addYuche(String qishu, int type, String neiron,
			String kaijiangTime) {
		String hql = "from Yuche where caipiaoQishu=? and caipiaoType.id=?";
		List list = hqldao.pageQuery(hql, 1, 1, qishu, type);
		if (list.size() > 0)
			return false;

		CaipiaoType caipiaoType = caipiaoTypeDAO.findById(type);
		Yuche yuche = new Yuche();
		yuche.setCaipiaoType(caipiaoType);
		yuche.setKaijiangTime(Timestamp.valueOf(kaijiangTime));
		yuche.setNeirong(neiron);
		yuche.setCaipiaoQishu(qishu);
		yuche.setPrice(caipiaoType.getPrice());
		yuche.setPrice_return(caipiaoType.getPrice_return());
		yucheDAO.save(yuche);
		return true;
	}

	/**
	 * 分页查询
	 * 
	 * @param qishu
	 * @param type
	 * @param page
	 * @param size
	 * @return
	 */
	public Map fenye(String qishu, Integer type, int page, int size) {
		StringBuffer sb = new StringBuffer(" where 1=1 ");
		List paramList = new ArrayList();
		if (StringUtil.isNotNull(qishu)) {
			sb.append(" and caipiaoQishu=?");
			paramList.add(qishu);
		}

		if (type != null) {
			sb.append(" and caipiaoType.id=?");
			paramList.add(type);
		}

		String hqlSum = "select count(*) from Yuche " + sb.toString();
		int sum = (int) hqldao.unique(hqlSum, paramList.toArray());

		int count = sum % size == 0 ? sum / size : sum / size + 1;

		if (page < 1)
			page = 1;

		if (page > count)
			page = count;

		String hql = "from Yuche " + sb.toString()+" order by kaijiangTime desc";

		List list = hqldao.pageQuery(hql, page, size, paramList.toArray());

		Map map = new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);
		map.put("list", list);

		return map;

	}

	
	public Yuche findById(Integer id) {
		return yucheDAO.findById(id);
	}

	/**
	 * 修改预测 
	 * @param id
	 * @param qihao
	 * @param type
	 * @param content
	 * @param kaijiangtime
	 * @return
	 */
	public boolean updateYuche(Integer id, String qihao, Integer type,
			String content, String kaijiangtime) {
		String hql = "from Yuche where caipiaoQishu=? and caipiaoType.id=?";
		List<Yuche> list = hqldao.pageQuery(hql, 1, 1, qihao, type);
		if (list.size() > 0)
		{
			for (Yuche y: list)
			{
				if (y.getId().equals(id)==false)
					return false;
			}
		}

		CaipiaoType caipiaoType = caipiaoTypeDAO.findById(type);
		Yuche yuche = yucheDAO.findById(id);
		yuche.setCaipiaoType(caipiaoType);
		yuche.setKaijiangTime(Timestamp.valueOf(kaijiangtime));
		yuche.setNeirong(content);
		yuche.setCaipiaoQishu(qihao);
		yucheDAO.merge(yuche);
		return true;
	}

}

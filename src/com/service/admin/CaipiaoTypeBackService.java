package com.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CaipiaoTypeDAO;
import com.dao.HQLDAO;
import com.pojo.CaipiaoType;
import com.util.StringUtil;

/**
 * 彩票类别管理
 * 
 * @author lgh
 * 
 */

@Service
public class CaipiaoTypeBackService {

	@Autowired
	private CaipiaoTypeDAO caipiaoTypeDAO;

	@Autowired
	private HQLDAO hqldao;

	/**
	 * 添加类别
	 */
	public boolean addCaiType(CaipiaoType caipiaoType) {
		if (caipiaoType == null || StringUtil.isNull(caipiaoType.getName()))
			return false;

		List list = caipiaoTypeDAO.findByName(caipiaoType.getName());
		if (list.size() > 0)
			return false;

		caipiaoTypeDAO.save(caipiaoType);

		return true;
	}

	/**
	 * 得所有彩票类型
	 * 
	 * @return
	 */
	public List findAll() {
		return caipiaoTypeDAO.findAll();
	}

	/**
	 * 修改状态
	 * 
	 * @param id
	 */
	public void updateStatus(int id) {
		CaipiaoType caipiaoType = caipiaoTypeDAO.findById(id);
		Short oldType = caipiaoType.getStatus();
		if (oldType == null)
			oldType = 0;
		caipiaoType.setStatus((short) (1 - oldType));
		caipiaoTypeDAO.merge(caipiaoType);

	}

	/**
	 * 修改彩票类型
	 * 
	 * @param caipiaoType
	 */
	public void updateCaipiaoType(CaipiaoType caipiaoType) {
		caipiaoTypeDAO.merge(caipiaoType);
	}

	/**
	 * 根据主键查
	 * 
	 * @param id
	 * @return
	 */
	public CaipiaoType findById(int id) {
		return caipiaoTypeDAO.findById(id);
	}

}

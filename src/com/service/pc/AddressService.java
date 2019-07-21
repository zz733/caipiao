package com.service.pc;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AddressDAO;
import com.dao.AreasDAO;
import com.dao.HQLDAO;
import com.dao.UserinfoDAO;
import com.pojo.Address;
import com.pojo.Areas;
import com.pojo.Userinfo;
import com.util.JsonFilter;

@Service
public class AddressService {

	@Autowired
	private UserinfoDAO userinfoDAO;

	@Autowired
	private AreasDAO areasDAO;

	@Autowired
	private AddressDAO addressDAO;

	@Autowired
	private HQLDAO hqldao;

	public void setMoren(int id) {
		Address address = addressDAO.findById(id);
		address.setAdStatus(1);
		String hql = "update Address set adStatus=0 where adId not in(" + id
				+ ")";
		hqldao.bulkUpdate(hql);
	}

	/**
	 * 查收货地址并分页
	 */
	public List getAll() {
		String hql = "from Address";
		// String hql2 = "select citys.cityId from Area";
		// String hql3 = "select cityName from City where cityId=("+hql2+")";
		List<Address> list = hqldao.query(hql);
		return list;
	}

	/**
	 * 添加收货地址
	 */
	public void addAddress(int id, int address, String xxaddress, String name,
			String phone, int status) {

		Address add = new Address();
		Userinfo userinfo = userinfoDAO.findById(id);
		Areas areas = areasDAO.findById(address);
		add.setUserinfo(userinfo);
		add.setAreas(areas);
		add.setAdDetail(xxaddress);
		add.setAdName(name);
		add.setAdphone(phone);
		add.setAdStatus(status);
		addressDAO.save(add);

	}

	public String getProvinces() {
		String hql = "from Provinces";
		List list = hqldao.query(hql);
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig);
		return JSONArray.fromObject(list, jsonConfig).toString();
	}

	public String getCity(int id) {

		String hql = "from Citys c where c.provinces.proId=?";
		List list = hqldao.query(hql, id);
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig);
		return JSONArray.fromObject(list, jsonConfig).toString();
	}

	public String getArea(int id) {

		String hql = "from Areas a where a.citys.cityId=?";
		List list = hqldao.query(hql, id);
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig);
		return JSONArray.fromObject(list, jsonConfig).toString();
	}

	/*
	 * 通过ID删除收货地址
	 */
	public void deleteById(int id) {
		Address address = addressDAO.findById(id);
		addressDAO.delete(address);

	}

	/**
	 * 通过ID得到地址
	 * 
	 * @param id
	 */
	public Address getAddressById(int id) {

		Address address = addressDAO.findById(id);
		return address;

	}

	/**
	 * 通过ID修改地址
	 * 
	 * @param id
	 * @param address
	 * @param xxaddress
	 * @param name
	 * @param phone
	 */
	public void updateAddressById(int id, int address, String xxaddress,
			String name, String phone) {
		Address address2 = addressDAO.findById(id);
		Areas areas = areasDAO.findById(address);
		address2.setAreas(areas);
		address2.setAdDetail(xxaddress);
		address2.setAdName(name);
		address2.setAdphone(phone);
		addressDAO.save(address2);

	}

	/**
	 * 得到所有省份
	 * 
	 * @return
	 */
	public List getAllProvice() {
		String hql = "from Provinces";
		List list = hqldao.query(hql);
		if (list.size() > 0)
			return list;
		return null;
	}

}

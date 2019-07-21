package com.pojo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Goodsorders entity. @author MyEclipse Persistence Tools
 */

public class Goodsorders implements java.io.Serializable {

	// Fields

	private Integer orId; // 订单ID
	private Userinfo userinfo; // 用户
	private Peisongcorp peisongcorp; // 配送公司
	private Address address; // 收货地址
	private Integer orStatus;// 订单状态
	private Timestamp orTime; // 下单时间
	private Double orFubei; // 实际总福贝
	private Double orYunfei; // 运费
	private String orRemark; // 订单备注
	private Integer orTotalnum; // 订单总数量
	private String orOrdernumber; // 订单号
	private String orRecipient; // 配送单号
	private Set goodsorderdetails = new HashSet(0);

	// Constructors

	/** default constructor */
	public Goodsorders() {
	}

	/** minimal constructor */
	public Goodsorders(Userinfo userinfo, Peisongcorp peisongcorp,
			Address address, Integer orStatus, Timestamp orTime,
			Double orFubei, Double orYunfei, Integer orTotalnum,
			String orOrdernumber) {
		this.userinfo = userinfo;
		this.peisongcorp = peisongcorp;
		this.address = address;
		this.orStatus = orStatus;
		this.orTime = orTime;
		this.orFubei = orFubei;
		this.orYunfei = orYunfei;
		this.orTotalnum = orTotalnum;
		this.orOrdernumber = orOrdernumber;
	}

	/** full constructor */
	public Goodsorders(Userinfo userinfo, Peisongcorp peisongcorp,
			Address address, Integer orStatus, Timestamp orTime,
			Double orFubei, Double orYunfei, String orRemark,
			Integer orTotalnum, String orOrdernumber, String orRecipient,
			Set goodsorderdetails) {
		this.userinfo = userinfo;
		this.peisongcorp = peisongcorp;
		this.address = address;
		this.orStatus = orStatus;
		this.orTime = orTime;
		this.orFubei = orFubei;
		this.orYunfei = orYunfei;
		this.orRemark = orRemark;
		this.orTotalnum = orTotalnum;
		this.orOrdernumber = orOrdernumber;
		this.orRecipient = orRecipient;
		this.goodsorderdetails = goodsorderdetails;
	}

	// Property accessors

	public Integer getOrId() {
		return this.orId;
	}

	public void setOrId(Integer orId) {
		this.orId = orId;
	}

	public Userinfo getUserinfo() {
		return this.userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public Peisongcorp getPeisongcorp() {
		return this.peisongcorp;
	}

	public void setPeisongcorp(Peisongcorp peisongcorp) {
		this.peisongcorp = peisongcorp;
	}

	public Address getAddress() {
		return this.address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Integer getOrStatus() {
		return this.orStatus;
	}

	public void setOrStatus(Integer orStatus) {
		this.orStatus = orStatus;
	}

	public Timestamp getOrTime() {
		return this.orTime;
	}

	public void setOrTime(Timestamp orTime) {
		this.orTime = orTime;
	}

	public Double getOrFubei() {
		return this.orFubei;
	}

	public void setOrFubei(Double orFubei) {
		this.orFubei = orFubei;
	}

	public Double getOrYunfei() {
		return this.orYunfei;
	}

	public void setOrYunfei(Double orYunfei) {
		this.orYunfei = orYunfei;
	}

	public String getOrRemark() {
		return this.orRemark;
	}

	public void setOrRemark(String orRemark) {
		this.orRemark = orRemark;
	}

	public Integer getOrTotalnum() {
		return this.orTotalnum;
	}

	public void setOrTotalnum(Integer orTotalnum) {
		this.orTotalnum = orTotalnum;
	}

	public String getOrOrdernumber() {
		return this.orOrdernumber;
	}

	public void setOrOrdernumber(String orOrdernumber) {
		this.orOrdernumber = orOrdernumber;
	}

	public String getOrRecipient() {
		return this.orRecipient;
	}

	public void setOrRecipient(String orRecipient) {
		this.orRecipient = orRecipient;
	}

	public Set getGoodsorderdetails() {
		return this.goodsorderdetails;
	}

	public void setGoodsorderdetails(Set goodsorderdetails) {
		this.goodsorderdetails = goodsorderdetails;
	}

}
package com.pojo;

import java.sql.Timestamp;

/**
 * YucheOrder entity. @author MyEclipse Persistence Tools
 */

public class YucheOrder implements java.io.Serializable {

	// Fields

	private Long id;
	private Userinfo userinfo; //用户
	private Timestamp time;  //支付时间
	private String payid;  //支付订单号
	private Float money;   //支付金额 
	private Integer paytype;   //支付类型 1支付宝  2微信
	private Short zonjiang;   //0未处理 1中奖  2没中奖  -1未支付
	private Float fangMoney;  //返现金
	private Integer fangType;  //返类型1支付宝  2微信 
	private Timestamp fangTime;
	
	private Yuche  yuche; //预测外键

	// Constructors

	public Yuche getYuche() {
		return yuche;
	}

	public void setYuche(Yuche yuche) {
		this.yuche = yuche;
	}

	/** default constructor */
	public YucheOrder() {
	}

	/** full constructor */
	public YucheOrder(Userinfo userinfo, Timestamp time, String payid,
			Float money, Integer paytype, Short zonjiang, Float fangMoney,
			Integer fangType, Timestamp fangTime) {
		this.userinfo = userinfo;
		this.time = time;
		this.payid = payid;
		this.money = money;
		this.paytype = paytype;
		this.zonjiang = zonjiang;
		this.fangMoney = fangMoney;
		this.fangType = fangType;
		this.fangTime = fangTime;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Userinfo getUserinfo() {
		return this.userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getPayid() {
		return this.payid;
	}

	public void setPayid(String payid) {
		this.payid = payid;
	}

	public Float getMoney() {
		return this.money;
	}

	public void setMoney(Float money) {
		this.money = money;
	}

	public Integer getPaytype() {
		return this.paytype;
	}

	public void setPaytype(Integer paytype) {
		this.paytype = paytype;
	}

	public Short getZonjiang() {
		return this.zonjiang;
	}

	public void setZonjiang(Short zonjiang) {
		this.zonjiang = zonjiang;
	}

	public Float getFangMoney() {
		return this.fangMoney;
	}

	public void setFangMoney(Float fangMoney) {
		this.fangMoney = fangMoney;
	}

	public Integer getFangType() {
		return this.fangType;
	}

	public void setFangType(Integer fangType) {
		this.fangType = fangType;
	}

	public Timestamp getFangTime() {
		return this.fangTime;
	}

	public void setFangTime(Timestamp fangTime) {
		this.fangTime = fangTime;
	}

}
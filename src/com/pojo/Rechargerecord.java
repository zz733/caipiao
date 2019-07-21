package com.pojo;

import java.sql.Timestamp;

/**
 * Rechargerecord entity. @author MyEclipse Persistence Tools
 */

public class Rechargerecord implements java.io.Serializable {

	// Fields

	private Integer rrId; // 充值记录ID
	private Userinfo userinfo; // 用户
	private Double rrMoney; // 充值金额
	private Integer rrType; // 充值类型
	private Timestamp rrTime; // 充值时间
	private String rrZfbdingdan; // 支付宝订单号
	private String rrWxdingdan; // 微信订单号
	private Integer rrStatus; // 充值状态
	private String rrDingdanhao; // 充值订单号
	private Double rrPresent; // 充值赠送福贝

	// Constructors

	/** default constructor */
	public Rechargerecord() {
	}

	/** minimal constructor */
	public Rechargerecord(Userinfo userinfo, Double rrMoney, Integer rrType,
			Timestamp rrTime, Integer rrStatus, String rrDingdanhao) {
		this.userinfo = userinfo;
		this.rrMoney = rrMoney;
		this.rrType = rrType;
		this.rrTime = rrTime;
		this.rrStatus = rrStatus;
		this.rrDingdanhao = rrDingdanhao;
	}

	/** full constructor */
	public Rechargerecord(Userinfo userinfo, Double rrMoney, Integer rrType,
			Timestamp rrTime, String rrZfbdingdan, String rrWxdingdan,
			Integer rrStatus, String rrDingdanhao, Double rrPresent) {
		this.userinfo = userinfo;
		this.rrMoney = rrMoney;
		this.rrType = rrType;
		this.rrTime = rrTime;
		this.rrZfbdingdan = rrZfbdingdan;
		this.rrWxdingdan = rrWxdingdan;
		this.rrStatus = rrStatus;
		this.rrDingdanhao = rrDingdanhao;
		this.rrPresent = rrPresent;
	}

	// Property accessors

	public Integer getRrId() {
		return this.rrId;
	}

	public void setRrId(Integer rrId) {
		this.rrId = rrId;
	}

	public Userinfo getUserinfo() {
		return this.userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public Double getRrMoney() {
		return this.rrMoney;
	}

	public void setRrMoney(Double rrMoney) {
		this.rrMoney = rrMoney;
	}

	public Integer getRrType() {
		return this.rrType;
	}

	public void setRrType(Integer rrType) {
		this.rrType = rrType;
	}

	public Timestamp getRrTime() {
		return this.rrTime;
	}

	public void setRrTime(Timestamp rrTime) {
		this.rrTime = rrTime;
	}

	public String getRrZfbdingdan() {
		return this.rrZfbdingdan;
	}

	public void setRrZfbdingdan(String rrZfbdingdan) {
		this.rrZfbdingdan = rrZfbdingdan;
	}

	public String getRrWxdingdan() {
		return this.rrWxdingdan;
	}

	public void setRrWxdingdan(String rrWxdingdan) {
		this.rrWxdingdan = rrWxdingdan;
	}

	public Integer getRrStatus() {
		return this.rrStatus;
	}

	public void setRrStatus(Integer rrStatus) {
		this.rrStatus = rrStatus;
	}

	public String getRrDingdanhao() {
		return this.rrDingdanhao;
	}

	public void setRrDingdanhao(String rrDingdanhao) {
		this.rrDingdanhao = rrDingdanhao;
	}

	public Double getRrPresent() {
		return rrPresent;
	}

	public void setRrPresent(Double rrPresent) {
		this.rrPresent = rrPresent;
	}

}
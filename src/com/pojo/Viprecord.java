package com.pojo;

import java.sql.Timestamp;

/**
 * Viprecord entity. @author MyEclipse Persistence Tools
 */

public class Viprecord implements java.io.Serializable {

	// Fields

	private Integer vipId; // 会员ID、
	private Userinfo userinfo; // 用户
	private Timestamp vipTime; // 会员开通时间
	private Integer vipDay; // 会员开通天数
	private Double vipFubei; // 冲会员送福贝
	private Double vipCost; 	// 会员充值金额
	private Integer vipCztype; // 充值方式
	private String vipZfbdingdan; // 支付宝订单号
	private String vipWxdingdan; // 微信订单号
	private Timestamp vipEndtime;// 会员结束时间
	private Integer vipStatus; // 会员充值状态

	// Constructors

	/** default constructor */
	public Viprecord() {
	}

	/** minimal constructor */
	public Viprecord(Userinfo userinfo, Integer vipDay, Double vipFubei,
			Double vipCost, Integer vipCztype) {
		this.userinfo = userinfo;
		this.vipDay = vipDay;
		this.vipFubei = vipFubei;
		this.vipCost = vipCost;
		this.vipCztype = vipCztype;
	}

	/** full constructor */
	public Viprecord(Userinfo userinfo, Timestamp vipTime, Integer vipDay,
			Double vipFubei, Double vipCost, Integer vipCztype,
			String vipZfbdingdan, String vipWxdingdan, Timestamp vipEndtime,
			Integer vipStatus) {
		this.userinfo = userinfo;
		this.vipTime = vipTime;
		this.vipDay = vipDay;
		this.vipFubei = vipFubei;
		this.vipCost = vipCost;
		this.vipCztype = vipCztype;
		this.vipZfbdingdan = vipZfbdingdan;
		this.vipWxdingdan = vipWxdingdan;
		this.vipEndtime = vipEndtime;
		this.vipStatus = vipStatus;
	}

	// Property accessors

	public Integer getVipId() {
		return this.vipId;
	}

	public void setVipId(Integer vipId) {
		this.vipId = vipId;
	}

	public Userinfo getUserinfo() {
		return this.userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public Timestamp getVipTime() {
		return this.vipTime;
	}

	public void setVipTime(Timestamp vipTime) {
		this.vipTime = vipTime;
	}

	public Integer getVipDay() {
		return this.vipDay;
	}

	public void setVipDay(Integer vipDay) {
		this.vipDay = vipDay;
	}

	public Double getVipFubei() {
		return this.vipFubei;
	}

	public void setVipFubei(Double vipFubei) {
		this.vipFubei = vipFubei;
	}

	public Double getVipCost() {
		return vipCost;
	}

	public void setVipCost(Double vipCost) {
		this.vipCost = vipCost;
	}

	public Integer getVipCztype() {
		return this.vipCztype;
	}

	public void setVipCztype(Integer vipCztype) {
		this.vipCztype = vipCztype;
	}

	public String getVipZfbdingdan() {
		return this.vipZfbdingdan;
	}

	public void setVipZfbdingdan(String vipZfbdingdan) {
		this.vipZfbdingdan = vipZfbdingdan;
	}

	public String getVipWxdingdan() {
		return this.vipWxdingdan;
	}

	public void setVipWxdingdan(String vipWxdingdan) {
		this.vipWxdingdan = vipWxdingdan;
	}

	public Timestamp getVipEndtime() {
		return vipEndtime;
	}

	public void setVipEndtime(Timestamp vipEndtime) {
		this.vipEndtime = vipEndtime;
	}

	public Integer getVipStatus() {
		return vipStatus;
	}

	public void setVipStatus(Integer vipStatus) {
		this.vipStatus = vipStatus;
	}

}
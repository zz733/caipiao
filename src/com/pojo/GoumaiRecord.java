package com.pojo;

import java.sql.Timestamp;

public class GoumaiRecord implements java.io.Serializable {

	// Fields

	private Integer gmId; // 购买记录ID
	private Goods goods;// 购买的商品ID
	private Userinfo userinfo; // 用户
	private Double gmMoney; // 购买金额
	private Integer gmType; // 购买类型
	private Timestamp gmTime; // 充值时间
	private String gmZfbdingdan; // 支付宝订单号
	private String gmWxdingdan; // 微信订单号
	private Integer gmStatus; // 购买状态
	private String gmDingdanhao; // 购买订单号

	public GoumaiRecord() {
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public GoumaiRecord(Integer gmId, Goods goods, Userinfo userinfo,
			Double gmMoney, Integer gmType, Timestamp gmTime,
			String gmZfbdingdan, String gmWxdingdan, Integer gmStatus,
			String gmDingdanhao) {
		super();
		this.gmId = gmId;
		this.goods = goods;
		this.userinfo = userinfo;
		this.gmMoney = gmMoney;
		this.gmType = gmType;
		this.gmTime = gmTime;
		this.gmZfbdingdan = gmZfbdingdan;
		this.gmWxdingdan = gmWxdingdan;
		this.gmStatus = gmStatus;
		this.gmDingdanhao = gmDingdanhao;
	}

	public Integer getGmId() {
		return gmId;
	}

	public void setGmId(Integer gmId) {
		this.gmId = gmId;
	}

	public Userinfo getUserinfo() {
		return userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public Double getGmMoney() {
		return gmMoney;
	}

	public void setGmMoney(Double gmMoney) {
		this.gmMoney = gmMoney;
	}

	public Integer getGmType() {
		return gmType;
	}

	public void setGmType(Integer gmType) {
		this.gmType = gmType;
	}

	public Timestamp getGmTime() {
		return gmTime;
	}

	public void setGmTime(Timestamp gmTime) {
		this.gmTime = gmTime;
	}

	public String getGmZfbdingdan() {
		return gmZfbdingdan;
	}

	public void setGmZfbdingdan(String gmZfbdingdan) {
		this.gmZfbdingdan = gmZfbdingdan;
	}

	public String getGmWxdingdan() {
		return gmWxdingdan;
	}

	public void setGmWxdingdan(String gmWxdingdan) {
		this.gmWxdingdan = gmWxdingdan;
	}

	public Integer getGmStatus() {
		return gmStatus;
	}

	public void setGmStatus(Integer gmStatus) {
		this.gmStatus = gmStatus;
	}

	public String getGmDingdanhao() {
		return gmDingdanhao;
	}

	public void setGmDingdanhao(String gmDingdanhao) {
		this.gmDingdanhao = gmDingdanhao;
	}

}
package com.pojo;

import java.sql.Timestamp;

/**
 * Withdrawrecord entity. @author MyEclipse Persistence Tools
 */

public class Withdrawrecord implements java.io.Serializable {

	// Fields

	private Integer wrId; //提现记录ID
	private Userinfo userinfo; //用户
	private Double wrMoney; //提现金额
	private Timestamp wrTime; //提现时间
	private String wrDingdanhao; //提现单号
	private Integer wrStatus; //提现状态
	private String wrZhifubao; //支付宝账号
	private String wrWeiXin; //微信账号
	private Integer wrTxtpye; //提现类型

	// Constructors

	/** default constructor */
	public Withdrawrecord() {
	}

	/** minimal constructor */
	public Withdrawrecord(Userinfo userinfo, Double wrMoney, Timestamp wrTime,
			String wrDingdanhao, Integer wrStatus, Integer wrTxtpye) {
		this.userinfo = userinfo;
		this.wrMoney = wrMoney;
		this.wrTime = wrTime;
		this.wrDingdanhao = wrDingdanhao;
		this.wrStatus = wrStatus;
		this.wrTxtpye = wrTxtpye;
	}

	/** full constructor */
	public Withdrawrecord(Userinfo userinfo, Double wrMoney, Timestamp wrTime,
			String wrDingdanhao, Integer wrStatus, String wrZhifubao,
			String wrWeiXin, Integer wrTxtpye) {
		this.userinfo = userinfo;
		this.wrMoney = wrMoney;
		this.wrTime = wrTime;
		this.wrDingdanhao = wrDingdanhao;
		this.wrStatus = wrStatus;
		this.wrZhifubao = wrZhifubao;
		this.wrWeiXin = wrWeiXin;
		this.wrTxtpye = wrTxtpye;
	}

	// Property accessors

	public Integer getWrId() {
		return this.wrId;
	}

	public void setWrId(Integer wrId) {
		this.wrId = wrId;
	}

	public Userinfo getUserinfo() {
		return this.userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public Double getWrMoney() {
		return this.wrMoney;
	}

	public void setWrMoney(Double wrMoney) {
		this.wrMoney = wrMoney;
	}

	public Timestamp getWrTime() {
		return this.wrTime;
	}

	public void setWrTime(Timestamp wrTime) {
		this.wrTime = wrTime;
	}

	public String getWrDingdanhao() {
		return this.wrDingdanhao;
	}

	public void setWrDingdanhao(String wrDingdanhao) {
		this.wrDingdanhao = wrDingdanhao;
	}

	public Integer getWrStatus() {
		return this.wrStatus;
	}

	public void setWrStatus(Integer wrStatus) {
		this.wrStatus = wrStatus;
	}

	public String getWrZhifubao() {
		return this.wrZhifubao;
	}

	public void setWrZhifubao(String wrZhifubao) {
		this.wrZhifubao = wrZhifubao;
	}

	public String getWrWeiXin() {
		return this.wrWeiXin;
	}

	public void setWrWeiXin(String wrWeiXin) {
		this.wrWeiXin = wrWeiXin;
	}

	public Integer getWrTxtpye() {
		return this.wrTxtpye;
	}

	public void setWrTxtpye(Integer wrTxtpye) {
		this.wrTxtpye = wrTxtpye;
	}

}
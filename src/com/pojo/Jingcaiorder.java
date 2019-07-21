package com.pojo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Jingcaiorder entity. @author MyEclipse Persistence Tools
 */

public class Jingcaiorder implements java.io.Serializable {

	// Fields

	private Integer jcId; // 竞猜订单ID
	private Userinfo userinfo; // 用户
	private String jcQishu; // 竞猜期数
	private Timestamp jcTime; // 竞猜时间
	private Double jcFubei; // 竞猜福贝
	private String jcNumber;// 竞猜订单编号
	private Set jingcaiorderdetails = new HashSet(0);

	// Constructors

	/** default constructor */
	public Jingcaiorder() {
	}

	/** minimal constructor */
	public Jingcaiorder(Userinfo userinfo, String jcQishu, Timestamp jcTime,
			Double jcFubei, String jcNumber) {
		this.userinfo = userinfo;
		this.jcQishu = jcQishu;
		this.jcTime = jcTime;
		this.jcFubei = jcFubei;
		this.jcNumber = jcNumber;
	}

	/** full constructor */
	public Jingcaiorder(Userinfo userinfo, String jcQishu, Timestamp jcTime,
			Double jcFubei, String jcNumber, Set jingcaiorderdetails) {
		this.userinfo = userinfo;
		this.jcQishu = jcQishu;
		this.jcTime = jcTime;
		this.jcFubei = jcFubei;
		this.jcNumber = jcNumber;
		this.jingcaiorderdetails = jingcaiorderdetails;
	}

	// Property accessors

	public Integer getJcId() {
		return this.jcId;
	}

	public void setJcId(Integer jcId) {
		this.jcId = jcId;
	}

	public Userinfo getUserinfo() {
		return this.userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public String getJcQishu() {
		return this.jcQishu;
	}

	public void setJcQishu(String jcQishu) {
		this.jcQishu = jcQishu;
	}

	public Timestamp getJcTime() {
		return this.jcTime;
	}

	public void setJcTime(Timestamp jcTime) {
		this.jcTime = jcTime;
	}

	public Double getJcFubei() {
		return this.jcFubei;
	}

	public void setJcFubei(Double jcFubei) {
		this.jcFubei = jcFubei;
	}

	public String getJcNumber() {
		return this.jcNumber;
	}

	public void setJcNumber(String jcNumber) {
		this.jcNumber = jcNumber;
	}

	public Set getJingcaiorderdetails() {
		return this.jingcaiorderdetails;
	}

	public void setJingcaiorderdetails(Set jingcaiorderdetails) {
		this.jingcaiorderdetails = jingcaiorderdetails;
	}

}
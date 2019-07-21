package com.pojo;

import java.sql.Timestamp;
public class Qianquzoushi implements java.io.Serializable {

	// Fields
	private Integer qqzsId; // 每期开奖Id
	private Timestamp qqzsTime; // 开奖时间
	private String qqzsQishu; // 开奖期数
	private Integer qqzsRedone; // 第一个红球
	private Integer qqzsRedtwo; // 第二个红球
	private Integer qqzsRedthree; // 第三个红球
	private Integer qqzsRedfour; // 第四个红球
	private Integer qqzsRedfive; // 第五个红球
	private Integer qqzsBlueone; // 第一个篮球
	private Integer qqzsBluetwo; // 第二个篮球
	
	private Integer qqzsBluehewei;//蓝球的和尾

	public Integer getQqzsBluehewei() {
		return qqzsBluehewei;
	}

	public void setQqzsBluehewei(Integer qqzsBluehewei) {
		this.qqzsBluehewei = qqzsBluehewei;
	}

	public Integer getQqzsId() {
		return qqzsId;
	}

	public void setQqzsId(Integer qqzsId) {
		this.qqzsId = qqzsId;
	}

	public Timestamp getQqzsTime() {
		return qqzsTime;
	}

	public void setQqzsTime(Timestamp qqzsTime) {
		this.qqzsTime = qqzsTime;
	}

	public String getQqzsQishu() {
		return qqzsQishu;
	}

	public void setQqzsQishu(String qqzsQishu) {
		this.qqzsQishu = qqzsQishu;
	}

	public Integer getQqzsRedone() {
		return qqzsRedone;
	}

	public void setQqzsRedone(Integer qqzsRedone) {
		this.qqzsRedone = qqzsRedone;
	}

	public Integer getQqzsRedtwo() {
		return qqzsRedtwo;
	}

	public void setQqzsRedtwo(Integer qqzsRedtwo) {
		this.qqzsRedtwo = qqzsRedtwo;
	}

	public Integer getQqzsRedthree() {
		return qqzsRedthree;
	}

	public void setQqzsRedthree(Integer qqzsRedthree) {
		this.qqzsRedthree = qqzsRedthree;
	}

	public Integer getQqzsRedfour() {
		return qqzsRedfour;
	}

	public void setQqzsRedfour(Integer qqzsRedfour) {
		this.qqzsRedfour = qqzsRedfour;
	}

	public Integer getQqzsRedfive() {
		return qqzsRedfive;
	}

	public void setQqzsRedfive(Integer qqzsRedfive) {
		this.qqzsRedfive = qqzsRedfive;
	}

	
	public Integer getQqzsBlueone() {
		return qqzsBlueone;
	}

	public void setQqzsBlueone(Integer qqzsBlueone) {
		this.qqzsBlueone = qqzsBlueone;
	}

	public Integer getQqzsBluetwo() {
		return qqzsBluetwo;
	}

	public void setQqzsBluetwo(Integer qqzsBluetwo) {
		this.qqzsBluetwo = qqzsBluetwo;
	}

	public Qianquzoushi(Integer qqzsId, Timestamp qqzsTime, String qqzsQishu,
			Integer qqzsRedone, Integer qqzsRedtwo, Integer qqzsRedthree,
			Integer qqzsRedfour, Integer qqzsRedfive, Integer qqzsBlueone,
			Integer qqzsBluetwo, Integer qqzsBluehewei) {
		super();
		this.qqzsId = qqzsId;
		this.qqzsTime = qqzsTime;
		this.qqzsQishu = qqzsQishu;
		this.qqzsRedone = qqzsRedone;
		this.qqzsRedtwo = qqzsRedtwo;
		this.qqzsRedthree = qqzsRedthree;
		this.qqzsRedfour = qqzsRedfour;
		this.qqzsRedfive = qqzsRedfive;
		this.qqzsBlueone = qqzsBlueone;
		this.qqzsBluetwo = qqzsBluetwo;
		this.qqzsBluehewei = qqzsBluehewei;
	}

	public Qianquzoushi() {
		super();
		// TODO Auto-generated constructor stub
	}

}
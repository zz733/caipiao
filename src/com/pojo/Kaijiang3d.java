package com.pojo;

import java.sql.Timestamp;

/**
 * Kaijiang3d entity. @author MyEclipse Persistence Tools
 */

public class Kaijiang3d implements java.io.Serializable {

	// Fields

	private Integer id;
	private String qishu; // 期数
	private String commentdatemin;//开奖时间：vo，不和数据库字段对应 
	public String getCommentdatemin() {
		return commentdatemin;
	}

	public void setCommentdatemin(String commentdatemin) {
		this.commentdatemin = commentdatemin;
	}

	private Timestamp time; // 开奖时间
	private Short qiu1; // 球1
	private Short qiu2; // 球2
	private Short qiu3; // 球3
	private Short kudu; // 跨度 max-min
	private Short hewei;// 和尾
	private Short chu3yu0;// 除3余0个数
	private Short chu3yu1; // 除3余1个数
	private Short chu3yu2; // 除3余2个数
	private Short dashuNum; // 大数个数 >=5
	private Short xiaoshuNum; // 小数个数<=4
	private Short zhishuNum; // 质数个数
	private Short heshuNum; // 合数个数
	private Short jishuNum; // 奇数个数
	private Short oushuNum; // 偶数个数

	// Constructors

	/** default constructor */
	public Kaijiang3d() {
	}

	/** full constructor */
	public Kaijiang3d(String qishu, Timestamp time, Short qiu1, Short qiu2,
			Short qiu3, Short kudu, Short hewei, Short chu3yu0, Short chu3yu1,
			Short chu3yu2, Short dashuNum, Short xiaoshuNum, Short zhishuNum,
			Short heshuNum, Short jishuNum, Short oushuNum) {
		this.qishu = qishu;
		this.time = time;
		this.qiu1 = qiu1;
		this.qiu2 = qiu2;
		this.qiu3 = qiu3;
		this.kudu = kudu;
		this.hewei = hewei;
		this.chu3yu0 = chu3yu0;
		this.chu3yu1 = chu3yu1;
		this.chu3yu2 = chu3yu2;
		this.dashuNum = dashuNum;
		this.xiaoshuNum = xiaoshuNum;
		this.zhishuNum = zhishuNum;
		this.heshuNum = heshuNum;
		this.jishuNum = jishuNum;
		this.oushuNum = oushuNum;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getQishu() {
		return this.qishu;
	}

	public void setQishu(String qishu) {
		this.qishu = qishu;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public Short getQiu1() {
		return this.qiu1;
	}

	public void setQiu1(Short qiu1) {
		this.qiu1 = qiu1;
	}

	public Short getQiu2() {
		return this.qiu2;
	}

	public void setQiu2(Short qiu2) {
		this.qiu2 = qiu2;
	}

	public Short getQiu3() {
		return this.qiu3;
	}

	public void setQiu3(Short qiu3) {
		this.qiu3 = qiu3;
	}

	public Short getKudu() {
		return this.kudu;
	}

	public void setKudu(Short kudu) {
		this.kudu = kudu;
	}

	public Short getHewei() {
		return this.hewei;
	}

	public void setHewei(Short hewei) {
		this.hewei = hewei;
	}

	public Short getChu3yu0() {
		return this.chu3yu0;
	}

	public void setChu3yu0(Short chu3yu0) {
		this.chu3yu0 = chu3yu0;
	}

	public Short getChu3yu1() {
		return this.chu3yu1;
	}

	public void setChu3yu1(Short chu3yu1) {
		this.chu3yu1 = chu3yu1;
	}

	public Short getChu3yu2() {
		return this.chu3yu2;
	}

	public void setChu3yu2(Short chu3yu2) {
		this.chu3yu2 = chu3yu2;
	}

	public Short getDashuNum() {
		return this.dashuNum;
	}

	public void setDashuNum(Short dashuNum) {
		this.dashuNum = dashuNum;
	}

	public Short getXiaoshuNum() {
		return this.xiaoshuNum;
	}

	public void setXiaoshuNum(Short xiaoshuNum) {
		this.xiaoshuNum = xiaoshuNum;
	}

	public Short getZhishuNum() {
		return this.zhishuNum;
	}

	public void setZhishuNum(Short zhishuNum) {
		this.zhishuNum = zhishuNum;
	}

	public Short getHeshuNum() {
		return this.heshuNum;
	}

	public void setHeshuNum(Short heshuNum) {
		this.heshuNum = heshuNum;
	}

	public Short getJishuNum() {
		return this.jishuNum;
	}

	public void setJishuNum(Short jishuNum) {
		this.jishuNum = jishuNum;
	}

	public Short getOushuNum() {
		return this.oushuNum;
	}

	public void setOushuNum(Short oushuNum) {
		this.oushuNum = oushuNum;
	}

}
package com.pojo;

/**
 * Jingcaiorderdetail entity. @author MyEclipse Persistence Tools
 */

public class Jingcaiorderdetail implements java.io.Serializable {

	// Fields

	private Integer jcodId; // 竞猜详细ID
	private Jingcaiorder jingcaiorder; // 竞猜订单
	private Integer jcodType; // 竞猜类型
	private String jcodValue; // 竞猜值
	private Integer jcodNum; // 竞猜数量
	private Double jcodCost; // 竞猜赔率
	private Integer jcodWinning; // 是否中奖

	// Constructors

	/** default constructor */
	public Jingcaiorderdetail() {
	}

	/** full constructor */
	public Jingcaiorderdetail(Jingcaiorder jingcaiorder, Integer jcodType,
			String jcodValue, Integer jcodNum, Double jcodCost,
			Integer jcodWinning) {
		this.jingcaiorder = jingcaiorder;
		this.jcodType = jcodType;
		this.jcodValue = jcodValue;
		this.jcodNum = jcodNum;
		this.jcodCost = jcodCost;
		this.jcodWinning = jcodWinning;
	}

	/** full constructor */
	public Jingcaiorderdetail(Jingcaiorder jingcaiorder, Integer jcodNum,
			Double jcodCost) {
		this.jingcaiorder = jingcaiorder;
		this.jcodNum = jcodNum;
		this.jcodCost = jcodCost;
	}

	// Property accessors

	public Integer getJcodId() {
		return this.jcodId;
	}

	public void setJcodId(Integer jcodId) {
		this.jcodId = jcodId;
	}

	public Jingcaiorder getJingcaiorder() {
		return this.jingcaiorder;
	}

	public void setJingcaiorder(Jingcaiorder jingcaiorder) {
		this.jingcaiorder = jingcaiorder;
	}

	public Integer getJcodType() {
		return this.jcodType;
	}

	public void setJcodType(Integer jcodType) {
		this.jcodType = jcodType;
	}

	public String getJcodValue() {
		return this.jcodValue;
	}

	public void setJcodValue(String jcodValue) {
		this.jcodValue = jcodValue;
	}

	public Integer getJcodNum() {
		return this.jcodNum;
	}

	public void setJcodNum(Integer jcodNum) {
		this.jcodNum = jcodNum;
	}

	public Double getJcodCost() {
		return this.jcodCost;
	}

	public void setJcodCost(Double jcodCost) {
		this.jcodCost = jcodCost;
	}

	public Integer getJcodWinning() {
		return this.jcodWinning;
	}

	public void setJcodWinning(Integer jcodWinning) {
		this.jcodWinning = jcodWinning;
	}

}
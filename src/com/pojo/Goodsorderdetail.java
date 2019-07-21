package com.pojo;

/**
 * Goodsorderdetail entity. @author MyEclipse Persistence Tools
 */

public class Goodsorderdetail implements java.io.Serializable {

	// Fields

	private Integer odId; // 订单详情ID
	private Goods goods; // 商品
	private Goodsorders goodsorders; // 订单
	private Integer odNum; // 商品数量
	private Double odCost; // 商品福贝

	// Constructors

	/** default constructor */
	public Goodsorderdetail() {
	}

	/** full constructor */
	public Goodsorderdetail(Goods goods, Goodsorders goodsorders,
			Integer odNum, Double odCost) {
		this.goods = goods;
		this.goodsorders = goodsorders;
		this.odNum = odNum;
		this.odCost = odCost;
	}

	// Property accessors

	public Integer getOdId() {
		return this.odId;
	}

	public void setOdId(Integer odId) {
		this.odId = odId;
	}

	public Goods getGoods() {
		return this.goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public Goodsorders getGoodsorders() {
		return this.goodsorders;
	}

	public void setGoodsorders(Goodsorders goodsorders) {
		this.goodsorders = goodsorders;
	}

	public Integer getOdNum() {
		return this.odNum;
	}

	public void setOdNum(Integer odNum) {
		this.odNum = odNum;
	}

	public Double getOdCost() {
		return this.odCost;
	}

	public void setOdCost(Double odCost) {
		this.odCost = odCost;
	}

}
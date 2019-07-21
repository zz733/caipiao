package com.pojo;

import java.sql.Timestamp;

/**
 * Yuche entity. @author MyEclipse Persistence Tools
 */

public class Yuche implements java.io.Serializable {

	// Fields

	private Integer id;
	private CaipiaoType caipiaoType; //类型
	private String caipiaoQishu;  //期数
	private Timestamp kaijiangTime;//开奖时间
	private String neirong; //内容
	
	private Float price; //预测价格
	private Float price_return; //预测不中返钱
	private String title;//标题

	// Constructors

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Float getPrice_return() {
		return price_return;
	}

	public void setPrice_return(Float priceReturn) {
		price_return = priceReturn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	/** default constructor */
	public Yuche() {
	}

	/** full constructor */
	public Yuche(CaipiaoType caipiaoType, String caipiaoQishu,
			Timestamp kaijiangTime, String neirong) {
		this.caipiaoType = caipiaoType;
		this.caipiaoQishu = caipiaoQishu;
		this.kaijiangTime = kaijiangTime;
		this.neirong = neirong;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public CaipiaoType getCaipiaoType() {
		return this.caipiaoType;
	}

	public void setCaipiaoType(CaipiaoType caipiaoType) {
		this.caipiaoType = caipiaoType;
	}

	public String getCaipiaoQishu() {
		return this.caipiaoQishu;
	}

	public void setCaipiaoQishu(String caipiaoQishu) {
		this.caipiaoQishu = caipiaoQishu;
	}

	public Timestamp getKaijiangTime() {
		return this.kaijiangTime;
	}

	public void setKaijiangTime(Timestamp kaijiangTime) {
		this.kaijiangTime = kaijiangTime;
	}

	public String getNeirong() {
		return this.neirong;
	}

	public void setNeirong(String neirong) {
		this.neirong = neirong;
	}

}
package com.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * CaipiaoType entity. @author MyEclipse Persistence Tools
 */

public class CaipiaoType implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Short status;
	private Float price; //预测价格
	private Float price_return; //预测不中返钱
	private String title;//标题
	
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

	private Set yuches = new HashSet(0);

	// Constructors

	/** default constructor */
	public CaipiaoType() {
	}

	/** full constructor */
	public CaipiaoType(String name, Short status, Set yuches) {
		this.name = name;
		this.status = status;
		this.yuches = yuches;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public Set getYuches() {
		return this.yuches;
	}

	public void setYuches(Set yuches) {
		this.yuches = yuches;
	}

}
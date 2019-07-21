package com.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * Areas entity. @author MyEclipse Persistence Tools
 */

public class Areas implements java.io.Serializable {

	// Fields

	private Integer areaId; //区县ID
	private Citys citys; // 市
	private String areaName; //区县名称
	private Set addresses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Areas() {
	}

	/** minimal constructor */
	public Areas(Citys citys, String areaName) {
		this.citys = citys;
		this.areaName = areaName;
	}

	/** full constructor */
	public Areas(Citys citys, String areaName, Set addresses) {
		this.citys = citys;
		this.areaName = areaName;
		this.addresses = addresses;
	}

	// Property accessors

	public Integer getAreaId() {
		return this.areaId;
	}

	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}

	public Citys getCitys() {
		return this.citys;
	}

	public void setCitys(Citys citys) {
		this.citys = citys;
	}

	public String getAreaName() {
		return this.areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public Set getAddresses() {
		return this.addresses;
	}

	public void setAddresses(Set addresses) {
		this.addresses = addresses;
	}

}
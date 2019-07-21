package com.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * Citys entity. @author MyEclipse Persistence Tools
 */

public class Citys implements java.io.Serializable {

	// Fields

	private Integer cityId; //市ID
	private Provinces provinces; //省
	private String cityName; //市名称
	private Set areases = new HashSet(0);

	// Constructors

	/** default constructor */
	public Citys() {
	}

	/** minimal constructor */
	public Citys(Provinces provinces, String cityName) {
		this.provinces = provinces;
		this.cityName = cityName;
	}

	/** full constructor */
	public Citys(Provinces provinces, String cityName, Set areases) {
		this.provinces = provinces;
		this.cityName = cityName;
		this.areases = areases;
	}

	// Property accessors

	public Integer getCityId() {
		return this.cityId;
	}

	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}

	public Provinces getProvinces() {
		return this.provinces;
	}

	public void setProvinces(Provinces provinces) {
		this.provinces = provinces;
	}

	public String getCityName() {
		return this.cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public Set getAreases() {
		return this.areases;
	}

	public void setAreases(Set areases) {
		this.areases = areases;
	}

}
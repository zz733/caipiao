package com.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * Provinces entity. @author MyEclipse Persistence Tools
 */

public class Provinces implements java.io.Serializable {

	// Fields

	private Integer proId; //省级Id
	private String proName; //省级名称
	private Set cityses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Provinces() {
	}

	/** minimal constructor */
	public Provinces(String proName) {
		this.proName = proName;
	}

	/** full constructor */
	public Provinces(String proName, Set cityses) {
		this.proName = proName;
		this.cityses = cityses;
	}

	// Property accessors

	public Integer getProId() {
		return this.proId;
	}

	public void setProId(Integer proId) {
		this.proId = proId;
	}

	public String getProName() {
		return this.proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public Set getCityses() {
		return this.cityses;
	}

	public void setCityses(Set cityses) {
		this.cityses = cityses;
	}

}
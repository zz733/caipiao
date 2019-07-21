package com.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * Address entity. @author MyEclipse Persistence Tools
 */

public class Address implements java.io.Serializable {

	// Fields

	private Integer adId; //收货地址ID
	private Userinfo userinfo; //用户
	private Areas areas; //区县ID
	private String adDetail; //详细地址
	private String adphone; //收货人电话
	private String adName; //收货人姓名
	private Integer adStatus; //地址知否默认 
	private Set goodsorderses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Address() {
	}

	/** minimal constructor */
	public Address(Userinfo userinfo, Areas areas, String adphone,
			Integer adStatus) {
		this.userinfo = userinfo;
		this.areas = areas;
		this.adphone = adphone;
		this.adStatus = adStatus;
	}

	/** full constructor */
	public Address(Userinfo userinfo, Areas areas, String adDetail,
			String adphone, String adName, Integer adStatus, Set goodsorderses) {
		this.userinfo = userinfo;
		this.areas = areas;
		this.adDetail = adDetail;
		this.adphone = adphone;
		this.adName = adName;
		this.adStatus = adStatus;
		this.goodsorderses = goodsorderses;
	}

	// Property accessors

	public Integer getAdId() {
		return this.adId;
	}

	public void setAdId(Integer adId) {
		this.adId = adId;
	}

	public Userinfo getUserinfo() {
		return this.userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public Areas getAreas() {
		return this.areas;
	}

	public void setAreas(Areas areas) {
		this.areas = areas;
	}

	public String getAdDetail() {
		return this.adDetail;
	}

	public void setAdDetail(String adDetail) {
		this.adDetail = adDetail;
	}

	public String getAdphone() {
		return this.adphone;
	}

	public void setAdphone(String adphone) {
		this.adphone = adphone;
	}

	public String getAdName() {
		return this.adName;
	}

	public void setAdName(String adName) {
		this.adName = adName;
	}

	public Integer getAdStatus() {
		return this.adStatus;
	}

	public void setAdStatus(Integer adStatus) {
		this.adStatus = adStatus;
	}

	public Set getGoodsorderses() {
		return this.goodsorderses;
	}

	public void setGoodsorderses(Set goodsorderses) {
		this.goodsorderses = goodsorderses;
	}

}
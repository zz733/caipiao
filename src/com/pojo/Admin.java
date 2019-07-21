package com.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * Admin entity. @author MyEclipse Persistence Tools
 */

public class Admin implements java.io.Serializable {

	// Fields

	private Integer adminId; //管理员ID
	private String adminName; //管理员名称
	private String adminUsername; //管理员账号
	private String adminPassword; //管理员密码
	private Integer adminPower; //管理员权限


	private Set goodsreturns = new HashSet(0);

	// Constructors

	/** default constructor */
	public Admin() {
	}

	/** minimal constructor */
	public Admin(String adminName, String adminUsername, String adminPassword,Integer adminPower) {
		this.adminName = adminName;
		this.adminUsername = adminUsername;
		this.adminPassword = adminPassword;
		this.adminPower = adminPower;
	}

	/** full constructor */
	public Admin(String adminName, String adminUsername, String adminPassword,Integer adminPower,
			Set goodsreturns) {
		this.adminName = adminName;
		this.adminUsername = adminUsername;
		this.adminPassword = adminPassword;
		this.adminPower = adminPower;
		this.goodsreturns = goodsreturns;
	}

	// Property accessors

	public Integer getAdminId() {
		return this.adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	public String getAdminName() {
		return this.adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminUsername() {
		return this.adminUsername;
	}

	public void setAdminUsername(String adminUsername) {
		this.adminUsername = adminUsername;
	}

	public String getAdminPassword() {
		return this.adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	
	public Integer getAdminPower() {
		return adminPower;
	}

	public void setAdminPower(Integer adminPower) {
		this.adminPower = adminPower;
	}

	public Set getGoodsreturns() {
		return this.goodsreturns;
	}

	public void setGoodsreturns(Set goodsreturns) {
		this.goodsreturns = goodsreturns;
	}

}
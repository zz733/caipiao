package com.pojo;

import java.sql.Timestamp;

/**
 * Goodsreturn entity. @author MyEclipse Persistence Tools
 */

public class Goodsreturn implements java.io.Serializable {

	// Fields

	private Integer grId; //退货ID
	private Admin admin; //管理员
	private Integer orId; //退货单号
	private Timestamp grTime; //退货时间
	private Integer grStatus; //退货状态
	private String grAuditor; //申请理由
	private String grAuditorreason; //审核理由
	private Timestamp grEndtime; //退货完成时间
	private String grRemark; //退货备注

	// Constructors

	/** default constructor */
	public Goodsreturn() {
	}

	/** minimal constructor */
	public Goodsreturn(Admin admin, Integer orId, Integer grStatus) {
		this.admin = admin;
		this.orId = orId;
		this.grStatus = grStatus;
	}

	/** full constructor */
	public Goodsreturn(Admin admin, Integer orId, Timestamp grTime,
			Integer grStatus, String grAuditor, String grAuditorreason,
			Timestamp grEndtime, String grRemark) {
		this.admin = admin;
		this.orId = orId;
		this.grTime = grTime;
		this.grStatus = grStatus;
		this.grAuditor = grAuditor;
		this.grAuditorreason = grAuditorreason;
		this.grEndtime = grEndtime;
		this.grRemark = grRemark;
	}

	// Property accessors

	public Integer getGrId() {
		return this.grId;
	}

	public void setGrId(Integer grId) {
		this.grId = grId;
	}

	public Admin getAdmin() {
		return this.admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public Integer getOrId() {
		return this.orId;
	}

	public void setOrId(Integer orId) {
		this.orId = orId;
	}

	public Timestamp getGrTime() {
		return this.grTime;
	}

	public void setGrTime(Timestamp grTime) {
		this.grTime = grTime;
	}

	public Integer getGrStatus() {
		return this.grStatus;
	}

	public void setGrStatus(Integer grStatus) {
		this.grStatus = grStatus;
	}

	public String getGrAuditor() {
		return this.grAuditor;
	}

	public void setGrAuditor(String grAuditor) {
		this.grAuditor = grAuditor;
	}

	public String getGrAuditorreason() {
		return this.grAuditorreason;
	}

	public void setGrAuditorreason(String grAuditorreason) {
		this.grAuditorreason = grAuditorreason;
	}

	public Timestamp getGrEndtime() {
		return this.grEndtime;
	}

	public void setGrEndtime(Timestamp grEndtime) {
		this.grEndtime = grEndtime;
	}

	public String getGrRemark() {
		return this.grRemark;
	}

	public void setGrRemark(String grRemark) {
		this.grRemark = grRemark;
	}

}
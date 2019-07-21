package com.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * Peisongcorp entity. @author MyEclipse Persistence Tools
 */

public class Peisongcorp implements java.io.Serializable {

	// Fields

	private Integer pscId; //配送公司ID
	private String pscChinesename; //配送公司中文名
	private String pscEnglishname;//公司英文名
	private String pscUrl;//公司网址
	private String pscDetail; //公司简介
	private Integer pscStatus; //状态
	private Set goodsorderses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Peisongcorp() {
	}

	/** minimal constructor */
	public Peisongcorp(String pscUrl, Integer pscStatus) {
		this.pscUrl = pscUrl;
		this.pscStatus = pscStatus;
	}

	/** full constructor */
	public Peisongcorp(String pscChinesename, String pscEnglishname,
			String pscUrl, String pscDetail, Integer pscStatus,
			Set goodsorderses) {
		this.pscChinesename = pscChinesename;
		this.pscEnglishname = pscEnglishname;
		this.pscUrl = pscUrl;
		this.pscDetail = pscDetail;
		this.pscStatus = pscStatus;
		this.goodsorderses = goodsorderses;
	}

	// Property accessors

	public Integer getPscId() {
		return this.pscId;
	}

	public void setPscId(Integer pscId) {
		this.pscId = pscId;
	}

	public String getPscChinesename() {
		return this.pscChinesename;
	}

	public void setPscChinesename(String pscChinesename) {
		this.pscChinesename = pscChinesename;
	}

	public String getPscEnglishname() {
		return this.pscEnglishname;
	}

	public void setPscEnglishname(String pscEnglishname) {
		this.pscEnglishname = pscEnglishname;
	}

	public String getPscUrl() {
		return this.pscUrl;
	}

	public void setPscUrl(String pscUrl) {
		this.pscUrl = pscUrl;
	}

	public String getPscDetail() {
		return this.pscDetail;
	}

	public void setPscDetail(String pscDetail) {
		this.pscDetail = pscDetail;
	}

	public Integer getPscStatus() {
		return this.pscStatus;
	}

	public void setPscStatus(Integer pscStatus) {
		this.pscStatus = pscStatus;
	}

	public Set getGoodsorderses() {
		return this.goodsorderses;
	}

	public void setGoodsorderses(Set goodsorderses) {
		this.goodsorderses = goodsorderses;
	}

}
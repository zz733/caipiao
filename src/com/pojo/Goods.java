package com.pojo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Goods entity. @author MyEclipse Persistence Tools
 */

public class Goods implements java.io.Serializable {

	// Fields

	private Integer gid;
	private String gname;
	private Double gprice;
	private String gimages;
	private String gdetail;
	private Integer gstatus;
	private String gimages2;
	private String gimages3;
	private String gimages4;
	private String gimages5;
	private Timestamp gbegin;
	private Timestamp gend;

	private String gtype;//商品的类型/视频video/其它other
	private String gvsrc;//如果gType商品的类型是video视频的话，则gvsrc则为视频的外链
	private String gduration;//如果gType商品的类型是video视频的话，则gduration则为其视频的时长

	// private Integer vipMonth;//购买商品赠送VIP时长
	private String gmiaoshu;// 商品描述

	private Integer kuchun = 0; // 库存
	private Integer leijixiaoshou = 0; // 累计销量
	public String getGtype() {
		return gtype;
	}

	public void setGtype(String gtype) {
		this.gtype = gtype;
	}

	public String getGvsrc() {
		return gvsrc;
	}

	public void setGvsrc(String gvsrc) {
		this.gvsrc = gvsrc;
	}

	public String getGduration() {
		return gduration;
	}

	public void setGduration(String gduration) {
		this.gduration = gduration;
	}
	public Integer getKuchun() {
		return kuchun;
	}

	public void setKuchun(Integer kuchun) {
		this.kuchun = kuchun;
	}

	public Integer getLeijixiaoshou() {
		return leijixiaoshou;
	}

	public void setLeijixiaoshou(Integer leijixiaoshou) {
		this.leijixiaoshou = leijixiaoshou;
	}

	private Set goodsorderdetails = new HashSet(0);

	// Constructors

	// public Integer getVipMonth() {
	// return vipMonth;
	// }
	//
	// public void setVipMonth(Integer vipMonth) {
	// this.vipMonth = vipMonth;
	// }

	/** default constructor */
	public Goods() {
	}

	/** minimal constructor */
	public Goods(String gname, Double gprice, String gimages, Integer gstatus) {
		this.gname = gname;
		this.gprice = gprice;
		this.gimages = gimages;
		this.gstatus = gstatus;
	}

	/** minimal constructor */
	public Goods(String gimages, String gimages2, String gimages3,
			String gimages4, String gimages5) {
		this.gimages = gimages;
		this.gimages2 = gimages2;
		this.gimages3 = gimages3;
		this.gimages4 = gimages4;
		this.gimages5 = gimages5;
	}

	public Goods(Integer gid, String gname, Double gprice, String gimages,
			String gdetail, Integer gstatus, String gimages2, String gimages3,
			String gimages4, String gimages5, Timestamp gbegin, Timestamp gend,
			String gmiaoshu, Integer kuchun, Integer leijixiaoshou,
			 Set goodsorderdetails) {
		super();
		this.gid = gid;
		this.gname = gname;
		this.gprice = gprice;
		this.gimages = gimages;
		this.gdetail = gdetail;
		this.gstatus = gstatus;
		this.gimages2 = gimages2;
		this.gimages3 = gimages3;
		this.gimages4 = gimages4;
		this.gimages5 = gimages5;
		this.gbegin = gbegin;
		this.gend = gend;
		this.gmiaoshu = gmiaoshu;
		this.kuchun = kuchun;
		this.leijixiaoshou = leijixiaoshou;
		this.goodsorderdetails = goodsorderdetails;
	}

	public Goods(Integer gid, String gname, Double gprice, String gimages,
			String gdetail, Integer gstatus, String gimages2, String gimages3,
			String gimages4, String gimages5, Timestamp gbegin, Timestamp gend,
			String gtype, String gvsrc, String gduration, String gmiaoshu,
			Integer kuchun, Integer leijixiaoshou, Set goodsorderdetails) {
		super();
		this.gid = gid;
		this.gname = gname;
		this.gprice = gprice;
		this.gimages = gimages;
		this.gdetail = gdetail;
		this.gstatus = gstatus;
		this.gimages2 = gimages2;
		this.gimages3 = gimages3;
		this.gimages4 = gimages4;
		this.gimages5 = gimages5;
		this.gbegin = gbegin;
		this.gend = gend;
		this.gtype = gtype;
		this.gvsrc = gvsrc;
		this.gduration = gduration;
		this.gmiaoshu = gmiaoshu;
		this.kuchun = kuchun;
		this.leijixiaoshou = leijixiaoshou;
		this.goodsorderdetails = goodsorderdetails;
	}
	// Property accessors

	public Integer getGid() {
		return this.gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public String getGname() {
		return this.gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public Double getGprice() {
		return this.gprice;
	}

	public void setGprice(Double gprice) {
		this.gprice = gprice;
	}

	public String getGimages() {
		return this.gimages;
	}

	public void setGimages(String gimages) {
		this.gimages = gimages;
	}

	public String getGdetail() {
		return this.gdetail;
	}

	public void setGdetail(String gdetail) {
		this.gdetail = gdetail;
	}

	public Integer getGstatus() {
		return this.gstatus;
	}

	public void setGstatus(Integer gstatus) {
		this.gstatus = gstatus;
	}

	public String getGimages2() {
		return this.gimages2;
	}

	public void setGimages2(String gimages2) {
		this.gimages2 = gimages2;
	}

	public String getGimages3() {
		return this.gimages3;
	}

	public void setGimages3(String gimages3) {
		this.gimages3 = gimages3;
	}

	public String getGimages4() {
		return this.gimages4;
	}

	public void setGimages4(String gimages4) {
		this.gimages4 = gimages4;
	}

	public String getGimages5() {
		return this.gimages5;
	}

	public void setGimages5(String gimages5) {
		this.gimages5 = gimages5;
	}

	public Timestamp getGbegin() {
		return this.gbegin;
	}

	public void setGbegin(Timestamp gbegin) {
		this.gbegin = gbegin;
	}

	public Timestamp getGend() {
		return this.gend;
	}

	public void setGend(Timestamp gend) {
		this.gend = gend;
	}

	public Set getGoodsorderdetails() {
		return this.goodsorderdetails;
	}

	public void setGoodsorderdetails(Set goodsorderdetails) {
		this.goodsorderdetails = goodsorderdetails;
	}

	public String getGmiaoshu() {
		return gmiaoshu;
	}

	public void setGmiaoshu(String gmiaoshu) {
		this.gmiaoshu = gmiaoshu;
	}

}
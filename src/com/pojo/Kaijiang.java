package com.pojo;

import java.sql.Timestamp;

/**
 * Kaijiang entity. @author MyEclipse Persistence Tools
 */

public class Kaijiang implements java.io.Serializable {

	// Fields

	private Integer kjId; // 每期开奖Id
	private Timestamp kjTime; // 开奖时间
	private String kjQishu; // 开奖期数
	private Integer kjRedone; // 第一个红球
	private Integer kjRedtwo; // 第二个红球
	private Integer kjRedthree; // 第三个红球
	private Integer kjRedfour; // 第四个红球
	private Integer kjRedfive; // 第五个红球
	private Integer kjRedsix; // 第六个红球
	private Integer kjBlue; // 蓝球

	// Constructors

	/** default constructor */
	public Kaijiang() {
	}

	/** full constructor */
	public Kaijiang(Timestamp kjTime, String kjQishu, Integer kjRedone,
			Integer kjRedtwo, Integer kjRedthree, Integer kjRedfour,
			Integer kjRedfive, Integer kjRedsix, Integer kjBlue) {
		this.kjTime = kjTime;
		this.kjQishu = kjQishu;
		this.kjRedone = kjRedone;
		this.kjRedtwo = kjRedtwo;
		this.kjRedthree = kjRedthree;
		this.kjRedfour = kjRedfour;
		this.kjRedfive = kjRedfive;
		this.kjRedsix = kjRedsix;
		this.kjBlue = kjBlue;
	}

	public Kaijiang(String kjQishu, Integer kjRedone, Integer kjRedtwo,
			Integer kjRedthree, Integer kjRedfour, Integer kjRedfive,
			Integer kjRedsix) {

		this.kjQishu = kjQishu;
		this.kjRedone = kjRedone;
		this.kjRedtwo = kjRedtwo;
		this.kjRedthree = kjRedthree;
		this.kjRedfour = kjRedfour;
		this.kjRedfive = kjRedfive;
		this.kjRedsix = kjRedsix;

	}

	// Property accessors

	public Integer getKjId() {
		return this.kjId;
	}

	public void setKjId(Integer kjId) {
		this.kjId = kjId;
	}

	public Timestamp getKjTime() {
		return this.kjTime;
	}

	public void setKjTime(Timestamp kjTime) {
		this.kjTime = kjTime;
	}

	public String getKjQishu() {
		return this.kjQishu;
	}

	public void setKjQishu(String kjQishu) {
		this.kjQishu = kjQishu;
	}

	public Integer getKjRedone() {
		return this.kjRedone;
	}

	public void setKjRedone(Integer kjRedone) {
		this.kjRedone = kjRedone;
	}

	public Integer getKjRedtwo() {
		return this.kjRedtwo;
	}

	public void setKjRedtwo(Integer kjRedtwo) {
		this.kjRedtwo = kjRedtwo;
	}

	public Integer getKjRedthree() {
		return this.kjRedthree;
	}

	public void setKjRedthree(Integer kjRedthree) {
		this.kjRedthree = kjRedthree;
	}

	public Integer getKjRedfour() {
		return this.kjRedfour;
	}

	public void setKjRedfour(Integer kjRedfour) {
		this.kjRedfour = kjRedfour;
	}

	public Integer getKjRedfive() {
		return this.kjRedfive;
	}

	public void setKjRedfive(Integer kjRedfive) {
		this.kjRedfive = kjRedfive;
	}

	public Integer getKjRedsix() {
		return this.kjRedsix;
	}

	public void setKjRedsix(Integer kjRedsix) {
		this.kjRedsix = kjRedsix;
	}

	public Integer getKjBlue() {
		return this.kjBlue;
	}

	public void setKjBlue(Integer kjBlue) {
		this.kjBlue = kjBlue;
	}

}
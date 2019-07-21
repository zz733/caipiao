package com.pojo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Userinfo entity. @author MyEclipse Persistence Tools
 */

public class Userinfo implements java.io.Serializable {

	// Fields

	private Integer usersId; // 用户ID
	private String usersName; // 用户名称
	private String usersPhone; // 用户账号（手机）
	private String usersPassword; // 用户密码
	private Integer usersType; // 用户类型
	private Double usersFubei; // 福贝余额
	private String usersZhifubao; // 支付宝
	private String usersZhifubaoName; // 支付宝真实姓名
	private String usersWeixin; // 微型
	private Integer usersBdwx; // 绑定微信
	private Integer usersBdzfb; // 绑定支付宝
	private Timestamp usersBegintime; // 会员开始时间
	private Timestamp usersEndtime; // 会员结束时间
	private Timestamp usersCreatetime;// 用户创建时间
	private String usersYihangka; // 银行卡号
	private String usersYhkname; // 银行卡开户人
	private String usersKaihuhang; // 开户人名称
	private String usersWeixinOpenid; // 微信openID
	private Integer usersWeixinStatus; // 微信关注状态

	private Set yucheOrders = new HashSet(0);
	public Set getYucheOrders() {
		return yucheOrders;
	}

	public void setYucheOrders(Set yucheOrders) {
		this.yucheOrders = yucheOrders;
	}

	private Set goodsorderses = new HashSet(0);
	private Set viprecords = new HashSet(0);
	private Set withdrawrecords = new HashSet(0);
	private Set jingcaiorders = new HashSet(0);
	private Set addresses = new HashSet(0);
	private Set rechargerecords = new HashSet(0);

	// Constructors

	/** default constructor */
	public Userinfo() {
	}

	/** minimal constructor */
	public Userinfo(String usersName, String usersPhone, String usersPassword,
			Integer usersType, Double usersFubei) {
		this.usersName = usersName;
		this.usersPhone = usersPhone;
		this.usersPassword = usersPassword;
		this.usersType = usersType;
		this.usersFubei = usersFubei;
	}

	/** full constructor */
	public Userinfo(String usersName, String usersPhone, String usersPassword,
			Integer usersType, Double usersFubei, String usersZhifubao,
			String usersZhifubaoName, String usersWeixin, Integer usersBdwx,
			Integer usersBdzfb, Timestamp usersBegintime,
			Timestamp usersEndtime, Timestamp usersCreatetime,
			String usersYihangka, String usersKaihuhang, String usersYhkname,
			String usersWeixinOpenid, Integer usersWeixinStatus,
			Set goodsorderses, Set viprecords, Set withdrawrecords,
			Set jingcaiorders, Set addresses, Set rechargerecords) {
		this.usersName = usersName;
		this.usersPhone = usersPhone;
		this.usersPassword = usersPassword;
		this.usersType = usersType;
		this.usersFubei = usersFubei;
		this.usersZhifubao = usersZhifubao;
		this.usersZhifubaoName = usersZhifubaoName;
		this.usersWeixin = usersWeixin;
		this.usersBdwx = usersBdwx;
		this.usersBdzfb = usersBdzfb;
		this.usersBegintime = usersBegintime;
		this.usersEndtime = usersEndtime;
		this.usersCreatetime = usersCreatetime;
		this.usersYihangka = usersYihangka;
		this.usersKaihuhang = usersKaihuhang;
		this.usersYhkname = usersYhkname;
		this.usersWeixinOpenid = usersWeixinOpenid;
		this.usersWeixinStatus = usersWeixinStatus;
		this.goodsorderses = goodsorderses;
		this.viprecords = viprecords;
		this.withdrawrecords = withdrawrecords;
		this.jingcaiorders = jingcaiorders;
		this.addresses = addresses;
		this.rechargerecords = rechargerecords;
	}

	// Property accessors

	public Integer getUsersId() {
		return this.usersId;
	}

	public void setUsersId(Integer usersId) {
		this.usersId = usersId;
	}

	public String getUsersName() {
		return this.usersName;
	}

	public void setUsersName(String usersName) {
		this.usersName = usersName;
	}

	public String getUsersPhone() {
		return this.usersPhone;
	}

	public void setUsersPhone(String usersPhone) {
		this.usersPhone = usersPhone;
	}

	public String getUsersPassword() {
		return this.usersPassword;
	}

	public void setUsersPassword(String usersPassword) {
		this.usersPassword = usersPassword;
	}

	public Integer getUsersType() {
		return this.usersType;
	}

	public void setUsersType(Integer usersType) {
		this.usersType = usersType;
	}

	public Double getUsersFubei() {
		return this.usersFubei;
	}

	public void setUsersFubei(Double usersFubei) {
		this.usersFubei = usersFubei;
	}

	public String getUsersZhifubao() {
		return this.usersZhifubao;
	}

	public void setUsersZhifubao(String usersZhifubao) {
		this.usersZhifubao = usersZhifubao;
	}

	public String getUsersZhifubaoName() {
		return this.usersZhifubaoName;
	}

	public void setUsersZhifubaoName(String usersZhifubaoName) {
		this.usersZhifubaoName = usersZhifubaoName;
	}

	public String getUsersWeixin() {
		return this.usersWeixin;
	}

	public void setUsersWeixin(String usersWeixin) {
		this.usersWeixin = usersWeixin;
	}

	public Integer getUsersBdwx() {
		return this.usersBdwx;
	}

	public void setUsersBdwx(Integer usersBdwx) {
		this.usersBdwx = usersBdwx;
	}

	public Integer getUsersBdzfb() {
		return this.usersBdzfb;
	}

	public void setUsersBdzfb(Integer usersBdzfb) {
		this.usersBdzfb = usersBdzfb;
	}

	public Timestamp getUsersBegintime() {
		return this.usersBegintime;
	}

	public void setUsersBegintime(Timestamp usersBegintime) {
		this.usersBegintime = usersBegintime;
	}

	public Timestamp getUsersEndtime() {
		return this.usersEndtime;
	}

	public void setUsersEndtime(Timestamp usersEndtime) {
		this.usersEndtime = usersEndtime;
	}

	public Timestamp getUsersCreatetime() {
		return this.usersCreatetime;
	}

	public void setUsersCreatetime(Timestamp usersCreatetime) {
		this.usersCreatetime = usersCreatetime;
	}

	public Set getGoodsorderses() {
		return this.goodsorderses;
	}

	public void setGoodsorderses(Set goodsorderses) {
		this.goodsorderses = goodsorderses;
	}

	public Set getViprecords() {
		return this.viprecords;
	}

	public void setViprecords(Set viprecords) {
		this.viprecords = viprecords;
	}

	public Set getWithdrawrecords() {
		return this.withdrawrecords;
	}

	public void setWithdrawrecords(Set withdrawrecords) {
		this.withdrawrecords = withdrawrecords;
	}

	public Set getJingcaiorders() {
		return this.jingcaiorders;
	}

	public void setJingcaiorders(Set jingcaiorders) {
		this.jingcaiorders = jingcaiorders;
	}

	public Set getAddresses() {
		return this.addresses;
	}

	public void setAddresses(Set addresses) {
		this.addresses = addresses;
	}

	public Set getRechargerecords() {
		return this.rechargerecords;
	}

	public void setRechargerecords(Set rechargerecords) {
		this.rechargerecords = rechargerecords;
	}

	public String getUsersYihangka() {
		return usersYihangka;
	}

	public void setUsersYihangka(String usersYihangka) {
		this.usersYihangka = usersYihangka;
	}

	public String getUsersYhkname() {
		return usersYhkname;
	}

	public void setUsersYhkname(String usersYhkname) {
		this.usersYhkname = usersYhkname;
	}

	public String getUsersKaihuhang() {
		return usersKaihuhang;
	}

	public void setUsersKaihuhang(String usersKaihuhang) {
		this.usersKaihuhang = usersKaihuhang;
	}

	public String getUsersWeixinOpenid() {
		return usersWeixinOpenid;
	}

	public void setUsersWeixinOpenid(String usersWeixinOpenid) {
		this.usersWeixinOpenid = usersWeixinOpenid;
	}

	public Integer getUsersWeixinStatus() {
		return usersWeixinStatus;
	}

	public void setUsersWeixinStatus(Integer usersWeixinStatus) {
		this.usersWeixinStatus = usersWeixinStatus;
	}

}
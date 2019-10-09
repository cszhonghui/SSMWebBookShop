package com.imu.jk.bean;

import java.util.Date;
import java.util.List;

public class Order {

	private Integer oid;
	private User user;
	private Receive receive;
	private double oamount;
	private Date oopdate;
	private String onumber;
	private String ostatus;
	private List<Orderdetail> odlist;
	
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Receive getReceive() {
		return receive;
	}
	public void setReceive(Receive receive) {
		this.receive = receive;
	}
	public double getOamount() {
		return oamount;
	}
	public void setOamount(double oamount) {
		this.oamount = oamount;
	}
	
	public Date getOopdate() {
		return oopdate;
	}
	public void setOopdate(Date oopdate) {
		this.oopdate = oopdate;
	}
	public String getOnumber() {
		return onumber;
	}
	public void setOnumber(String onumber) {
		this.onumber = onumber;
	}
	public String getOstatus() {
		return ostatus;
	}
	public void setOstatus(String ostatus) {
		this.ostatus = ostatus;
	}
	
	
	public List<Orderdetail> getOdlist() {
		return odlist;
	}
	public void setOdlist(List<Orderdetail> odlist) {
		this.odlist = odlist;
	}
	@Override
	public String toString() {
		return "Order [oamount=" + oamount + ", odlist=" + odlist + ", oid="
				+ oid + ", onumber=" + onumber + ", oopdate=" + oopdate
				+ ", ostatus=" + ostatus + ", receive=" + receive + ", user="
				+ user + "]";
	}
	
	
	
	
}

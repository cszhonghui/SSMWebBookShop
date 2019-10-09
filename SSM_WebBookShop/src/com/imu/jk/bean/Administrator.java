package com.imu.jk.bean;

public class Administrator {
	
	
	private Integer aid;
	private String ausername;
	private String apassword;
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public String getAusername() {
		return ausername;
	}
	public void setAusername(String ausername) {
		this.ausername = ausername;
	}
	public String getApassword() {
		return apassword;
	}
	public void setApassword(String apassword) {
		this.apassword = apassword;
	}
	@Override
	public String toString() {
		return "Administrator [aid=" + aid + ", apassword=" + apassword
				+ ", ausername=" + ausername + "]";
	}
	
	
}

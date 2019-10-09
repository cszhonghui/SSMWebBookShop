package com.imu.jk.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class User {
	
	private Integer uid;
	private String uusername;
	private String upassword;
	private String uemail;
	private String uphone;
	private Integer ugender;//1����  0��Ů
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ubirthdate;
	private String uavatar;//ͷ��·��
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUusername() {
		return uusername;
	}
	public void setUusername(String uusername) {
		this.uusername = uusername;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUphone() {
		return uphone;
	}
	public void setUphone(String uphone) {
		this.uphone = uphone;
	}
	public Integer getUgender() {
		return ugender;
	}
	public void setUgender(Integer ugender) {
		this.ugender = ugender;
	}
	public Date getUbirthdate() {
		return ubirthdate;
	}
	public void setUbirthdate(Date ubirthdate) {
		this.ubirthdate = ubirthdate;
	}
	public String getUavatar() {
		return uavatar;
	}
	public void setUavatar(String uavatar) {
		this.uavatar = uavatar;
	}
	@Override
	public String toString() {
		return "User [uavatar=" + uavatar + ", ubirthdate=" + ubirthdate
				+ ", uemail=" + uemail + ", ugender=" + ugender + ", uid="
				+ uid + ", upassword=" + upassword + ", uphone=" + uphone
				+ ", uusername=" + uusername + "]";
	}
	
	
	
}

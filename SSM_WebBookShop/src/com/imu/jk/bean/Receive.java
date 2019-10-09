package com.imu.jk.bean;

public class Receive {
	private Integer rid;
	private User user;
	private String rphone;
	private String rmailaddr;
	private String rtargetname;

	public Integer getRid() {
		return rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getRphone() {
		return rphone;
	}

	public void setRphone(String rphone) {
		this.rphone = rphone;
	}

	public String getRmailaddr() {
		return rmailaddr;
	}

	public void setRmailaddr(String rmailaddr) {
		this.rmailaddr = rmailaddr;
	}

	public String getRtargetname() {
		return rtargetname;
	}

	public void setRtargetname(String rtargetname) {
		this.rtargetname = rtargetname;
	}

	@Override
	public String toString() {
		return "Receive [rid=" + rid + ", rmailaddr=" + rmailaddr + ", rphone="
				+ rphone + ", rtargetname=" + rtargetname + ", user=" + user
				+ "]";
	}


	
}

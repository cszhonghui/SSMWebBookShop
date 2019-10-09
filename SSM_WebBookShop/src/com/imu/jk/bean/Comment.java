package com.imu.jk.bean;

import java.util.Date;

public class Comment {
	private User user;
	private Book book;
	
	public Integer cid;
	public Date cdate;
	public String ccontent;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	@Override
	public String toString() {
		return "Comment [book=" + book + ", ccontent=" + ccontent + ", cdate="
				+ cdate + ", cid=" + cid + ", user=" + user + "]";
	}



}
package com.imu.jk.bean;

public class Cart {

	private Integer cid;
	private User user;
	private Book book;
	private Integer cbnum;
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	
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
	public Integer getCbnum() {
		return cbnum;
	}
	public void setCbnum(Integer cbnum) {
		this.cbnum = cbnum;
	}
	@Override
	public String toString() {
		return "Cart [book=" + book + ", cbnum=" + cbnum + ", cid=" + cid
				+ ", user=" + user + "]";
	}
	
	
	
}

package com.imu.jk.bean;

import java.util.List;

public class BookType {
	private List<Book> books;
	private Integer btid;
	private String btname;
	
	
	
	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}
	public Integer getBtid() {
		return btid;
	}
	public void setBtid(Integer btid) {
		this.btid = btid;
	}
	public String getBtname() {
		return btname;
	}
	public void setBtname(String btname) {
		this.btname = btname;
	}
	@Override
	public String toString() {
		return "BookType [btid=" + btid + ", btname=" + btname + "]";
	}
	
	
}
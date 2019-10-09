package com.imu.jk.bean;

public class Orderdetail {
	private Integer odid;
	private String onumber;
	private Book book;
	private Integer bnum;
	private Integer odcomStatus;
	private Double odprice;

	public Integer getOdid() {
		return odid;
	}

	public void setOdid(Integer odid) {
		this.odid = odid;
	}

	public String getOnumber() {
		return onumber;
	}

	public void setOnumber(String onumber) {
		this.onumber = onumber;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Integer getBnum() {
		return bnum;
	}

	public void setBnum(Integer bnum) {
		this.bnum = bnum;
	}

	public Integer getOdcomStatus() {
		return odcomStatus;
	}

	public void setOdcomStatus(Integer odcomStatus) {
		this.odcomStatus = odcomStatus;
	}
	
	public Double getOdprice() {
		return odprice;
	}

	public void setOdprice(Double odprice) {
		this.odprice = odprice;
	}

	@Override
	public String toString() {
		return "Orderdetail [bnum=" + bnum + ", book=" + book
				+ ", odcomStatus=" + odcomStatus + ", odid=" + odid
				+ ", odprice=" + odprice + ", onumber=" + onumber + "]";
	}

	

	


	
}

package com.imu.jk.bean;

public class Book {
	
	
	private BookType bookType;
	private Integer bid;
	private String bisbn;
	private String bname;
	private String bauthor;
	private String bpublisher;
	private Double bprice;
	private String bpic;
	private Integer bstock;
	private String bcontent;
	
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	public String getBisbn() {
		return bisbn;
	}
	public void setBisbn(String bisbn) {
		this.bisbn = bisbn;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBauthor() {
		return bauthor;
	}
	public void setBauthor(String bauthor) {
		this.bauthor = bauthor;
	}
	public String getBpublisher() {
		return bpublisher;
	}
	public void setBpublisher(String bpublisher) {
		this.bpublisher = bpublisher;
	}
	public Double getBprice() {
		return (double) Math.round(bprice * 100) / 100;
	}
	public void setBprice(Double bprice) {
		this.bprice = bprice;
	}

	public BookType getBookType() {
		return bookType;
	}
	public void setBookType(BookType bookType) {
		this.bookType = bookType;
	}
	public String getBpic() {
		return bpic;
	}
	public void setBpic(String bpic) {
		this.bpic = bpic;
	}
	public Integer getBstock() {
		return bstock;
	}
	public void setBstock(Integer bstock) {
		this.bstock = bstock;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	@Override
	public String toString() {
		return "Book [bauthor=" + bauthor + ", bcontent=" + bcontent + ", bid="
				+ bid + ", bisbn=" + bisbn + ", bname=" + bname + ", bookType="
				+ bookType + ", bpic=" + bpic + ", bprice=" + bprice
				+ ", bpublisher=" + bpublisher + ", bstock=" + bstock + "]";
	}

	
}
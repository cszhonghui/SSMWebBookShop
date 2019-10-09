package com.imu.jk.service;

import java.util.List;

import com.imu.jk.bean.*;

public interface BookService {
	public List<Book> queryBook();
	public Book queryBookById(Integer bid);
	
	public Integer getTotalPages(Integer pageSize);
	public List<Book> pagination(Integer pageIndex,Integer pageSize);

	public boolean addBook(Book book);
	public boolean modify(Book book);
	public boolean remove(Integer bid);
	
	public Integer getTotalRowByBtid(Integer btid,Integer PageSize);
	public List<Book> queryBookByBtid(Integer typeId,Integer pageIndex,Integer pageSize);
	
	public boolean subStock(Integer bid,Integer num);
	
//	模糊查询
	public Integer getTotalPagesBySearch(String btname,Integer pageSize);	
	public List<Book> queryBookBySearch(String btname,Integer pageIndex,Integer pageSize);
}

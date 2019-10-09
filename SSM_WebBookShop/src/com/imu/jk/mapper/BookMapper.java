package com.imu.jk.mapper;

import java.util.List;
import com.imu.jk.bean.Book;

public interface BookMapper {

	public List<Book> queryBook();
	public void modify(Book book);
	public void remove(Integer bid);	
	public void add(Book book);	
	public Book queryBookById(Integer bid);	
	public Integer getTotalRow();
	public List<Book> pagination(Integer pageIndex,Integer pageSize);
	
	public Integer getTotalRowByBtid(Integer btid);
	public List<Book> queryBookByBtid(Integer typeId,Integer pageIndex,Integer pageSize);
	
	public void subStock(Integer bid,Integer num);
	
//	模糊查询
	public Integer getTotalRowBySearch(String btname);	
	public List<Book> queryBookBySearch(String btname,Integer pageIndex,Integer pageSize);

}

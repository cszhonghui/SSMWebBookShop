package com.imu.jk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imu.jk.bean.Book;

import com.imu.jk.mapper.BookMapper;
import com.imu.jk.service.BookService;
@Service
public class BookServiceImpl implements BookService {

	@Autowired
	BookMapper bookMapper;
	public List<Book> queryBook(){
		return bookMapper.queryBook();		
	}
	
	
	
	public boolean addBook(Book book) {
		try {
			bookMapper.add(book);	
		} catch (Exception e) {
			System.out.print(e.getMessage());
			return false;
		}		
		return true;
	}

	public Integer getTotalPages(Integer pageSize) {
		Integer row=0;
		try {
			row=bookMapper.getTotalRow();			
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}		
		return row%pageSize==0?row/pageSize:row/pageSize+1;
	}

	public boolean modify(Book book) {
		try {
			bookMapper.modify(book);			
		} catch (Exception e) {
			System.out.print(e.getMessage());
			return false;
		}		
		return true;
	}

	public List<Book> pagination(Integer pageIndex, Integer pageSize) {
		int rowIndex=0;
		System.out.println("pageIndex:"+pageIndex+"   pageSize:"+pageSize);
		rowIndex=(pageIndex-1)*pageSize;
		
		return bookMapper.pagination(rowIndex, pageSize);
	}

	public Book queryBookById(Integer bid) {
		return bookMapper.queryBookById(bid);
		
	}


	public boolean remove(Integer bid) {
		try {
			bookMapper.remove(bid);			
		} catch (Exception e) {
			System.out.print(e.getMessage());
			return false;
		}		
		return true;
	}



	public Integer getTotalRowByBtid(Integer btid,Integer pageSize) {
		Integer rowInteger=bookMapper.getTotalRowByBtid(btid);
		return rowInteger%pageSize==0?rowInteger/pageSize:rowInteger/pageSize+1;
	}



	public List<Book> queryBookByBtid(Integer typeId, Integer pageIndex,
			Integer pageSize) {
		Integer rowIndex=(pageIndex-1)*pageSize;
		return bookMapper.queryBookByBtid(typeId, rowIndex, pageSize);
	}



	public Integer getTotalPagesBySearch(String btname, Integer pageSize) {
		Integer rowInteger=bookMapper.getTotalRowBySearch(btname);
		return rowInteger%pageSize==0?rowInteger/pageSize:rowInteger/pageSize+1;
	}



	public List<Book> queryBookBySearch(String btname, Integer pageIndex,
			Integer pageSize) {
		Integer rowIndex=(pageIndex-1)*pageSize;
		return bookMapper.queryBookBySearch(btname, rowIndex, pageSize);
	}



	public boolean subStock(Integer bid, Integer num) {
		try {
			bookMapper.subStock(bid, num);		
		} catch (Exception e) {
			System.out.print(e.getMessage());
			return false;
		}		
		return true;
	}




	
	
	
	

	


}

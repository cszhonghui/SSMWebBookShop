package com.imu.jk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imu.jk.bean.BookType;
import com.imu.jk.mapper.BookTypeMapper;
import com.imu.jk.service.BookTypeService;
@Service
public class BookTypeServiceImpl implements BookTypeService {

	@Autowired
	BookTypeMapper bookTypeMapper;
	
	public boolean addType(BookType bookType) {
		try {
			bookTypeMapper.addType(bookType);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	public List<BookType> getNameByTypeId(Integer btid) {
		return bookTypeMapper.getNameByTypeId(btid);
	}

	public boolean modify(BookType bookType) {
		try {
			bookTypeMapper.modify(bookType);			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	public List<BookType> queryBookTypes() {
		return bookTypeMapper.queryBookTypes();
	}

	public boolean remove(Integer btid) {
		try {
			bookTypeMapper.remove(btid);			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;

	}

}

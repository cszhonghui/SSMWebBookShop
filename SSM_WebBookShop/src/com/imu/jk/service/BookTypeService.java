package com.imu.jk.service;

import java.util.List;

import com.imu.jk.bean.BookType;

public interface BookTypeService {
	public List<BookType> queryBookTypes();
	public boolean addType(BookType bookType);
	public boolean modify(BookType bookType);
	public boolean remove(Integer btid);
	public List<BookType> getNameByTypeId(Integer btid);
}

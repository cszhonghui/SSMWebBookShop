package com.imu.jk.mapper;

import java.util.List;


import com.imu.jk.bean.BookType;

public interface BookTypeMapper {
	public List<BookType> queryBookTypes();
	public void addType(BookType bookType);
	public void modify(BookType bookType);
	public void remove(Integer btid);
	public List<BookType> getNameByTypeId(Integer btid);
}

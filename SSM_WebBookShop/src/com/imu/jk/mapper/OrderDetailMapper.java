package com.imu.jk.mapper;

import java.util.List;

import com.imu.jk.bean.Orderdetail;

public interface OrderDetailMapper {
	public void addDetail(Orderdetail orderdetail);
	public List<Orderdetail> queryDetailsByOno(String ono);
	public void updateCom(String onumber,Integer bid);


}

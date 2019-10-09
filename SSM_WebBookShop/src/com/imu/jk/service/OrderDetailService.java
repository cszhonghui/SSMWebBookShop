package com.imu.jk.service;

import java.util.List;

import com.imu.jk.bean.Orderdetail;

public interface OrderDetailService {

	public boolean addDetail(Orderdetail orderdetail);
	public List<Orderdetail> queryDetailsByOno(String ono);
	public boolean updateCom(String onumber,Integer bid);
}

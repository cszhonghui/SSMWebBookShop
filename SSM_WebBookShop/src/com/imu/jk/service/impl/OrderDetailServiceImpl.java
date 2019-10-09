package com.imu.jk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imu.jk.bean.Orderdetail;
import com.imu.jk.mapper.OrderDetailMapper;
import com.imu.jk.service.OrderDetailService;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {

	@Autowired
	private OrderDetailMapper orderDetailMapper;
	
	public boolean addDetail(Orderdetail orderdetail) {
		boolean flag=false;
		try {
			orderDetailMapper.addDetail(orderdetail);
			flag=true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag;
	}

	public List<Orderdetail> queryDetailsByOno(String ono) {
		return orderDetailMapper.queryDetailsByOno(ono);
	}

	public boolean updateCom(String onumber, Integer bid) {
		boolean flag=false;
		try {
			orderDetailMapper.updateCom(onumber, bid);
			flag=true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag;
	}

}

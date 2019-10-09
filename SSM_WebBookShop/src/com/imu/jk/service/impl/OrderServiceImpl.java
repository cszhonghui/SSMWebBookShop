package com.imu.jk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imu.jk.bean.Order;
import com.imu.jk.mapper.OrderMapper;
import com.imu.jk.service.OrderService;
import com.imu.jk.util.UtilTool;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	public boolean genOrder(Order order) {
		boolean flag=false;
		try {
			orderMapper.genOrder(order);
			flag=true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag;
	}
	

	
	public boolean updateStatu(Integer oid,Integer statu) {
		boolean flag=false;
		try {
			orderMapper.updateStatu(oid,statu);
			flag=true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag;
	}
	
	public boolean checkOrder(Integer uid){
		if(orderMapper.checkOrder(uid)>=1)
			return true;
		return false;
	}
	
	public Order getOrder(String onumber){
		return orderMapper.getOrder(onumber);
	}
	
	public boolean setReceive(Integer oid,Integer rid){
		boolean flag=false;
		try {
			orderMapper.setReceive(oid, rid);
			flag=true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag;
	}
	
	public Integer getPagesByUid(Integer uid, Integer pageSize) {
		Integer rows=orderMapper.getTotalRowByUid(uid);
		return rows%pageSize==0?rows/pageSize:rows/pageSize+1;
	}
	
	public List<Order> queryOrdersByUidPage(Integer uid, Integer pageIndex,Integer pageSize) {
		Integer rows=(pageIndex-1)*pageSize;
		return orderMapper.queryOrdersByUidPage(uid, rows, pageSize);
	}


	/*管理员*/
	public boolean cancelOrder(Integer oid) {
		boolean flag=false;
		try {
			orderMapper.cancelOrder(oid);
			flag=true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag;
	}
	
	public boolean modifyOrder(Order order) {
		boolean flag=false;
		try {
			orderMapper.modifyOrder(order);
			flag=true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag;
	}
	
	public Integer getPagesOnSearch(String onumber,String odtargetname,Integer pageSize) {
		Integer rows=orderMapper.getTotalOnSearch(onumber, odtargetname);
		return rows%pageSize==0?rows/pageSize:rows/pageSize+1;
	}
	
	public List<Order> search(String onumber,String odtargetname,Integer pageIndex,Integer pageSize){
		Integer rows=(pageIndex-1)*pageSize;
		return orderMapper.search(onumber, odtargetname, rows, pageSize);
	}
	
	public Integer getPages(Integer pageSize) {
		Integer rows=orderMapper.getTotalRow();
		return rows%pageSize==0?rows/pageSize:rows/pageSize+1;
	}
	
	public List<Order> queryOrdersPage(Integer pageIndex,Integer pageSize) {
		Integer rows=(pageIndex-1)*pageSize;
		return orderMapper.queryOrdersPage(rows, pageSize);
	}

}

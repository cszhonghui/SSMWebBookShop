package com.imu.jk.service;

import java.util.List;

import com.imu.jk.bean.Order;

public interface OrderService {
	
	
	public boolean genOrder(Order order);
	public boolean cancelOrder(Integer oid);//��鶩��״̬
	public boolean updateStatu(Integer oid,Integer statu);
	public boolean checkOrder(Integer uid);
	public Order getOrder(String onumber);
	public boolean setReceive(Integer oid,Integer rid);
	public List<Order> queryOrdersByUidPage(Integer uid,Integer pageIndex,Integer pageSize);
	public Integer getPagesByUid(Integer uid,Integer pageSize);
	/*����Ա����*/
	public boolean modifyOrder(Order order);
	public Integer getPagesOnSearch(String onumber,String odtargetname,Integer pageSize);
	public List<Order> search(String onumber,String odtargetname,Integer pageIndex,Integer pageSize);
	public List<Order> queryOrdersPage(Integer pageIndex,Integer pageSize);
	public Integer getPages(Integer pageSize);
}

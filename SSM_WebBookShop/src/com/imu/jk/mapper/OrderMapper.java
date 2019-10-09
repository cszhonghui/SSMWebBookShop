package com.imu.jk.mapper;

import java.util.List;

import com.imu.jk.bean.Order;

public interface OrderMapper {
	public void genOrder(Order order);
	public void cancelOrder(Integer oid);//��鶩��״̬
	public void updateStatu(Integer oid,Integer statu);
	public int checkOrder(Integer uid);
	public Order getOrder(String onumber);
	public void setReceive(Integer oid,Integer rid);
	public List<Order> queryOrdersByUidPage(Integer uid,Integer pageIndex,Integer pageSize);
	public Integer getTotalRowByUid(Integer uid);
	
	/*管理员*/
	public void modifyOrder(Order order);
	public Integer getTotalOnSearch(String onumber,String odtargetname);
	public List<Order> search(String onumber,String odtargetname,Integer pageIndex,Integer pageSize);
	public List<Order> queryOrdersPage(Integer pageIndex,Integer pageSize);
	public Integer getTotalRow();
	
	
}

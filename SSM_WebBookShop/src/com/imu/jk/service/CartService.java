package com.imu.jk.service;

import java.util.List;

import com.imu.jk.bean.Cart;

public interface CartService {
	public boolean addItem(Cart cart);
	public boolean addNum(Integer uid,Integer bid,Integer num);
	public boolean modifyItem(Integer cid,Integer number);//������
	public boolean deleteItem(Integer cid);
	public boolean clear(Integer uid);//��uid�û��Ĺ��ﳵ���
	public List<Cart> getCartsByUid(Integer uid);
	public boolean check(Integer uid,Integer bid);
}

package com.imu.jk.mapper;

import java.util.List;

import com.imu.jk.bean.Cart;

public interface CartMapper {
	public void addItem(Cart cart);
	public void addNum(Integer uid,Integer bid,Integer num);
	public void modifyItem(Integer cid,Integer number);//������
	public void deleteItem(Integer cid);
	public void clear(Integer uid);//��uid�û��Ĺ��ﳵ���
	public List<Cart> getCartsByUid(Integer uid);
	public int check(Integer uid,Integer bid);//检查用户是否已经有该书
}

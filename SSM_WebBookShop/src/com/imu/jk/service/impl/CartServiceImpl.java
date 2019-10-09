package com.imu.jk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imu.jk.bean.Cart;
import com.imu.jk.mapper.CartMapper;
import com.imu.jk.service.CartService;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartMapper;
	
	public boolean addItem(Cart cart) {
		boolean flag=false;
		try {
			cartMapper.addItem(cart);
			flag=true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag;
	}

	public boolean addNum(Integer uid, Integer bid, Integer num) {
		boolean flag=false;
		try {
			cartMapper.addNum(uid, bid, num);
			flag=true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag;
	}
	
	public boolean modifyItem(Integer cid,Integer number) {
		boolean flag=false;
		try {
			cartMapper.modifyItem(cid,number);
			flag=true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag;
	}

	public boolean deleteItem(Integer cid) {
		boolean flag=false;
		try {
			cartMapper.deleteItem(cid);
			flag=true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag;
	}

	public boolean clear(Integer uid) {
		boolean flag=false;
		try {
			cartMapper.clear(uid);
			flag=true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag;
	}
	
	public List<Cart> getCartsByUid(Integer uid) {
		return cartMapper.getCartsByUid(uid);
	}

	public boolean check(Integer uid, Integer bid) {
		if(cartMapper.check(uid, bid)>=1)
			return true;
		return false;
	}

}

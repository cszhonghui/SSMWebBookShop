package com.imu.jk.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imu.jk.bean.Cart;
import com.imu.jk.bean.User;
import com.imu.jk.service.CartService;


@Controller
@RequestMapping("/Cart")
public class CartController {
	
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping("/addItem")
	@ResponseBody
	public String addItem(Cart cart,HttpSession session){
		String flag="fail";
		User user=(User)session.getAttribute("user");
		if(user==null)
			return "usernull";
		cart.setUser(user);
		//不存在记录
		if(!cartService.check(user.getUid(), cart.getBook().getBid())){
			if(cartService.addItem(cart))
				flag="success";
		}else{//存在记录
			if(cartService.addNum(user.getUid(), cart.getBook().getBid(), cart.getCbnum()))
				flag="success";
		}
		return flag;
	}
	
	@RequestMapping("/modifyItem")
	public String modifyItem(Integer cid,Integer number){
		if(cartService.modifyItem(cid,number))
			return "redirect:getCartsByUid";
		return "fail";
	}
	
	@ResponseBody
	@RequestMapping("/deleteItem")
	public String deleteItem(Integer cid){
		if(cartService.deleteItem(cid))
			return "success";
		return "fail";
	}
	
	@RequestMapping("/clear")
	public String clear(HttpSession session){
		cartService.clear(((User)session.getAttribute("user")).getUid());
		return "redirect:getCartsByUid";
	}
	
	@RequestMapping("/getCartsByUid")
	public String getCartsByUid(HttpSession session){
		User user=(User) session.getAttribute("user");
		List<Cart> carts=cartService.getCartsByUid(user.getUid());
		double carttotal=0;
		if(!carts.isEmpty()){
			for (Cart cart : carts) {
				carttotal+=cart.getCbnum()*cart.getBook().getBprice();
			}
		}else carts=null;
		session.setAttribute("carts", carts);
		session.setAttribute("carttotal", carttotal);
		return "front/cart";
	}
}

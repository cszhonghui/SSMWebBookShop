package com.imu.jk.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imu.jk.bean.Cart;
import com.imu.jk.bean.Order;
import com.imu.jk.bean.Orderdetail;
import com.imu.jk.bean.User;
import com.imu.jk.service.BookService;
import com.imu.jk.service.CartService;
import com.imu.jk.service.OrderDetailService;
import com.imu.jk.service.OrderService;
import com.imu.jk.util.UtilTool;

@Controller
@RequestMapping("/Order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private CartService cartService;
	@Autowired
	private BookService bookService;
	
	@RequestMapping("/genOrder")
	public String genOrder(HttpSession session,Order order){
		//购物车没东西  
		if(session.getAttribute("carts")==null)return "redirect:/index";
		//已经有一个未结算的订单
		//if(orderService.checkOrder(order.getUser().getUid()))
		//	return "Page/Error";
		List<Cart> carts=(List<Cart>) session.getAttribute("carts");
		String onumber=UtilTool.getOnumber();
		order.setOnumber(onumber);
		if(!orderService.genOrder(order))
			return "redirect:/index";
		for (Cart cart : carts) {
			Orderdetail orderdetail=new Orderdetail();
			orderdetail.setBook(cart.getBook());
			orderdetail.setOnumber(onumber);
			orderdetail.setBnum(cart.getCbnum());
			orderdetail.setOdprice(cart.getBook().getBprice());
			if(!orderDetailService.addDetail(orderdetail))
				return "redirect:/index";
		}
		session.removeAttribute("carts");
		cartService.clear(order.getUser().getUid());
		session.setAttribute("order", order);
		session.setAttribute("odlist", orderDetailService.queryDetailsByOno(onumber));
		return "redirect:settleOrder?onumber="+onumber;
		
	}
	
	@ResponseBody
	@RequestMapping("/buy")
	public String buy(HttpSession session,Model model,Order order,Orderdetail orderdetail){//传一个oamount成order 传bid，bnum,odprice成od
		User user=(User)session.getAttribute("user");
		if(user==null)
			return "usernull";
		String onumber=UtilTool.getOnumber();
		order.setOnumber(onumber);
		order.setUser(user);
		System.out.println(orderdetail);
		orderService.genOrder(order);
		orderdetail.setOnumber(onumber);
		orderDetailService.addDetail(orderdetail);
		return onumber;
	}
	
	@RequestMapping("/settleOrder")
	public String settleOrder(HttpSession session,Model model,String onumber){
		Order order=orderService.getOrder(onumber);
		List<Orderdetail> odlist=orderDetailService.queryDetailsByOno(onumber);
		session.setAttribute("order", order);
		session.setAttribute("odlist", odlist);
		return "redirect:/Receive/getByOrder";
	}
	
	@ResponseBody
	@RequestMapping("/confirmOrder")
	public String confirmOrder(Integer oid,Integer ostatus,Integer rid,String onumber){
		if(!orderService.setReceive(oid, rid))
			return "unexcepted error:mailadr";
		if(!orderService.updateStatu(oid,ostatus))
			return "unexcepted error:statu";
		List<Orderdetail> odlist=orderDetailService.queryDetailsByOno(onumber);
		for (Orderdetail orderdetail : odlist) {
			bookService.subStock(orderdetail.getBook().getBid(), orderdetail.getBnum());
		}
		
		return "success";
	}
	
	@RequestMapping("/queryByUidPage")
	public String queryOrdersByUid(HttpSession session,Model model,Integer pageIndex,Integer pageSize){
		User user=(User)session.getAttribute("user");
		pageIndex=pageIndex==null?1:pageIndex;
		pageSize=pageSize==null?5:pageSize;		
		model.addAttribute("pageIndex",pageIndex);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalPage", orderService.getPagesByUid(user.getUid(), pageSize));
		
		List<Order> orders=orderService.queryOrdersByUidPage(user.getUid(), pageIndex, pageSize);
		for (Order order : orders) {
			List<Orderdetail> ods=orderDetailService.queryDetailsByOno(order.getOnumber());
			order.setOdlist(ods);
			System.out.println(order);
		}
		model.addAttribute("orders", orders);
		return "front/userorder";
	}
	/*管理员*/
	@RequestMapping("/cancelOrder")
	public String cancelOrder(HttpSession session,Integer oid){
		if(session.getAttribute("admin")==null)return "redirect:/backlogin";
		orderService.cancelOrder(oid);
			return "redirect:queryPage";
	}
	
	@RequestMapping("/search")
	public String searchPage(Model model,String onumber,String oname,Integer pageIndex,Integer pageSize){
		pageIndex=pageIndex==null?1:pageIndex;
		pageSize=pageSize==null?1:pageSize;		
		model.addAttribute("pageIndex",pageIndex);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalPage", orderService.getPages(pageSize));
		
		List<Order> orders=orderService.search(onumber, oname, pageIndex, pageSize);
		for (Order order : orders) {
			List<Orderdetail> odlist=orderDetailService.queryDetailsByOno(order.getOnumber());
			order.setOdlist(odlist);
			System.out.println(order);
		}
		model.addAttribute("onumber",onumber);
		model.addAttribute("oname",oname);
		model.addAttribute("search",1);
		model.addAttribute("orders",orders);
		return "manage/order";
	}
	
	@RequestMapping("modifyPage")
	public String modifyPage(HttpSession session,Model model,String onumber){
		if(session.getAttribute("admin")==null)return "redirect:/backlogin";
		Order order=orderService.getOrder(onumber);
		model.addAttribute("order",order);
		return "manage/order-modify";
	}
	
	@RequestMapping("/modifyOrder")
	public String modifyOrder(HttpSession session,Integer oid,Integer ostatus){
		if(session.getAttribute("admin")==null)return "redirect:/backlogin";
		orderService.updateStatu(oid, ostatus);
		return "redirect:queryPage";
	}
	
	@RequestMapping("/queryPage")
	public String queryOrdersPage(HttpSession session,Model model,Integer pageIndex,Integer pageSize){
		if(session.getAttribute("admin")==null)return "redirect:/backlogin";
		pageIndex=pageIndex==null?1:pageIndex;
		pageSize=pageSize==null?8:pageSize;		
		model.addAttribute("pageIndex",pageIndex);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalPage", orderService.getPages(pageSize));
		
		List<Order> orders=orderService.queryOrdersPage(pageIndex, pageSize);
		for (Order order : orders) {
			List<Orderdetail> ods=orderDetailService.queryDetailsByOno(order.getOnumber());
			order.setOdlist(ods);
			System.out.println(order);
		}
		model.addAttribute("orders", orders);
		return "manage/order";
	}
}

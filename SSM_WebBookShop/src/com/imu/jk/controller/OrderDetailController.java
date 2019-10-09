package com.imu.jk.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imu.jk.bean.Order;
import com.imu.jk.bean.Orderdetail;
import com.imu.jk.service.OrderDetailService;


@Controller
@RequestMapping("/OrderDetail")
public class OrderDetailController {

	@Autowired
	private OrderDetailService orderDetailService;
	
	@RequestMapping("/addDetail")
	public String addDetail(Orderdetail orderdetail){
		if(orderDetailService.addDetail(orderdetail))
			return "success";
		return "fail";
	}
	
	@RequestMapping("/queryByOno")
	public String queryDetailsByOno(HttpSession session){
		List<Order> orders=(List<Order>) session.getAttribute("orders");
		for (Order order : orders) {
			List<Orderdetail> ods=orderDetailService.queryDetailsByOno(order.getOnumber());
			order.setOdlist(ods);
			System.out.println(order);
		}
		session.setAttribute("orders", orders);
		return "front/userorder";
	}
	
	@RequestMapping("/updateCom")
	public String updateCom(String onumber,Integer bid){
		if(orderDetailService.updateCom(onumber, bid))
			return "redirect:/Book/bookDetail?bid="+bid;
		return "/index";
	}
}

package com.imu.jk.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imu.jk.bean.Order;
import com.imu.jk.bean.Orderdetail;
import com.imu.jk.bean.Receive;
import com.imu.jk.bean.User;
import com.imu.jk.service.ReceiveService;


@Controller
@RequestMapping("/Receive")
public class ReceiveController {

	@Autowired
	private ReceiveService receiveService;
	
	@ResponseBody
	@RequestMapping("/addReceive")
	public String addReceive(Receive receive,Integer uid){
		receive.setUser(new User());
		receive.getUser().setUid(uid);
		if(receiveService.addReceive(receive))
			return "success";
		return "false";
	}
	
	@RequestMapping("/deleteReceive")
	public String deleteReceive(Integer rid,Integer uid){
		if(receiveService.deleteReceive(rid))
			return "redirect:queryByUid"+"?uid="+uid.toString();
		return "redirect:queryByUid"+"?uid="+uid.toString();
	}
	
	@RequestMapping("/modifyReceive")
	public String modifyReceive(Receive receive,Integer uid){
		
		if(receiveService.modifyReceive(receive))
			return "redirect:queryByUid"+"?uid="+uid.toString();
		return "redirect:queryByUid"+"?uid="+uid.toString();
	}
	
	@RequestMapping("/queryByUid")
	public String queryReceivesByUid(Integer uid,Model model,Integer pageIndex,Integer pageSize,HttpSession session){
		
		pageIndex=pageIndex==null?1:pageIndex;
		pageSize=pageSize==null?4:pageSize;		
		model.addAttribute("pageIndex",pageIndex);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("receives",receiveService.queryReceivesByUid(pageIndex, pageSize, uid));
		model.addAttribute("totalPage",receiveService.getTotalReceivePage(pageSize, uid));
		session.setAttribute("uid", uid);
		return "front/receiveaddr";
	}
	
	@RequestMapping("/getByOrder")
	public String getByOrder(HttpSession session,Model model){
		User user =(User)session.getAttribute("user");
		model.addAttribute("order",(Order)session.getAttribute("order"));
		model.addAttribute("odlist",(List<Orderdetail>)session.getAttribute("odlist"));
		session.removeAttribute("order");
		session.removeAttribute("odlist");
		model.addAttribute("receives",receiveService.queryReceivesByUid(1, 100, user.getUid()));
		return "front/order";
	}
	
}

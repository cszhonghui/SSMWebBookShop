package com.imu.jk.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imu.jk.bean.Administrator;

import com.imu.jk.service.AdministratorService;


@Controller
@RequestMapping("/Administrator")
public class AdministratorController {
	@Autowired
	private AdministratorService as;
	
	//@ResponseBody
	@RequestMapping("/login")
	public String login(Administrator admin,HttpSession session) throws InterruptedException {
		/*if (admin.getAusername() == null || admin.getAusername().equals("")) {
			return "nameEmpty";
		}
		if (admin.getApassword() == null || admin.getApassword().equals("")) {
			return "false";
		}*/
		String password=admin.getApassword();
		String truepwd=as.login(admin);
		if (as.login(admin).equals(password)){	
			session.setAttribute("admin", admin);
			return "manage/index";
		}
		return "manage/login";
	}
	@ResponseBody
	@RequestMapping("/register")
	public String register(Administrator admin) {
		if (as.register(admin)) 
			{
			return "success";}
		return "false";
	}
	
	

	@RequestMapping("/resetPwd")
	public String resetPassword(HttpSession session,Administrator admin) {
		if(session.getAttribute("admin")==null)return "redirect:/backlogin";
		if(as.resetPwd(admin))
			return "login";
		return "fail";
	}

	@RequestMapping("/paging")
	public String usersPage(Integer pageIndex, Integer pageSize,HttpSession session) {
		if(session.getAttribute("admin")==null)return "redirect:/backlogin";
		session.setAttribute("users", as.pageation(pageIndex,pageSize));
		return "";
	}

	@RequestMapping("/deleteUser")
	public String deleteUser(HttpSession session,Administrator admin) {
		if(session.getAttribute("admin")==null)return "redirect:/backlogin";
		as.deleteAdmin(admin);
		return "success";
	}

}

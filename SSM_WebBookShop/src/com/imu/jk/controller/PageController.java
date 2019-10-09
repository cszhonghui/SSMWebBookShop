package com.imu.jk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class PageController {

	//index
	@RequestMapping("/index")
	public String index(){
		return "forward:Book/index";
	}
	
	//User相关页跳转
	@RequestMapping("/modifyUser")
	public String modifyUserPage(){
		return "front/modifyuser";
	}
	
	@RequestMapping("/resetPwd")
	public String updatePwdPage(){
		return "front/resetpwd";
	}
	
	@RequestMapping("/reg")
	public String Regjsp(){
		return "front/register";
	}
	
	@RequestMapping("/login")
	public String Loginjsp(){
		return "front/login";
	}
	@RequestMapping("/manager")
	public String mana(){
		return "manage/index";
	}
	
	@RequestMapping("/backlogin")
	public String backlogin(){
		return "manage/login";
	}
	/*
	@RequestMapping("/index")
	public String Indexjsp(){
		return "front/index";
	}
	@RequestMapping("/cart")
	public String cartPage(){
		return "front/cart";
	}
	@RequestMapping("/booklist")
	public String productListPage(){
		return "front/booklist";
	}
	@RequestMapping("/order")
	public String oderPage(){
		return "front/order";
	}
	@RequestMapping("/shoppingResult")
	public String shoppingResult(){
		return "front/shoppingResult";
	}
	
	}
	@RequestMapping("/addUser")
	public String addUserPage(){
		return "manage/adduser";
	}
	
	
	//temp
	@RequestMapping("/comment")
	public String commentPage(){
		return "front/comment";
	}
	@RequestMapping("/bookDetail")
	public String bookDetailPage(){
		return "front/bookdetail";
	}
	
	
	@RequestMapping("/userOrder")
	public String userOrderPage(){
		return "front/userorder";
	}
	@RequestMapping("/balance")
	public String balanceOrder(){
		return "front/balance";
	}*/
}

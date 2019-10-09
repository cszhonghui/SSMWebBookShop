package com.imu.jk.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imu.jk.bean.User;
import com.imu.jk.service.UserService;

@Controller
@RequestMapping("/User")
public class UserController {
	@Autowired
	private UserService us;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));
	}

	@ResponseBody
	@RequestMapping("/login")
	public String login(User user, HttpSession session) {

		if (user.getUusername() == null || user.getUusername().equals("")) {

			return "nameEmpty";
		}
		if (user.getUpassword() == null || user.getUpassword().equals("")) {

			return "pwdEmpty";
		}

		if (us.login(user).equals(user.getUpassword())) {
			User nuser = new User();
			nuser = us.queryUserByName(user.getUusername());
			nuser.setUpassword("");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String birth = "";
			birth = sdf.format(nuser.getUbirthdate());
			try {
				nuser.setUbirthdate(sdf.parse(birth));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.setAttribute("birthday", birth);
			session.setAttribute("user", nuser);
			return "success";
		}

		return "false";
	}

	@ResponseBody
	@RequestMapping("/register")
	public String register(User user) {

		if (us.register(user))
			return "success";
		return "false";
	}

	@ResponseBody
	@RequestMapping("/modifyinfo")
	public String modifyInfo(User user, HttpSession session) {
		user.setUid(us.queryUserByName(user.getUusername()).getUid());
		if (us.modifyInfo(user)) {

			session.setAttribute("user", user);
			return "success";
		}
		return "false";
	}

	@ResponseBody
	@RequestMapping("/resetPwd")
	public String resetPassword(User user, String unewpassword,
			HttpSession session) {
		if (user.getUpassword() == null || user.getUpassword().equals(""))
			return "pwdEmpty";
		if (unewpassword == null || unewpassword.equals(""))
			return "newEmpty";
		System.out.println(user.toString());
		if (us.login(user).equals(user.getUpassword())) {

			user.setUpassword(unewpassword);
			if (us.resetPwd(user)) {
				session.invalidate();
				return "success";
			}
			return "false";
		}
		return "false";
	}

	@RequestMapping("/paging")
	public String usersPage(Model model,Integer pageIndex, Integer pageSize,
			HttpSession session) {
		if(session.getAttribute("admin")==null)return "redirect:/backlogin";
		pageIndex=pageIndex==null?1:pageIndex;
		pageSize=pageSize==null?10:pageSize;		
		model.addAttribute("pageIndex",pageIndex);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalPage",us.getTotalUserPage(pageSize) );						
		session.setAttribute("users", us.pageation(pageIndex, pageSize));
		
		return "manage/user";
	}

	@RequestMapping("/deleteUser")
	public String deleteUser(HttpSession session,User user) {
		if(session.getAttribute("admin")==null)return "redirect:/backlogin";
		us.deleteUser(user);
		return "redirect:/User/paging";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}
	
	@RequestMapping("/modifyInfoAllPage")
	public String modifyInfoAllPage(Integer uid, HttpSession session) {
		if(session.getAttribute("admin")==null)return "redirect:/backlogin";
		User user = us.queryUserById(uid);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String birth = "";
		birth = sdf.format(user.getUbirthdate());
		try {
			user.setUbirthdate(sdf.parse(birth));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		session.setAttribute("user", user);
		session.setAttribute("birthday", birth);
		return "manage/user-modify";
	}
	@ResponseBody
	@RequestMapping("/modifyInfoAll")
	public String modifyInfoAll(User user, HttpSession session) {
		if(session.getAttribute("admin")==null)return "redirect:/backlogin";
		if (us.modifyInfoAll(user)) {
			session.setAttribute("user", user);
			return "success";
		} else {
			return "false";
		}
	}


}

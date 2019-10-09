package com.imu.jk.service.impl;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imu.jk.bean.User;
import com.imu.jk.mapper.UserMapper;
import com.imu.jk.service.UserService;
import com.imu.zkh.encrypt.MyCipher;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	public Integer getTotalUserPage(Integer pageSize) {
		Integer row = 0;
		try {
			row = userMapper.getTotalUserRow();
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return row % pageSize == 0 ? row / pageSize : row / pageSize + 1;
	}

	public String login(User user) {
		MyCipher mc = new MyCipher();
		String pwd = mc.decrypt(userMapper.login(user), "***");
		return pwd;
	}

	public boolean register(User user) {
		boolean flag = false;
		MyCipher mc = new MyCipher();
		user.setUpassword(mc.encrypt(user.getUpassword(), "***"));
		try {
			userMapper.register(user);
			flag = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag;
	}

	public boolean modifyInfo(User user) {
		try {
			userMapper.modifyInfo(user);
		} catch (Exception e) {

			return false;
		}

		return true;
	}

	public boolean deleteUser(User user) {
		try {
			userMapper.deleteUser(user);
		} catch (Exception e) {
			return false;
		}

		return true;
	}

	public List<User> pageation(Integer pageIndex, Integer pageSize) {
		Integer rowIndex = (pageIndex - 1) * pageSize;
		return userMapper.pageation(rowIndex, pageSize);
	}

	public User queryUserByName(String uusername) {

		return userMapper.queryUserByName(uusername);
	}

	public boolean resetPwd(User user) {
		try {
			MyCipher mc = new MyCipher();
			user.setUpassword(mc.encrypt(user.getUpassword(), "***"));
			userMapper.resetPwd(user);
		} catch (Exception e) {
			return false;
		}

		return true;
	}

	// 暂未上线
	public boolean uploadAvatar(File img) {
		return false;
		// TODO Auto-generated method stub

	}

	public boolean modifyInfoAll(User user) {
		try {
			MyCipher mc = new MyCipher();
			user.setUpassword(mc.encrypt(user.getUpassword(), "***"));
			userMapper.modifyInfoAll(user);
		} catch (Exception e) {
			return false;
		}
		return true;

	}

	public User queryUserById(Integer uid) {
		User user = userMapper.queryUserById(uid);
		MyCipher mc = new MyCipher();

		user.setUpassword(mc.decrypt(user.getUpassword(), "***"));

		return user;
	}

}

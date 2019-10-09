package com.imu.jk.service;

import java.io.File;
import java.util.List;

import com.imu.jk.bean.User;

public interface UserService {
	
	public String login(User user);
	public boolean register(User user);
	
	public boolean modifyInfo(User user);
	//�ݶ�
	public boolean uploadAvatar(File img);
	
	
	//����Ա����
	public Integer getTotalUserPage(Integer pageSize);
	public List<User> pageation(Integer pageIndex,Integer pageSize);
	
	public User queryUserByName(String uusername);
	public boolean deleteUser(User user);
	public boolean resetPwd(User user);//��User�е�id����name���в�ѯ�����
	
	
	public User queryUserById(Integer uid);//根据uid查询整个user信息
	public boolean modifyInfoAll(User user);//管理员给普通用户全面修改信息

}

package com.imu.jk.mapper;

import java.io.File;
import java.util.List;

import com.imu.jk.bean.User;

public interface UserMapper {
	
	//�û�����
	public String login(User user);
	public void register(User user);
	
	public void modifyInfo(User user);
	//�ݶ�
	public void uploadAvatar(File img);
	
	
	//����Ա����
	public Integer getTotalUserRow();
	public List<User> pageation(Integer pageIndex,Integer pageSize);
	
	public User queryUserByName(String uusername);
	public void deleteUser(User user);
	public void resetPwd(User user);//��User�е�id����name���в�ѯ�����
	
	
	public User queryUserById(Integer uid);//根据uid查询整个user信息
	public void modifyInfoAll(User user);//管理员给普通用户全面修改信息
	
}

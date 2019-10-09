package com.imu.jk.mapper;

import java.util.List;

import com.imu.jk.bean.Administrator;
public interface AdministratorMapper {
	
	public String login(Administrator administrator);
	//��ע������й���Աע��
	public void register(Administrator administrator);
	//���ע����
	/*public String genRegCode();*/
	
	
	
	public Administrator queryAdminByName(String aname);
	/*����Ա����*/
	public Integer getTotalAdministratorRow();
	public List<Administrator> pageation(Integer pageIndex,Integer pageSize);
	//public void addAdmin(Administrator administrator);
	
	public void deleteAdmin(Administrator administrator);

	public void resetPwd(Administrator administrator);
}

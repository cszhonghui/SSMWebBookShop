package com.imu.jk.service;

import java.util.List;

import com.imu.jk.bean.Administrator;

public interface AdministratorService {

	public String login(Administrator administrator);

	// ��ע������й���Աע��
	public boolean register(Administrator administrator);

	// ���ע����
	/* public String genRegCode(); */

	/* ����Ա���� */
	
	public Administrator queryAdminByName(String aname);
	public Integer getTotalAdministratorPage(Integer pageSize);

	public List<Administrator> pageation(Integer pageIndex, Integer pageSize);

	// �ĸ��Բ�������ģ�
	

	public boolean deleteAdmin(Administrator administrator);

	public boolean resetPwd(Administrator administrator);
}

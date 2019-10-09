package com.imu.jk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imu.jk.bean.Administrator;
import com.imu.jk.mapper.AdministratorMapper;
import com.imu.jk.service.AdministratorService;
import com.imu.zkh.encrypt.MyCipher;

@Service
public class AdministratorServiceImpl implements AdministratorService {
	@Autowired
	private AdministratorMapper administratorMapper;

	public Integer getTotalAdministratorPage(Integer pageSize) {
		Integer row = 0;
		try {
			row = administratorMapper.getTotalAdministratorRow();
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return row % pageSize == 0 ? row / pageSize : row / pageSize + 1;
	}

	public String login(Administrator administrator) {

		MyCipher mc = new MyCipher();
		String pwd = mc.decrypt(administratorMapper.login(administrator), "***");
		return pwd;

	}

	public boolean register(Administrator administrator) {
		boolean flag = false;
		MyCipher mc = new MyCipher();
		administrator.setApassword(mc.encrypt(administrator.getApassword(),
				"***"));
		try {
			administratorMapper.register(administrator);
			flag = true;
		} catch (Exception e) {

			System.out.println(e.getMessage());
		}
		return flag;

	}

	public List<Administrator> pageation(Integer pageIndex, Integer pageSize) {
		Integer rowIndex = (pageIndex - 1) * pageSize;

		return administratorMapper.pageation(rowIndex, pageSize);
	}

	// ����ʵ��
	public boolean deleteAdmin(Administrator administrator) {

		try {
			administratorMapper.deleteAdmin(administrator);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public boolean resetPwd(Administrator administrator) {

		try {
			MyCipher mc = new MyCipher();
			administrator.setApassword(mc.encrypt(administrator.getApassword(),
					"***"));
			administratorMapper.resetPwd(administrator);
		} catch (Exception e) {
			return false;
		}
		return true;

	}

	public Administrator queryAdminByName(String aname) {
		return administratorMapper.queryAdminByName(aname);
		
	}

}

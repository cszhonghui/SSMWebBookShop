package com.imu.jk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imu.jk.bean.Receive;
import com.imu.jk.mapper.ReceiveMapper;
import com.imu.jk.service.ReceiveService;

@Service
public class ReceiveServiceImpl implements ReceiveService {

	@Autowired
	private ReceiveMapper receiveMapper;
	
	public boolean addReceive(Receive receive) {
		boolean flag=false;
		try {
			receiveMapper.addReceive(receive);
			flag=true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag;
	}


	public boolean deleteReceive(Integer rid) {
		boolean flag=false;
		try {
			receiveMapper.deleteReceive(rid);
			flag=true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag;
	}


	public boolean modifyReceive(Receive receive) {
		boolean flag=false;
		try {
			receiveMapper.modifyReceive(receive);
			flag=true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return flag;
	}


	public List<Receive> queryReceivesByUid(Integer PageIndex,
			Integer PageSize, Integer uid) {
		
		Integer rowIndex=(PageIndex-1)*PageSize;
		return receiveMapper.pageation(rowIndex, PageSize,uid);
	}


	public Integer getTotalReceivePage(Integer pageSize,Integer uid) {
		Integer row=0;
		try {
			row=receiveMapper.getTotalReceiveRow(uid);			
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}		
		return row%pageSize==0?row/pageSize:row/pageSize+1;
	}




}

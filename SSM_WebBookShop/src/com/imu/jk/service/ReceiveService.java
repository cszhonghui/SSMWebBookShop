package com.imu.jk.service;

import java.util.List;

import com.imu.jk.bean.Receive;

public interface ReceiveService {
	public boolean addReceive(Receive receive);
	public boolean deleteReceive(Integer rid);
	public boolean modifyReceive(Receive receive);
	public List<Receive> queryReceivesByUid(Integer PageIndex,Integer PageSize,Integer uid);
	public Integer getTotalReceivePage(Integer pageSize,Integer uid);
}

package com.imu.jk.mapper;

import java.util.List;

import com.imu.jk.bean.Receive;

public interface ReceiveMapper {
	public void addReceive(Receive receive);
	public void deleteReceive(Integer rid);
	public void modifyReceive(Receive receive);
	public List<Receive> pageation(Integer pageIndex,Integer pageSize,Integer uid);
	public Integer getTotalReceiveRow(Integer uid);
}

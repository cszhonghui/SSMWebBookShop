package com.imu.jk.mapper;

import java.util.List;

import com.imu.jk.bean.History;

public interface HistoryMapper {
	
	public void addHistory(History history);
	public void clearHistoriesByUid(Integer uid);
	public List<History> queryHisByUid(Integer uid);
}

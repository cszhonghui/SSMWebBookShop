package com.imu.jk.service;

import java.util.List;

import com.imu.jk.bean.History;

public interface HistoryService {
	public boolean addHistory(History history);
	public boolean clearHistoriesByUid(Integer uid);
	public List<History> queryHisByUid(Integer uid);
}

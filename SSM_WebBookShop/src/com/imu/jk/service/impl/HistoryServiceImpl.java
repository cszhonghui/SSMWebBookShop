package com.imu.jk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imu.jk.bean.History;
import com.imu.jk.mapper.HistoryMapper;
import com.imu.jk.service.HistoryService;
@Service
public class HistoryServiceImpl implements HistoryService {

	@Autowired
	HistoryMapper historyMapper;
	public boolean addHistory(History history) {
		List<History> histories=historyMapper.queryHisByUid(history.getUser().getUid());
		for(History his:histories){
			if(his.getBook().getBid().equals(history.getBook().getBid())){
				return true;
			}
		}
		try {
			historyMapper.addHistory(history);			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;


	}

	public boolean clearHistoriesByUid(Integer uid) {
		try {
			historyMapper.clearHistoriesByUid(uid);		
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;


	}

	public List<History> queryHisByUid(Integer uid) {
		
		return historyMapper.queryHisByUid(uid);
	}

}

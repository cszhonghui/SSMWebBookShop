package com.imu.jk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imu.jk.bean.Comment;
import com.imu.jk.mapper.CommentMapper;
import com.imu.jk.service.CommentService;
@Service
public class CommentSeviceImpl implements CommentService {

	@Autowired
	CommentMapper commentMapper;
	public boolean deleteComm(Comment comment) {
		try {
			commentMapper.deleteComm(comment);			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;

	}

	public List<Comment> getAllComment() {
		// TODO Auto-generated method stub
		return commentMapper.getAllComment();
	}

	public List<Comment> getCommentByBookId(Integer bid,Integer pageIndex,Integer pageSize) {
		Integer rowIndex=(pageIndex-1)*pageSize;
		return commentMapper.getCommentByBookId(bid,rowIndex, pageSize);
	}

	public List<Comment> getCommentByUserId(Integer uid) {
		// TODO Auto-generated method stub
		return commentMapper.getCommentByUserId(uid);
	}

	public boolean makeComm(Comment comment) {
		try {
			commentMapper.makeComm(comment);			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;

	}

	public boolean modifyComm(Comment comment) {
		try {
			commentMapper.modifyComm(comment);			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;

	}

	public Integer getTotalPages(Integer bid,Integer pageSize) {
		// TODO Auto-generated method stub
		Integer row=commentMapper.getTotalRowByBookId(bid);
		return row%pageSize==0?row/pageSize:row/pageSize+1;
	}

}

package com.imu.jk.service;

import java.util.List;

import com.imu.jk.bean.Comment;

public interface CommentService {
	public boolean makeComm(Comment comment);
	
	
	public boolean deleteComm(Comment comment);
	public boolean modifyComm(Comment comment);
	public List<Comment> getCommentByUserId(Integer uid);
	public List<Comment> getCommentByBookId(Integer bid,Integer rowIndex,Integer pageSize);
	public List<Comment> getAllComment();
	public Integer getTotalPages(Integer bid,Integer pageSize);
}

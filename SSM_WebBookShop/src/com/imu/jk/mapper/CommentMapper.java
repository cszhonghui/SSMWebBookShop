package com.imu.jk.mapper;

import java.util.List;

import com.imu.jk.bean.Comment;

public interface CommentMapper {
	
	/*public Integer cid;
	public Integer bid;
	public String uusername;
	public String cdate;
	public String ccontent;*/
	
	
	public void makeComm(Comment comment);
	public void deleteComm(Comment comment);
	public void modifyComm(Comment comment);
	public List<Comment> getCommentByUserId(Integer uid);
	public List<Comment> getCommentByBookId(Integer bid,Integer rowIndex,Integer pageSize);
	public Integer getTotalRowByBookId(Integer bookId);
	
	
	public List<Comment> getAllComment();
}	

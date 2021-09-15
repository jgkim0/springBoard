package com.board.dao;

import java.util.List;

import com.board.domain.ReplyVO;

public interface ReplyDAO {

	// 댓글 조회
	public List<ReplyVO> list(int bno) throws Exception;
	
	// 선택 댓글 조회
	public ReplyVO select(int rno) throws Exception;
	
	// 댓글 작성
	public void write(ReplyVO vo) throws Exception;
	
	// 댓글 수정
	public void update(ReplyVO vo) throws Exception;
	
	// 댓글 삭제
	public void delete(ReplyVO vo) throws Exception;
	
	
}	

package com.spring.movieview.reply.service;

import java.util.List;

import com.spring.movieview.commons.Criteria;
import com.spring.movieview.reply.model.ReplyVO;



public interface IReplyService {


	//댓글 목록 불러오기
	List<ReplyVO> list(int reviewNo) throws Exception;

	//댓글 쓰기 기능
	void insert(ReplyVO reply) throws Exception;

	//댓글 수정 기능
	void update(ReplyVO reply) throws Exception;

	//댓글 삭제 기능
	void delete(int replyNo, int reviewNo) throws Exception;

	//페이징처리된 게시글 목록 불러오기 기능
	List<ReplyVO> listPaging(int reviewNo, Criteria cri) throws Exception;

	//특정 게시물의 총 댓글 수 불러오기 기능
	int countReplies(int reviewNo) throws Exception;

	

}




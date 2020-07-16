package com.spring.movieview.reply.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.xdevapi.JsonArray;
import com.spring.movieview.commons.Criteria;
import com.spring.movieview.commons.PageCriteria;
import com.spring.movieview.commons.SearchCriteria;
import com.spring.movieview.reply.model.ReplyVO;
import com.spring.movieview.reply.service.IReplyService;



@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	private IReplyService service;
	
	//댓글 등록 처리
		/*
		 # @RequestBody: 클라이언트가 전송한 JSON데이터를 자바 객체로 변환해주는
		   아노테이션입니다.
		 */
		@RequestMapping(value="", method=RequestMethod.POST)	
		public String register(@RequestBody ReplyVO reply) throws Exception {
			
			logger.info("/replies : POST요청 발생!");
			logger.info("원본 글 번호: " + reply.getReviewNo());
			service.insert(reply);
			logger.info(reply.toString() + "댓글 등록 성공!");
			return "regSuccess";
		}
		
		//댓글 목록 가져오기
		/*
		 # @PathVariable: REST방식의 URI경로에서 원하는 데이터를 추출할 때 사용.
		 */
		@RequestMapping(value="/all/{reviewNo}", method=RequestMethod.GET)
		public List<ReplyVO> list(@PathVariable int reviewNo) throws Exception {
			
			logger.info("/replies/all/" + reviewNo + " : GET요청 발생!");
					
			return service.list(reviewNo);
		}
		
		//페이징 처리된 댓글 목록 가져오기
		@RequestMapping(value="/{reviewNo}/{page}", method=RequestMethod.GET)
		public Map<String, Object> listPaging(@PathVariable("reviewNo") int reviewNo,
										@PathVariable("page") int page) throws Exception {
			
			Criteria cri = new Criteria();
			cri.setPage(page);
			List<ReplyVO> replies = service.listPaging(reviewNo, cri);
			
			PageCriteria pc = new PageCriteria();
			pc.setCriteria(cri);
			pc.setArticleTotalCount(service.countReplies(reviewNo));
			
			Map<String, Object> datas = new HashMap<>();
			datas.put("replies", replies);
			datas.put("pageCreator", pc);
			
			return datas;		
		}
		
		
		//댓글 삭제 요청
		@RequestMapping(value="/{replyNo}", method=RequestMethod.DELETE)
		public String delete(@PathVariable int replyNo, 
				@RequestBody ReplyVO reply) throws Exception {
			
			logger.info("/replies/" + replyNo + " : DELETE요청 발생!");
			service.delete(replyNo , reply.getReviewNo());
			
			return "delSuccess";
		}
		
		//댓글 수정 요청
		@RequestMapping(value="/{replyNo}", method=RequestMethod.PUT)
		public String update(@PathVariable("replyNo") int replyNo,
				@RequestBody ReplyVO reply) throws Exception {
			
			logger.info("/replies/" + replyNo + " : PUT요청 발생!");
			reply.setReplyNo(replyNo);
			service.update(reply);
			logger.info(reply.toString()+"댓글 수정 성공!");
			return "modSuccess";
			
		}
		
		
		
		
		

	
	
}



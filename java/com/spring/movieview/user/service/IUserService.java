package com.spring.movieview.user.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.spring.movieview.commons.SearchCriteria;
import com.spring.movieview.user.model.LoginVO;
import com.spring.movieview.user.model.UserVO;

public interface IUserService {
	
	//회원가입 처리
	    void register(UserVO user) throws Exception;

		//아이디 중복확인 처리
		int isDuplicateId(String userId) throws Exception;

		//로그인 시도 회원정보 조회처리
		UserVO login(LoginVO login) throws Exception;
		
		

		//세션아이디 검증 후 회원정보 불러오는 처리
		UserVO getUserWithSessionId(String sessionId) throws Exception;
		// 유저개인정보
		UserVO getOneUser(String id) throws Exception;
		
		void dropUser(String id, String pw) throws Exception;
		
		List<UserVO> userList(SearchCriteria cri) throws Exception;
		
		int countTotalUser(SearchCriteria cri) throws Exception;
	}
	



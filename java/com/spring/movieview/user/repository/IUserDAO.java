package com.spring.movieview.user.repository;

import java.util.List;
import java.util.Map;

import com.spring.movieview.commons.SearchCriteria;
import com.spring.movieview.user.model.LoginVO;
import com.spring.movieview.user.model.UserVO;

public interface IUserDAO {
	
	
	//회원가입 처리
	    void register(UserVO user) throws Exception;
		
		//아이디 중복확인 처리
		int isDuplicateId(String userId) throws Exception;
		
		
		//로그인 시도 회원정보 조회처리
		UserVO login(LoginVO login) throws Exception;

		//자동 로그인 유지 처리
		void keepLogin(Map<String, Object> datas) throws Exception;
		
		//세션아이디 검증 후 회원정보 불러오는 처리
		UserVO getUserWithSessionId(String sessionId) throws Exception;
		//유저 개인정보
		UserVO getOneUser(String id) throws Exception;
		//회원탈퇴
		void dropUser(Map<String, Object> datas) throws Exception;
		//전체 회원관리
		List<UserVO> userList(SearchCriteria cri) throws Exception;
		//전체 회원 수
		int countTotalUser(SearchCriteria cri) throws Exception;
		
}

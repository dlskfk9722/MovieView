package com.spring.movieview.user.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.movieview.commons.SearchCriteria;
import com.spring.movieview.user.model.LoginVO;
import com.spring.movieview.user.model.UserVO;
import com.spring.movieview.user.repository.IUserDAO;


@Service
public class UserService implements IUserService {
	
	@Autowired
	private IUserDAO dao;
	
	



	
	@Override
	public void register(UserVO user) throws Exception {
		//회원 비밀번호를 인코딩
				
				
				dao.register(user);
	}

	@Override
	public int isDuplicateId(String userId) throws Exception {
		return dao.isDuplicateId(userId);
	}
	


	@Override
	public UserVO login(LoginVO login) throws Exception {
		return dao.login(login);
	}

	

	@Override
	public UserVO getUserWithSessionId(String sessionId) throws Exception {
		
		return dao.getUserWithSessionId(sessionId);
	}

	@Override
	public UserVO getOneUser(String id) throws Exception {
		return dao.getOneUser(id);
	}

	@Override
	public void dropUser(String id, String pw) throws Exception {
		Map<String, Object> datas = new HashMap<>();
		datas.put("id", id);
		datas.put("pw", pw);
		dao.dropUser(datas);
	}

	@Override
	public List<UserVO> userList(SearchCriteria cri) throws Exception {
		return dao.userList(cri);
	}

	@Override
	public int countTotalUser(SearchCriteria cri) throws Exception {
		return dao.countTotalUser(cri);
	}
	

	


}

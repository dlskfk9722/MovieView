package com.spring.movieview.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.movieview.commons.PageCriteria;
import com.spring.movieview.commons.SearchCriteria;
import com.spring.movieview.user.model.LoginVO;
import com.spring.movieview.user.model.UserVO;
import com.spring.movieview.user.service.IUserService;

@RestController
@RequestMapping("/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private IUserService service;

	//회원가입 처리요청
    @RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(@RequestBody UserVO user) throws Exception {

		logger.info("/user/ 요청 발생: POST");
		logger.info("Param: " + user);
		service.register(user);

		return "joinSuccess";
	}

	//회원가입 페이지 열기 요청
	@GetMapping("/join")
	public ModelAndView register() throws Exception {
		logger.info("/user/join 요청 발생: GET");
		return new ModelAndView("user/join");
	}

	//ID중복확인 체크 요청
	@PostMapping("/idCheck")
	public Map<String, Object> confirmId(@RequestBody String userId) throws Exception {
		System.out.println("중복확인 요청 ID: " + userId);
		Map<String, Object> data = new HashMap<>();

		int result = service.isDuplicateId(userId);
		if(result == 0) {
			System.out.println("아이디 사용 가능!");
			data.put("confirm", "OK");
		} else { 
			System.out.println("아이디가 중복됨!");
			data.put("confirm", "NO");
		}
		return data;
	}

	//로그인 페이지 요청
	@GetMapping("/login")
	public ModelAndView login() throws Exception {
		logger.info("/user/login 요청! : GET");
		return new ModelAndView("user/login");
	}

	//로그인 검증 요청
	@PostMapping("/loginCheck")
	public ModelAndView login(LoginVO login, 
			HttpSession session,Model model) throws Exception {

		logger.info("/user/loginUser 요청! : POST");
		logger.info("parameters : " + login);

    	UserVO user = service.login(login);
    	logger.info("로그인 시도 회원정보:"+user);
		
		if(user==null){
			model.addAttribute("message","ID나PW가 틀립니다.");
			return new ModelAndView("user/login");
		}else{
			session.setAttribute("loginLevel", user.getUserLevel());
			session.setAttribute("loginId", user.getUserId());
			System.out.println("아이디: "+user.getUserId()+", 권한: "+user.getUserLevel());
			return new ModelAndView("redirect:/movieboard/list");
		}
	
	}
	
	  //로그아웃처리
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(UserVO user, Model model, HttpSession session) {
				
        session.setAttribute("loginId",null); 
        session.setAttribute("loginLevel", null);
        return new ModelAndView("home");
	}

    //유저 개인정보
    @RequestMapping(value="/getuser")
    public ModelAndView getOneUser(String id, Model model) throws Exception{
    	model.addAttribute("getUser", service.getOneUser(id));
    	System.out.println(service.getOneUser(id));
    	return new ModelAndView("user/get_one_user");
    }
    
    //회원탈퇴 폼 요청
    @RequestMapping(value="/dropuser", method=RequestMethod.GET)
    public ModelAndView dropUser(String userId, Model model) throws Exception {
    	model.addAttribute("getUser", service.getOneUser(userId));
    	return new ModelAndView("user/drop_user");
    }
    //회원탈퇴
    @RequestMapping(value="/dropuser", method=RequestMethod.DELETE)
    public String dropUser(@RequestBody LoginVO login, HttpSession session) throws Exception{
    	System.out.println("아이디: "+login.getUserId()+", 비번: "+login.getUserPw());
    	service.dropUser(login.getUserId(), login.getUserPw());
    	session.setAttribute("loginId",null); 
        session.setAttribute("loginLevel", null);
    	return "drop";
    }
    //전체 유저 조회
    @RequestMapping(value="/userList")
    public ModelAndView userList(SearchCriteria cri, Model model) throws Exception {
    	PageCriteria pc = new PageCriteria();
    	cri.setCountPerPage(10);
    	pc.setCriteria(cri);
    	pc.setArticleTotalCount(service.countTotalUser(cri));
    	model.addAttribute("users", service.userList(cri));
    	model.addAttribute("pageCri", pc);
    	model.addAttribute("cri", cri);
    	return new ModelAndView("user/user_list");
    }
    //관리자 회원 강제삭제
    @RequestMapping(value="/admindrop", method=RequestMethod.DELETE)
    public String adminDrop(@RequestBody UserVO user) throws Exception{
    	System.out.println("아디: "+user.getUserId()+"비번: "+user.getUserPw());
    	service.dropUser(user.getUserId(), user.getUserPw());
    	return "dropSuccess";
    }
}










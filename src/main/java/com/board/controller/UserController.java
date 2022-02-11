package com.board.controller;

import java.util.Locale;

import org.mindrot.jbcrypt.BCrypt;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.domain.UserVO;
import com.board.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	UserService service;
	
	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	public String Login(Locale locale) {
		logger.info("Login 화면 호출", locale);
		
		return "login";
	}
		
	@RequestMapping(value = "/Join", method = RequestMethod.GET)
	public String Join(Locale locale) {
		
		return "join";
	}
	
	@RequestMapping(value="/Join", method=RequestMethod.POST)
	public String postjoin(UserVO vo) throws Exception {
	
		String hashedPw = BCrypt.hashpw(vo.getUserPass(), BCrypt.gensalt());
		vo.setUserPass(hashedPw);
		
		service.join(vo);
								
    	return "redirect:/";
	}

	
	@RequestMapping(value = "/Login", method = RequestMethod.POST)
	public String postLogin(UserVO userVO, HttpServletRequest request, Model model) throws Exception{
		
		HttpSession session = request.getSession();
		UserVO userVO1 = service.login(userVO);
		
		logger.info("############################" + userVO1.getUserID());
		logger.info("############################" + userVO1.getUserPass());
		logger.info("############################" + userVO.getUserPass());
				
		if (userVO1 == null || !BCrypt.checkpw(userVO.getUserPass(), userVO1.getUserPass())) {
			System.out.print("로그인 정보가 없습니다.");
			model.addAttribute("msg", "로그인 정보가 없습니다.");
			model.addAttribute("url", "/");
			} else {
				session.setAttribute("userID", userVO1.getUserID());
			}

		return "redirect:/";

		//model.addAttribute("Login", userVO);
		
	}
	
	@RequestMapping(value = "/Logout", method = RequestMethod.GET)
	public String postLogin(HttpServletRequest request) throws Exception{
		

		HttpSession session = request.getSession();

		logger.info("############################getAttribute.userID : " + session.getAttribute("userID"));

		if(session == null || !request.isRequestedSessionIdValid()) {
			System.out.println("세션이 존재하지 않습니다.");
		} else {
			session.invalidate();
		}
		return "redirect:/";
	}

		
}

package com.board.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.board.controller.HomeController;
import com.board.domain.UserVO;
//import com.ga.common.annotation.NoLoginCheck;
 
public class LoginInterceptor extends HandlerInterceptorAdapter{

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        
		logger.info("로그인체크!!!!!!!!!!!인터셉터!!!!!");
    	
        HttpSession session = request.getSession();
 
        if(session.getAttribute("userID") == null){
        	
        	response.setContentType("text/html; charset=UTF-8");
        	PrintWriter out = response.getWriter();
        	out.print("<script>alert('로그인 후 이용해주시기 바랍니다.'); location.href='/Login';</script>");
        	
        	//response.sendRedirect("/Login");
        	out.flush();
      	        	
        	return false;
        }
        
        return true;
    }
 
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub
    	
        System.out.println("되나??????????????????????????");
        super.postHandle(request, response, handler, modelAndView);
        

    }
 
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // TODO Auto-generated method stub
    	
        System.out.println("안되나??????????????????????????");
    	
        super.afterCompletion(request, response, handler, ex);
    }
 
    
    
}
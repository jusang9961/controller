package com.board.service;

import javax.annotation.Resource;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.board.dao.UserDAO;
import com.board.domain.UserVO;

@Service
public class UserServiceImpl implements UserService {

	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	//@Resource(name="sqlSessionFactory")
	
	@Inject
	private UserDAO dao;
	
	//회원가입 처리
	@Override
	public void join(UserVO vo) throws Exception {
		
		dao.join(vo);
	}

	//로그인 처리
	@Override
	public UserVO login(UserVO userVO) throws Exception {

		logger.info("########  UserServiceImpl.login #######");

		return dao.login(userVO);
		
	}
	
}
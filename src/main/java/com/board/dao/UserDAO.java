package com.board.dao;

import com.board.domain.UserVO;


public interface UserDAO {

	public void join(UserVO vo) throws Exception;
	public UserVO login(UserVO userVO) throws Exception;
	
}

package com.board.service;

import com.board.domain.UserVO;

public interface UserService {

	public void join(UserVO vo) throws Exception;
	public UserVO login(UserVO userVO) throws Exception;
}

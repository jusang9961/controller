package com.board.dao;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.domain.UserVO;


@Repository
public class UserDAOImpl implements UserDAO {

	private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);
	
	@Autowired
	@Resource(name="sqlSession")
	
	@Inject
	private SqlSession sql;

	private static String namespace = "com.board.mappers.user";

	@Override
	public void join(UserVO vo) throws Exception {

		sql.insert(namespace + ".join", vo);
		
	}
	
	// 로그인 처리
	@Override
	public UserVO login(UserVO userVO) throws Exception {

		return sql.selectOne(namespace + ".login", userVO);
		
	}

}
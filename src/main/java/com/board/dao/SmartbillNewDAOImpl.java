package com.board.dao;


import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import javax.inject.Inject;

@Repository
public class SmartbillNewDAOImpl implements SmartbillNewDAO {

	private static final Logger logger = LoggerFactory.getLogger(SmartbillNewDAOImpl.class);
	
	@Autowired
	@Resource(name="sqlSession")
	
	@Inject
	private SqlSession sql_new;

	private static String namespace = "com.board.mappers.smartbillNew";
}
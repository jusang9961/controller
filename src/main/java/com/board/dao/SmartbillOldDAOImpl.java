package com.board.dao;

import javax.annotation.Resource;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.domain.SmartbillOldVO;

@Repository
public class SmartbillOldDAOImpl implements SmartbillOldDAO {

	private static final Logger logger = LoggerFactory.getLogger(SmartbillOldDAOImpl.class);
	
	@Autowired
	@Resource(name="sqlSession2")
	
	@Inject
	private SqlSession sql_old;

	private static String namespace = "com.board.mappers.smartbillOld";


	@Override
	public void arissue(SmartbillOldVO smartbillOldvo) throws Exception {

		sql_old.insert(namespace + ".arissue", smartbillOldvo);
		
	}

}
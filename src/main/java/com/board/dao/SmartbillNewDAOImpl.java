package com.board.dao;


import com.board.domain.SmartbillNewVO;
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

	// 차세대 DB로 연결
	@Autowired
	@Resource(name="sqlSession3")
	
	@Inject
	private SqlSession sql_new;

	private static String namespace = "com.board.mappers.smartbillNew";

	//정매출 발행
	@Override
	public void arissue(SmartbillNewVO smartbillNewVO) throws Exception{

		sql_new.insert(namespace + ".arissue", smartbillNewVO);
		sql_new.insert(namespace + ".arissueItem", smartbillNewVO);
		sql_new.insert(namespace + ".arissueStatus", smartbillNewVO);
		sql_new.insert(namespace + ".interface", smartbillNewVO);
	}

}
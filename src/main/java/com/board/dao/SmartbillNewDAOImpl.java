package com.board.dao;


import com.board.domain.SmartbillNewVO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import javax.inject.Inject;
import java.util.List;

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

	/*
	 * 정매출(거래명세서 포함) 발행
	 */
	@Override
	public void arissueDtt(SmartbillNewVO smartbillNewVO) throws Exception {

		sql_new.insert(namespace + ".arissue", smartbillNewVO);
		sql_new.insert(namespace + ".arissueItemDTT", smartbillNewVO);
		sql_new.insert(namespace + ".arissueStatus", smartbillNewVO);
		sql_new.insert(namespace + ".interface", smartbillNewVO);

		// DTI item insert
		smartbillNewVO.setDtiGubun("DTI");
		sql_new.insert(namespace + ".arissueItem", smartbillNewVO);

	}

	/*
	 * 역매입 요청
	 */
	@Override
	public void issue(SmartbillNewVO smartbillNewVO) {

		sql_new.insert(namespace + ".arissue", smartbillNewVO);
		sql_new.insert(namespace + ".arissueItem", smartbillNewVO);
		sql_new.insert(namespace + ".arissueStatus", smartbillNewVO);
		sql_new.insert(namespace + ".interface", smartbillNewVO);
	}

	/*
	 * 역매입(거래명세서 포함) 요청
	 */
	@Override
	public void issueDtt(SmartbillNewVO smartbillNewVO) {

		sql_new.insert(namespace + ".arissue", smartbillNewVO);
		sql_new.insert(namespace + ".arissueItem", smartbillNewVO);
		sql_new.insert(namespace + ".arissueStatus", smartbillNewVO);
		sql_new.insert(namespace + ".interface", smartbillNewVO);

		// DTT item insert
		smartbillNewVO.setDtiGubun("DTT");
		sql_new.insert(namespace + ".arissueItemDTT", smartbillNewVO);
	}

	/*
	 * 세금계산서 보관함 조회
	 */
	@Override
	public List<SmartbillNewVO> list(SmartbillNewVO smartbillNewVO) throws Exception{

		logger.info("차세대 세금계산서 보관함(리스트) 조회");

		return sql_new.selectList(namespace + ".list", smartbillNewVO);
	}

}
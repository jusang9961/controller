package com.board.dao;

import javax.annotation.Resource;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.domain.SmartbillOldVO;

import java.util.List;

@Repository
public class SmartbillOldDAOImpl implements SmartbillOldDAO {

	private static final Logger logger = LoggerFactory.getLogger(SmartbillOldDAOImpl.class);
	
	@Autowired
	@Resource(name="sqlSession2")
	
	@Inject
	private SqlSession sql_old;

	private static String namespace = "com.board.mappers.smartbillOld";

	/*
	 * 정매출 발행
	 */
	@Override
	public void arissue(SmartbillOldVO smartbillOldvo) throws Exception {

		sql_old.insert(namespace + ".arissue", smartbillOldvo);
		sql_old.insert(namespace + ".arissueItem", smartbillOldvo);
		sql_old.insert(namespace + ".arissueStatus", smartbillOldvo);
	}

	/*
	 * 역매입 요청
	 */
	@Override
	public void issue(SmartbillOldVO smartbillOldvo) throws Exception {

		sql_old.insert(namespace + ".issue", smartbillOldvo);
		sql_old.insert(namespace + ".arissueItem", smartbillOldvo);
		sql_old.insert(namespace + ".arissueStatus", smartbillOldvo);
	}
	
	/*
	 * 정매출(거래명세서 포함) 발행
	 */
	@Override
	public void arissueDtt(SmartbillOldVO smartbillOldvo) throws Exception {

		logger.info("전자(세금)계산서 발행(거래명세서 포함) XXSB_DTI_MAIN insert");
		sql_old.insert(namespace + ".arissue", smartbillOldvo);
		logger.info("전자(세금)계산서 발행 거래명세서 XXSB_DTI_ITEM insert");
		sql_old.insert(namespace + ".arissueItemDTT", smartbillOldvo);
		logger.info("전자(세금)계산서 발행(거래명세서 포함) XXSB_DTI_stats insert");
		sql_old.insert(namespace + ".arissueStatus", smartbillOldvo);

		// DTI item insert
		logger.info("전자(세금)계산서 발행 XXSB_DTI_ITEM insert");
		smartbillOldvo.setDtiGubun("DTI");
		sql_old.insert(namespace + ".arissueItem", smartbillOldvo);

	}

	/*
	 * 세금계산서 보관함(리스트)
	 */
	@Override
	public List<SmartbillOldVO> list(SmartbillOldVO smartbillOldVO) throws Exception{

		logger.info("세금계산서 보관함(리스트) 조회");

		return sql_old.selectList(namespace + ".list", smartbillOldVO);
		//logger.info(list.toString());
		//sql_old.selectList(namespace + ".list");
		//return null;
	}

	/*
	 * 세금계산서 view
	 */
    @Override
    public SmartbillOldVO view(String conversationid) throws Exception {
		return sql_old.selectOne(namespace + ".view", conversationid);
	}

	@Override
	public SmartbillOldVO status(String conversationid) throws Exception {
		return sql_old.selectOne(namespace + ".status", conversationid);
	}

	@Override
    public void statusChange(SmartbillOldVO smartbillOldVO) throws Exception {

        sql_old.update(namespace + ".statusChange", smartbillOldVO);
    }
}
package com.board.dao;

import com.board.domain.SmartbillApiHanwhaVO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import javax.inject.Inject;
import java.util.List;


@Repository
public class SmartbillHanwhaDAOImpl implements SmartbillApiHanwhaDAO {

	private static final Logger logger = LoggerFactory.getLogger(SmartbillHanwhaDAOImpl.class);

	// 차세대 DB로 연결
	@Autowired
	@Resource(name="sqlSession3")
	
	@Inject
	private SqlSession sql_api_hanwha;

	private static String namespace = "com.board.mappers.smartbillapihanwha";

	@Override
	public int SmartbillApiHanwhaRepoSelect(String hanwhaEtcPcsNo)throws Exception{

		int repoCount = sql_api_hanwha.selectOne(namespace + ".hanwhaRepoSelect1", hanwhaEtcPcsNo);

		return repoCount;
	}

	@Override
	public void SmartbillApiHanwhaRepo(SmartbillApiHanwhaVO smartbillApiHanwhaVO) throws Exception{

/*		logger.info(smartbillApiHanwhaVO.getHanwhaEtcPcsNo());
		logger.info(smartbillApiHanwhaVO.getHanwhaIssueId());
		logger.info(smartbillApiHanwhaVO.getHanwhaSupComRegno());
		logger.info(smartbillApiHanwhaVO.getHanwhaDirection());
		logger.info(smartbillApiHanwhaVO.getHanwhaDtiStatus());*/

		sql_api_hanwha.insert(namespace + ".smartbillApiHanwhaRepo", smartbillApiHanwhaVO);

	}

	@Override
	public List<SmartbillApiHanwhaVO> SmartbillApiHanwhaRepoSelectList() throws Exception{

		return sql_api_hanwha.selectList(namespace +".hanwhaRepoSelectList");

	}

	@Override
	public void SmartbillApiHanwhaStatusResult(SmartbillApiHanwhaVO smartbillApiHanwhaVO) throws Exception{

		sql_api_hanwha.update(namespace + ".HanwhaRepoResultUpdate", smartbillApiHanwhaVO);
	}

}
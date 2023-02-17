package com.board.service;

import com.board.dao.SmartbillApiHanwhaDAO;
import com.board.domain.SmartbillApiHanwhaVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import javax.inject.Inject;
import java.util.List;

@Service
public class SmartbillApiHanwhaServiceImpl implements SmartbillApiHanwhaService {

	private static final Logger logger = LoggerFactory.getLogger(SmartbillApiHanwhaServiceImpl.class);

	@Inject
	private SmartbillApiHanwhaDAO dao_hanwha;

	@Override
	public void SmartbillApiHanwhaRepo(SmartbillApiHanwhaVO smartbillApiHanwhaVO) throws Exception{

		String apiChk = smartbillApiHanwhaVO.getHanwhaEtcPcsNo().substring(smartbillApiHanwhaVO.getHanwhaEtcPcsNo().length()-1, smartbillApiHanwhaVO.getHanwhaEtcPcsNo().length());

		//if(apiChk.equals("6") && smartbillApiHanwhaVO.getHanwhaDirection().equals("1")) {

			int repoCount = dao_hanwha.SmartbillApiHanwhaRepoSelect(smartbillApiHanwhaVO.getHanwhaEtcPcsNo());

			logger.info("repoCount" + repoCount);

			if (repoCount <= 0 || repoCount == 0) {
				logger.info(smartbillApiHanwhaVO.getHanwhaEtcPcsNo());
				dao_hanwha.SmartbillApiHanwhaRepo(smartbillApiHanwhaVO);
			}
		//}
	}

	@Override
	public List<SmartbillApiHanwhaVO> SmartbillApiHanwhaRepoSelectList() throws Exception{

			return dao_hanwha.SmartbillApiHanwhaRepoSelectList();
	}

	@Override
	public void SmartbillApiHanwhaStatusResult(SmartbillApiHanwhaVO smartbillApiHanwhaVO) throws Exception{

		dao_hanwha.SmartbillApiHanwhaStatusResult(smartbillApiHanwhaVO);
	}

}
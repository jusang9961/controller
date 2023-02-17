package com.board.dao;

import com.board.domain.SmartbillApiHanwhaVO;

import java.util.List;

public interface SmartbillApiHanwhaDAO {

	public int SmartbillApiHanwhaRepoSelect(String hanwhaEtcPcsNo) throws Exception;
	public void SmartbillApiHanwhaRepo(SmartbillApiHanwhaVO smartbillApiHanwhaVO) throws Exception;
	public List<SmartbillApiHanwhaVO> SmartbillApiHanwhaRepoSelectList() throws Exception;
	public void SmartbillApiHanwhaStatusResult(SmartbillApiHanwhaVO smartbillApiHanwhaVO) throws Exception;

}

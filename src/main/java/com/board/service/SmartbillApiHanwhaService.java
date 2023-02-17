package com.board.service;

import com.board.domain.SmartbillApiHanwhaVO;
import java.util.List;

public interface SmartbillApiHanwhaService {

	public void SmartbillApiHanwhaRepo(SmartbillApiHanwhaVO smartbillApiHanwhaVO) throws Exception;
	public List<SmartbillApiHanwhaVO> SmartbillApiHanwhaRepoSelectList() throws Exception;
	public void SmartbillApiHanwhaStatusResult(SmartbillApiHanwhaVO smartbillApiHanwhaVO) throws Exception;

}

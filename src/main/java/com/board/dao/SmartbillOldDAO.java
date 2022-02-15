package com.board.dao;

import com.board.domain.SmartbillOldVO;

import java.util.List;

public interface SmartbillOldDAO {

	public void arissue(SmartbillOldVO smartbillOldvo) throws Exception;
	public void issue(SmartbillOldVO smartbillOldvo) throws Exception;
	public void arissueDtt(SmartbillOldVO smartbillOldvo) throws Exception;
	public List<SmartbillOldVO> list() throws Exception;

}

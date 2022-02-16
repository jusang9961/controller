package com.board.service;


import com.board.domain.SmartbillOldVO;

import java.util.List;

public interface SmartbillOldService {

	public void arissue(SmartbillOldVO smartbillOldvo) throws Exception;
	public void issue(SmartbillOldVO smartbillOldvo) throws Exception;
	public void arissueDtt(SmartbillOldVO smartbillOldvo) throws Exception;
	public List<SmartbillOldVO> list(SmartbillOldVO smartbillOldVO) throws Exception;

}

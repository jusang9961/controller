package com.board.dao;

import com.board.domain.SmartbillOldVO;
import com.board.domain.SmartbillOldCertVO;

import java.util.List;

public interface SmartbillOldDAO {

	public void arissue(SmartbillOldVO smartbillOldvo) throws Exception;
	public void issue(SmartbillOldVO smartbillOldvo) throws Exception;
	public void arissueDtt(SmartbillOldVO smartbillOldvo) throws Exception;
	public List<SmartbillOldVO> list(SmartbillOldVO smartbillOldVO) throws Exception;
	public SmartbillOldVO view(String conversationid) throws Exception;
	public SmartbillOldVO status(String conversationid) throws Exception;
	public void statusChange(SmartbillOldVO smartbillOldVO) throws Exception;
	public List<SmartbillOldCertVO> certList(SmartbillOldCertVO smartbillOldCertVO) throws Exception;
	public void issueDtt(SmartbillOldVO smartbillOldVO) throws Exception;

}

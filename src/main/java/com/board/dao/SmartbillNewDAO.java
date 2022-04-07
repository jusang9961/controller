package com.board.dao;

import com.board.domain.SmartbillNewVO;

public interface SmartbillNewDAO {

	public void arissue(SmartbillNewVO smartbillNewVO) throws Exception;
	public void arissueDtt(SmartbillNewVO smartbillNewVO) throws Exception;
	public void issue(SmartbillNewVO smartbillNewVO) throws  Exception;
	public void issueDtt(SmartbillNewVO smartbillNewVO) throws  Exception;

}

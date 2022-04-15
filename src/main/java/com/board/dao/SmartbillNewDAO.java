package com.board.dao;

import com.board.domain.SmartbillNewVO;
import java.util.List;

public interface SmartbillNewDAO {

	public void arissue(SmartbillNewVO smartbillNewVO) throws Exception;
	public void arissueDtt(SmartbillNewVO smartbillNewVO) throws Exception;
	public void issue(SmartbillNewVO smartbillNewVO) throws  Exception;
	public void issueDtt(SmartbillNewVO smartbillNewVO) throws  Exception;
	public List<SmartbillNewVO> ArList(SmartbillNewVO smartbillNewVO) throws Exception;
	public SmartbillNewVO view(String conversationid, String supbuy_type) throws Exception;
	public SmartbillNewVO status(String conversationid, String supbuy_type) throws Exception;
}

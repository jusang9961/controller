package com.board.service;

import com.board.domain.SmartbillNewVO;
import java.util.List;

public interface SmartbillNewService {

	public void arissue(SmartbillNewVO smartbillNewVO) throws Exception;
	public void arissueDtt(SmartbillNewVO smartbillNewVO) throws Exception;
	public void issue(SmartbillNewVO smartbillNewVO) throws  Exception;
	public void issueDtt(SmartbillNewVO smartbillNewVO) throws  Exception;
	public List<SmartbillNewVO> ArList(SmartbillNewVO smartbillNewVO) throws Exception;

}

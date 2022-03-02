package com.board.service;

import com.board.dao.SmartbillNewDAO;
import com.board.domain.SmartbillNewVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.Date;

@Service
public class SmartbillNewServiceImpl implements SmartbillNewService {

	private static final Logger logger = LoggerFactory.getLogger(SmartbillNewServiceImpl.class);

	Long Batchid = new Date().getTime();

	@Inject
	private SmartbillNewDAO dao_new;

	@Override
	public void arissue(SmartbillNewVO smartbillNewVO) throws Exception{

		StringBuffer newWord = new SmartbillNewVO().newWord();

		String Conversation_id = smartbillNewVO.getTxtSupComRegNo() + smartbillNewVO.getTxtByrComRegNo() + smartbillNewVO.getTxtDate() + newWord + "003";
		String Message_id = "Smartbill-Nonsap-" + Batchid + newWord;

		smartbillNewVO.setConversationId(Conversation_id);
		smartbillNewVO.setMessageid(Message_id);
		smartbillNewVO.setDtiGubun("DTI");
		smartbillNewVO.setTxtSupbuy_type("AR");
		smartbillNewVO.setTxtDirection("2");
		smartbillNewVO.setSignal("ARISSUE");

		dao_new.arissue(smartbillNewVO);
	}

}
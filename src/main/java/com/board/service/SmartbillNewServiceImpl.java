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

	@Override
	public void arissueDtt(SmartbillNewVO smartbillNewVO) throws Exception{

		StringBuffer newWord = new SmartbillNewVO().newWord();

		String Conversation_id = smartbillNewVO.getTxtSupComRegNo() + smartbillNewVO.getTxtByrComRegNo() + smartbillNewVO.getTxtDate() + newWord + "003";
		String Message_id = "Smartbill-Nonsap-" + Batchid + newWord;

		smartbillNewVO.setConversationId(Conversation_id);
		smartbillNewVO.setMessageid(Message_id);
		smartbillNewVO.setDtiGubun("DTT");
		smartbillNewVO.setTxtSupbuy_type("AR");
		smartbillNewVO.setTxtDirection("2");
		smartbillNewVO.setSignal("DETAILARISSUE");

		dao_new.arissueDtt(smartbillNewVO);
	}

	@Override
	public void issue(SmartbillNewVO smartbillNewVO) throws Exception{

		StringBuffer newWord = new SmartbillNewVO().newWord();

		String Conversation_id = smartbillNewVO.getTxtSupComRegNo() + smartbillNewVO.getTxtByrComRegNo() + smartbillNewVO.getTxtDate() + newWord + "003";
		String Message_id = "Smartbill-Nonsap-" + Batchid + newWord;

		smartbillNewVO.setConversationId(Conversation_id);
		smartbillNewVO.setMessageid(Message_id);
		smartbillNewVO.setDtiGubun("DTI");
		smartbillNewVO.setTxtSupbuy_type("AP");
		smartbillNewVO.setTxtDirection("1");
		smartbillNewVO.setSignal("ISSUE");

		dao_new.issue(smartbillNewVO);
	}

	@Override
	public void issueDtt(SmartbillNewVO smartbillNewVO) throws Exception{

		StringBuffer newWord = new SmartbillNewVO().newWord();

		String Conversation_id = smartbillNewVO.getTxtSupComRegNo() + smartbillNewVO.getTxtByrComRegNo() + smartbillNewVO.getTxtDate() + newWord + "003";
		String Message_id = "Smartbill-Nonsap-" + Batchid + newWord;

		smartbillNewVO.setConversationId(Conversation_id);
		smartbillNewVO.setMessageid(Message_id);
		smartbillNewVO.setDtiGubun("DTI");
		smartbillNewVO.setTxtSupbuy_type("AP");
		smartbillNewVO.setTxtDirection("1");
		smartbillNewVO.setSignal("ISSUE");

		dao_new.issueDtt(smartbillNewVO);
	}
}
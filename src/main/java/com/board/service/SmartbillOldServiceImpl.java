package com.board.service;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.board.dao.SmartbillOldDAO;
import com.board.domain.SmartbillOldVO;
import com.board.domain.SmartbillOldCertVO;

import java.util.Date;
import java.util.List;
import java.util.Random;

@Service
public class SmartbillOldServiceImpl implements SmartbillOldService {

	private static final Logger logger = LoggerFactory.getLogger(SmartbillOldServiceImpl.class);

	Long Batchid = new Date().getTime();
	
	//@Resource(name="sqlSessionFactory2")
	
	@Inject
	private SmartbillOldDAO dao;
	
	@Override
	public void arissue(SmartbillOldVO smartbillOldvo) throws Exception{
		
		logger.info("#################### conversationId : " + smartbillOldvo.getConversationId());
		
		    Random random = new Random();
		    int length = random.nextInt(1)+4; //

		    StringBuffer newWord = new StringBuffer();
		    
		    for (int i = 0; i < length; i++) {
		        int choice = random.nextInt(3);
		        switch(choice) {
		            case 0:
		                newWord.append((char)((int)random.nextInt(25)+97));
		                break;
		            case 1:
		                newWord.append((char)((int)random.nextInt(25)+65));
		                break;
		            case 2:
		            	newWord.append((char)((int)random.nextInt(10)+48));
		                break;
		            default:
		                break;
		        }
		    }
		   // System.out.println("newWord = (" + newWord + "), length = " + length);
		
		String Conversation_id = smartbillOldvo.getTxtSupComRegNo() + smartbillOldvo.getTxtByrComRegNo() + smartbillOldvo.getTxtDate() + newWord + "003";
		smartbillOldvo.setConversationId(Conversation_id);
		smartbillOldvo.setTxtBatchId(Batchid);
		smartbillOldvo.setDtiGubun("DTI");
		smartbillOldvo.setTxtSupbuy_type("AR");
		smartbillOldvo.setTxtDirection("2");
		
		logger.info("#################### conversationId : " + smartbillOldvo.getConversationId());
		dao.arissue(smartbillOldvo);
				
	}
	
	@Override
	public void issue(SmartbillOldVO smartbillOldvo) throws Exception{
		
		logger.info("#################### conversationId : " + smartbillOldvo.getConversationId());
		
		    Random random = new Random();
		    int length = random.nextInt(1)+4; //

		    StringBuffer newWord = new StringBuffer();
		    
		    for (int i = 0; i < length; i++) {
		        int choice = random.nextInt(3);
		        switch(choice) {
		            case 0:
		                newWord.append((char)((int)random.nextInt(25)+97));
		                break;
		            case 1:
		                newWord.append((char)((int)random.nextInt(25)+65));
		                break;
		            case 2:
		            	newWord.append((char)((int)random.nextInt(10)+48));
		                break;
		            default:
		                break;
		        }
		    }
		   // System.out.println("newWord = (" + newWord + "), length = " + length);
		
		String Conversation_id = smartbillOldvo.getTxtSupComRegNo() + smartbillOldvo.getTxtByrComRegNo() + smartbillOldvo.getTxtDate() + newWord + "003";
		smartbillOldvo.setConversationId(Conversation_id);
		smartbillOldvo.setTxtBatchId(Batchid);
		smartbillOldvo.setDtiGubun("DTI");
		smartbillOldvo.setTxtSupbuy_type("AP");
		smartbillOldvo.setTxtDirection("1");
		
		logger.info("#################### conversationId : " + smartbillOldvo.getConversationId());
		dao.issue(smartbillOldvo);
				
	}

	@Override
	public void arissueDtt(SmartbillOldVO smartbillOldvo) throws Exception{
		
		//logger.info("#################### conversationId : " + smartbillOldvo.getConversationId());
		
		    Random random = new Random();
		    int length = random.nextInt(1)+4; //

		    StringBuffer newWord = new StringBuffer();
		    
		    for (int i = 0; i < length; i++) {
		        int choice = random.nextInt(3);
		        switch(choice) {
		            case 0:
		                newWord.append((char)((int)random.nextInt(25)+97));
		                break;
		            case 1:
		                newWord.append((char)((int)random.nextInt(25)+65));
		                break;
		            case 2:
		            	newWord.append((char)((int)random.nextInt(10)+48));
		                break;
		            default:
		                break;
		        }
		    }
		   // System.out.println("newWord = (" + newWord + "), length = " + length);
		
		String Conversation_id = smartbillOldvo.getTxtSupComRegNo() + smartbillOldvo.getTxtByrComRegNo() + smartbillOldvo.getTxtDate() + newWord + "003";
		smartbillOldvo.setConversationId(Conversation_id);
		smartbillOldvo.setTxtBatchId(Batchid);
		smartbillOldvo.setDtiGubun("DTT");
		smartbillOldvo.setTxtSupbuy_type("AR");
		smartbillOldvo.setTxtDirection("2");

		logger.info("#################### Dtigubun : " + smartbillOldvo.getDtiGubun());
		logger.info("#################### conversationId : " + smartbillOldvo.getConversationId());
		dao.arissueDtt(smartbillOldvo);
	}

	@Override
	public List<SmartbillOldVO> list(SmartbillOldVO smartbillOldVO) throws Exception {

		return dao.list(smartbillOldVO);
	}

	/*
	 * 세금계산서 view
	 */
	@Override
	public SmartbillOldVO view(String conversationid) throws Exception {
		return dao.view(conversationid);
	}

	@Override
	public SmartbillOldVO status(String conversationid) throws Exception {
		return dao.status(conversationid);
	}

	/*
	 * 세금계산서 상태 변경
	 */
	@Override
	public SmartbillOldVO statusChange(SmartbillOldVO smartbillOldVO) throws Exception{

		smartbillOldVO.setTxtBatchId(Batchid);
		dao.statusChange(smartbillOldVO);

		return smartbillOldVO;
	}

	// 미사용 controller에서 처리
    /*@Override
    public SmartbillOldVO statusSelect(String statuschange, SmartbillOldVO smartbillOldVO) throws Exception{

	    if("세금계산서발행취소".equals(statuschange)){
            smartbillOldVO.setDtiStatus("O");
        }

	    return smartbillOldVO;

    }*/

	/*
	 * 인증서 리스트 조회
	 */
	@Override
	public List<SmartbillOldCertVO>	certList(SmartbillOldCertVO smartbillOldCertVO) throws Exception{

		return dao.certList(smartbillOldCertVO);
	}
}
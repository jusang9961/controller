package com.board.service;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.board.dao.SmartbillOldDAO;
import com.board.domain.SmartbillOldVO;

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

		logger.info("#################### Dtigubun : " + smartbillOldvo.getDtiGubun());
		logger.info("#################### conversationId : " + smartbillOldvo.getConversationId());
		dao.arissueDtt(smartbillOldvo);
	}

	@Override
	public List<SmartbillOldVO> list() throws Exception {

		return dao.list();
	}


}
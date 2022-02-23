package com.board.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.Date;

@Service
public class SmartbillNewServiceImpl implements SmartbillNewService {

	private static final Logger logger = LoggerFactory.getLogger(SmartbillNewServiceImpl.class);

	Long Batchid = new Date().getTime();
	
	//@Resource(name="sqlSessionFactory2")


}
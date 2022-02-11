package com.board.service;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.board.dao.BoardDAO;
import com.board.dao.BoardDAOImpl;
import com.board.domain.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	//@Resource(name="sqlSessionFactory")
	
	@Inject
	private BoardDAO dao;

	@Override
	public List list() throws Exception {

		return dao.list();
	}

	@Override
	public void write(BoardVO vo) throws Exception {
		
		dao.write(vo);
	}

	@Override
	public BoardVO view(int bno) throws Exception {
		logger.info("########  BoardServiceImpl.view #######");
		return dao.view(bno);
	}

	@Override
	public void modify(BoardVO vo) throws Exception{
		dao.modify(vo);
	}
	
	@Override
	public void delete(int bno) throws Exception{
		dao.delete(bno);
	}
}
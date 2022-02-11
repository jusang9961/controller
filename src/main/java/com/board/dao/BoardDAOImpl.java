package com.board.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	private static final Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class);
	
	@Autowired
	@Resource(name="sqlSession")
	
	@Inject
	private SqlSession sql;

	private static String namespace = "com.board.mappers.board";

	// 게시물 목록
	@Override
	public List list() throws Exception { 

		return sql.selectList(namespace + ".list");
	}

	@Override
	public void write(BoardVO vo) throws Exception {

		sql.insert(namespace + ".write", vo);
		
	}

	@Override
	public BoardVO view(int bno) throws Exception {
		// TODO Auto-generated method stub
				
		return sql.selectOne(namespace + ".view", bno);
	}
	
	@Override
	public void modify(BoardVO vo) throws Exception {
		sql.update(namespace + ".modify", vo);
	}

	@Override
	public void delete(int bno) throws Exception{
		sql.delete(namespace + ".delete", bno);
	}
}
package com.project.cat.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cat.board.model.dao.BoardDao;
import com.project.cat.board.model.vo.Board;
import com.project.cat.common.Paging;
import com.project.cat.common.SearchDate;


@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public ArrayList<Board> selectTop3() {
		return boardDao.selectTop3();
	}

	@Override
	public int selectListCount() {
		return boardDao.selectListCount();
	}

	@Override
	public ArrayList<Board> selectList(Paging page) {
		return boardDao.selectList(page);
	}

	@Override
	public Board selectBoard(int board_no) {
		return boardDao.selectBoard(board_no);
	}

	@Override
	public int updateAddReadcount(int board_no) {
		return boardDao.updateAddReadcount(board_no);
	}

	@Override
	public int insertOriginBoard(Board board) {
		return boardDao.insertOriginBoard(board);
	}

	@Override
	public int updateOrigin(Board board) {
		return boardDao.updateOrigin(board);
	}

	@Override
	public int deleteBoard(Board board) {
		return boardDao.deleteBoard(board);
	}

	
	
	@Override
	public ArrayList<Board> selectSearchTitle(String keyword) {
		return boardDao.selectSearchTitle(keyword);
	}

	@Override
	public ArrayList<Board> selectSearchWriter(String keyword) {
		return boardDao.selectSearchWriter(keyword);
	}

	@Override
	public ArrayList<Board> selectSearchDate(SearchDate date) {
		return boardDao.selectSearchDate(date);
	}
	
	
	
	
	
}

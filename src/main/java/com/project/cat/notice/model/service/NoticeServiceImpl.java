package com.project.cat.notice.model.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.project.cat.common.Paging;
import com.project.cat.common.SearchDate;
import com.project.cat.notice.model.dao.NoticeDao;
import com.project.cat.notice.model.vo.Notice;


@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public ArrayList<Notice> selectTop3() {
		return noticeDao.selectTop3();
	}

	//총 게시글 갯수 조회용 (페이지 수 계산용)
	@Override
	public int selectListCount() {
		return noticeDao.selectListCount();
	}

	//한 페이지에 출력할 게시글 조회용
	@Override
	public ArrayList<Notice> selectList(Paging page) {
		return noticeDao.selectList(page);
	}

	//해당 번호에 대한 게시글 상세 조회용
	@Override
	public Notice selectNotice(int notice_no) {
		return noticeDao.selectNotice(notice_no);
	}


	//원글 등록용
	@Override
	public int insertNotice(Notice notice) {
		return noticeDao.insertNotice(notice);
	}

	//원글 수정용
	@Override
	public int updateNotice(Notice notice) {
		return noticeDao.updateNotice(notice);
	}

	//게시글 삭제용
	@Override
	public int deleteNotice(int notice_no) {
		return noticeDao.deleteNotice(notice_no);
	}

	
	//제목으로 검색
	@Override
	public ArrayList<Notice> selectSearchTitle(String keyword) {
		return noticeDao.selectSearchTitle(keyword);
	}
	
	//제목으로 검색 갯수 카운트
	@Override
	public int selectWriterCount() {
		return noticeDao.selectWriterCount();
	}
	
	//작성자로 검색
	@Override
	public ArrayList<Notice> selectSearchWriter(String keyword) {
		return noticeDao.selectSearchWriter(keyword);
	}

	//날짜로 검색
	@Override
	public ArrayList<Notice> selectSearchDate(SearchDate date) {
		return noticeDao.selectSearchDate(date);
	}
	
	
	
	
	
}

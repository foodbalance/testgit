package com.project.cat.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.project.cat.common.Paging;
import com.project.cat.common.SearchDate;
import com.project.cat.notice.model.vo.Notice;


@Repository("noticeDao")
public class NoticeDao {

	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<Notice> selectTop3() {
		List<Notice> list = session.selectList("noticeMapper.selectTop3");
		return (ArrayList<Notice>)list;
	}

	//총 게시글 갯수 조회 (페이지 수 계산)
	public int selectListCount() {
		return session.selectOne("noticeMapper.getListCount");
	}
	
	//한 페이지에 출력할 게시글 조회
	public ArrayList<Notice> selectList(Paging page) {
		List<Notice> list = session.selectList("noticeMapper.selectList", page);
		return (ArrayList<Notice>)list;
	}
	
	//해당 번호에 대한 게시글 상세 조회
	public Notice selectNotice(int notice_no) {
		return session.selectOne("noticeMapper.selectNotice", notice_no);
	}


	//게시글 등록
	public int insertNotice(Notice notice) {
		return session.insert("noticeMapper.insertNotice", notice);
	}

	//게시글 수정
	public int updateNotice(Notice notice) {
		return session.update("noticeMapper.updateNotice", notice);
	}

	//게시글 삭제
	public int deleteNotice(int notice_no) {
		return session.delete("noticeMapper.deleteNotice", notice_no);
	}

	//제목 검색
	public ArrayList<Notice> selectSearchTitle(String keyword) {
		List<Notice> list = session.selectList("noticeMapper.searchTitle", keyword);
		return (ArrayList<Notice>)list;
	}
	
	//제목 검색 글 갯수
	public int selectWriterCount() {
		return session.selectOne("noticeMapper.getTitleCount");
	}

	public ArrayList<Notice> selectSearchWriter(String keyword) {
		List<Notice> list = session.selectList("noticeMapper.searchWriter", keyword);
		return (ArrayList<Notice>)list;
	}

	public ArrayList<Notice> selectSearchDate(SearchDate date) {
		List<Notice> list = session.selectList("noticeMapper.searchDate", date);
		return (ArrayList<Notice>)list;
	}


}

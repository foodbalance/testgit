package com.project.cat.notice.model.service;

import java.util.ArrayList;

import com.project.cat.common.Paging;
import com.project.cat.common.SearchDate;
import com.project.cat.notice.model.vo.Notice;


public interface NoticeService {
	ArrayList<Notice> selectTop3();
	int selectListCount();  //총 게시글 갯수 조회용 (페이지 수 계산용)
	ArrayList<Notice> selectList(Paging page); //한 페이지에 출력할 게시글 조회용
	Notice selectNotice(int notice_no); //해당 번호에 대한 게시글 상세 조회용
	int insertNotice(Notice notice); //원글 등록용
	int updateNotice(Notice notice);  //원글 수정용
	int deleteNotice(int notice_no);  //게시글 삭제용
	
	ArrayList<Notice> selectSearchTitle(String keyword);//제목으로 검색
	int selectWriterCount();//제목으로 검색 갯수 카운트
	ArrayList<Notice> selectSearchWriter(String keyword);//작성자로 검색
	ArrayList<Notice> selectSearchDate(SearchDate date);//날짜로 검색
	
}

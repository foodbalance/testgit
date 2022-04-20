package com.project.cat.notice.model.vo;

import java.sql.Date;

public class Notice implements java.io.Serializable{

	private static final long serialVersionUID = 1173797857403851614L;
	
	private int notice_no;			//공지글 번호
	private String user_id;			//관리자 아이디
	private String notice_title;	//공지 제목
	private String notice_content;	//공지 내용
	private Date notice_date;		//등록 날짜
	private int notice_count;		//조회수
	
	public Notice() {}

	public Notice(int notice_no, String user_id, String notice_title, String notice_content, Date notice_date,
			int notice_count) {
		super();
		this.notice_no = notice_no;
		this.user_id = user_id;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.notice_count = notice_count;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public int getNotice_count() {
		return notice_count;
	}

	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Notice [notice_no=" + notice_no + ", user_id=" + user_id + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", notice_date=" + notice_date + ", notice_count="
				+ notice_count + "]";
	}
	
	
}

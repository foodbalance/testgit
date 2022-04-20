package com.project.cat.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable{

	private static final long serialVersionUID = -6602576309112821338L;
	
	private int board_no;				//게시글 번호
	private String user_id;				//작성자 아이디
	private String board_title;			//게시글 제목
	private String board_content;		//게시글 내용
	private Date board_date;			//게시글 등록 날짜
	private int board_readcount;		//게시글 조회수
	private String board_original_img;	//게시글 등록 이미지 파일명
	private String board_rename_img;	//게시글 변경 이미지 파일명
	public Board() {
		super();
	}
	public Board(int board_no, String user_id, String board_title, String board_content, Date board_date,
			int board_readcount, String board_original_img, String board_rename_img) {
		super();
		this.board_no = board_no;
		this.user_id = user_id;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_readcount = board_readcount;
		this.board_original_img = board_original_img;
		this.board_rename_img = board_rename_img;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public int getBoard_readcount() {
		return board_readcount;
	}
	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}
	public String getBoard_original_img() {
		return board_original_img;
	}
	public void setBoard_original_img(String board_original_img) {
		this.board_original_img = board_original_img;
	}
	public String getBoard_rename_img() {
		return board_rename_img;
	}
	public void setBoard_rename_img(String board_rename_img) {
		this.board_rename_img = board_rename_img;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Board [board_no=" + board_no + ", user_id=" + user_id + ", board_title=" + board_title
				+ ", board_content=" + board_content + ", board_date=" + board_date + ", board_readcount="
				+ board_readcount + ", board_original_img=" + board_original_img + ", board_rename_img="
				+ board_rename_img + "]";
	}

	
	
}

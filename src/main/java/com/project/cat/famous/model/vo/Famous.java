package com.project.cat.famous.model.vo;

public class Famous implements java.io.Serializable{
	private static final long serialVersionUID = 5581703744157938203L;
	
	private String user_id;  //관리자 아이디(작성자)
	private int register_num;  //등록 글 번호
	private String cat_original_img;  //고양이 이미지(자료) 등록 파일명
	private String cat_rename_img;  //고양이 이미지(자료) 변경 파일명
	private String cat_name;  //고양이 이름
	private String cat_explain;  //고양이 설명
	
	public Famous() {}

	public Famous(String user_id, int register_num, String cat_original_img, String cat_rename_img, String cat_name,
			String cat_explain) {
		super();
		this.user_id = user_id;
		this.register_num = register_num;
		this.cat_original_img = cat_original_img;
		this.cat_rename_img = cat_rename_img;
		this.cat_name = cat_name;
		this.cat_explain = cat_explain;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getRegister_num() {
		return register_num;
	}

	public void setRegister_num(int register_num) {
		this.register_num = register_num;
	}

	public String getCat_original_img() {
		return cat_original_img;
	}

	public void setCat_original_img(String cat_original_img) {
		this.cat_original_img = cat_original_img;
	}

	public String getCat_rename_img() {
		return cat_rename_img;
	}

	public void setCat_rename_img(String cat_rename_img) {
		this.cat_rename_img = cat_rename_img;
	}

	public String getCat_name() {
		return cat_name;
	}

	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}

	public String getCat_explain() {
		return cat_explain;
	}

	public void setCat_explain(String cat_explain) {
		this.cat_explain = cat_explain;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Famous [user_id=" + user_id + ", register_num=" + register_num + ", cat_original_img="
				+ cat_original_img + ", cat_rename_img=" + cat_rename_img + ", cat_name=" + cat_name + ", cat_explain="
				+ cat_explain + "]";
	}

	
	
}
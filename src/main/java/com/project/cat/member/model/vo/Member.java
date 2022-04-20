package com.project.cat.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{
	
	private static final long serialVersionUID = -1513523630L;
	
	private String user_id;
	private String user_pwd;
	private String user_name;
	private java.sql.Date user_birth;
	private String phone;
	private String address;
	private String keyword;
	private String admin_ok;
	private String login_ok;
	private int login_stack;
	private String postcode;
	private String address1;
	private String address2;
	public Member() {
		super();
	}
	public Member(String user_id, String user_pwd, String user_name, Date user_birth, String phone, String address,
			String keyword, String admin_ok, String login_ok, int login_stack, String postcode, String address1,
			String address2) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_birth = user_birth;
		this.phone = phone;
		this.address = address;
		this.keyword = keyword;
		this.admin_ok = admin_ok;
		this.login_ok = login_ok;
		this.login_stack = login_stack;
		this.postcode = postcode;
		this.address1 = address1;
		this.address2 = address2;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public java.sql.Date getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(java.sql.Date user_birth) {
		this.user_birth = user_birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getAdmin_ok() {
		return admin_ok;
	}
	public void setAdmin_ok(String admin_ok) {
		this.admin_ok = admin_ok;
	}
	public String getLogin_ok() {
		return login_ok;
	}
	public void setLogin_ok(String login_ok) {
		this.login_ok = login_ok;
	}
	public int getLogin_stack() {
		return login_stack;
	}
	public void setLogin_stack(int login_stack) {
		this.login_stack = login_stack;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	






}

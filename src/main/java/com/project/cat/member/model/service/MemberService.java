package com.project.cat.member.model.service;

import java.util.ArrayList;

import com.project.cat.common.Paging;
import com.project.cat.member.model.vo.Member;

public interface MemberService {
	Member selectLogin(String userid);
	int updateLoginOk(Member member);
	int updateLoginStack(Member member);
	int updatePwdEncoding(Member member);
	int insertMember(Member member);
	int selectDupCheckId(String user_id);	//회원가입시 아이디 중복 체크
	Member selectMember(String user_id);
	int findPwd(Member member);
	int updateMember(Member member);
	int deleteMember(String user_id);	
	ArrayList<Member> selectSearchUserid(String keyword);
	ArrayList<Member> selectSearchLoginOk(Paging page);
	ArrayList<Member> selectList(Paging page);
	int selectListCount();
	int searchListCount(String keyword);
	ArrayList<Member> searchId(Paging paging);
	int searchOkListCount(String keyword);
	
}

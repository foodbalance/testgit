package com.project.cat.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cat.common.Paging;
import com.project.cat.member.model.dao.MemberDao;
import com.project.cat.member.model.vo.Member;



@Service("memberService")  //xml 에 자동 등록됨
public class MemberServiceImpl implements MemberService {
	@Autowired  //자동 의존성주입 처리됨 (자동 객체생성됨)
	private MemberDao memberDao;
	
	@Override
	public Member selectLogin(String userid) {
		return memberDao.selectLogin(userid);
	}
	
	@Override
	public int updatePwdEncoding(Member member) {
		return memberDao.updatePwdEncoding(member);
	}
	
	@Override
	public int updateLoginOk(Member member) {
		return memberDao.updateLoginOk(member);
	}
	
	@Override
	public int updateLoginStack(Member member) {
		return memberDao.updateLoginStack(member);
	}
	
	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}

	@Override
	public int selectDupCheckId(String user_id) {
		return memberDao.selectDupCheckId(user_id);
	}

	@Override
	public Member selectMember(String user_id) {
		return memberDao.selectMember(user_id);
	}

	@Override
	public int findPwd(Member member) {
		return memberDao.findPwd(member);
	}

	@Override
	public int updateMember(Member member) {
		return memberDao.updateMember(member);
	}

	@Override
	public int deleteMember(String user_id) {
		return memberDao.deleteMember(user_id);
		
	}

	@Override
	public ArrayList<Member> selectSearchUserid(String keyword) {
		return memberDao.selectSearchUserid(keyword);
	}

	@Override
	public ArrayList<Member> selectSearchLoginOk(Paging page) {
		return memberDao.selectSearchLoginOk(page);
	}

	@Override
	public ArrayList<Member> selectList(Paging page) {
		return memberDao.selectList(page);
	}

	@Override
	public int selectListCount() {
		return memberDao.selectListCount();
	}

	@Override
	public int searchListCount(String keyword) {
		return memberDao.searchLsitCount(keyword);
	}

	@Override
	public ArrayList<Member> searchId(Paging page) {
		return memberDao.searchId(page);
	}

	@Override
	public int searchOkListCount(String keyword) {
		return memberDao.searchOkListCount(keyword);
	}






}

package com.project.cat.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cat.common.Paging;
import com.project.cat.member.model.vo.Member;



@Repository("memberDao")
public class MemberDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public MemberDao() {}
	
	public Member selectLogin(String userid) {
		return session.selectOne("memberMapper.selectLogin", userid);
	}
	
	public int updatePwdEncoding(Member member) {
		return session.update("memberMapper.updatePwdEncoding", member);
	}
	
	public int updateLoginOk(Member member) {
		return session.update("memberMapper.updateLoginOk", member);
	}
	
	public int updateLoginStack(Member member) {
		return session.update("memberMapper.updateLoginStack", member);
	}
	
	public int insertMember(Member member) {
		return session.insert("memberMapper.insertMember", member);
	}

	public int selectDupCheckId(String user_id) {
		return session.selectOne("memberMapper.selectCheckId", user_id);
	}

	public Member selectMember(String user_id) {
		return session.selectOne("memberMapper.selectMember", user_id);
	}

	public int findPwd(Member member) {
		return session.update("memberMapper.findPwd", member);
	}

	public int updateMember(Member member) {
		return session.update("memberMapper.updateMember", member);
	}

	public int deleteMember(String user_id) {
		return session.delete("memberMapper.deleteMember", user_id);
	}

	public ArrayList<Member> selectList(Paging page) {
		List<Member> list = session.selectList("memberMapper.selectList", page);
		return (ArrayList<Member>)list;
	}

	public ArrayList<Member> selectSearchUserid(String keyword) {
		List<Member> list = session.selectList("memberMapper.selectSearchUserid", keyword);
		return (ArrayList<Member>)list;
	}

	public ArrayList<Member> selectSearchLoginOk(Paging page) {
		List<Member> list =session.selectList("memberMapper.selectSearchLoginOk", page);
		return (ArrayList<Member>)list;
	}

	public int selectListCount() {
		return session.selectOne("memberMapper.getListCount");
	}

	public int searchLsitCount(String keyword) {
		return session.selectOne("memberMapper.searchListCount", keyword);
	}

	public ArrayList<Member> searchId(Paging page) {
		List<Member> list = session.selectList("memberMapper.searchId", page);
		return (ArrayList<Member>)list;
	}

	public int searchOkListCount(String keyword) {
		return session.selectOne("memberMapper.searchOkListCount", keyword);
	}
}

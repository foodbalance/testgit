package com.project.cat.measure.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cat.measure.model.vo.CatProfile;


@Repository("catprofile")
public class CatProfileDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public CatProfileDao() {}
	
	public int insertCatProfile(CatProfile catprofile) {
		return session.insert("catprofileMapper.insertCatProfile", catprofile);
	}
	
	public int selectCatOneCount(CatProfile catprofile) {
		return session.selectOne("catprofileMapper.selectCatOneCount", catprofile);
	}

}

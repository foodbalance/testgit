package com.project.cat.measure.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cat.measure.model.dao.CatProfileDao;
import com.project.cat.measure.model.vo.CatProfile;

@Service("catprofileService")
public class CatProfileServiceImpl implements CatProfileService{
	@Autowired
	private CatProfileDao catprofileDao;
	
	@Override
	public int insertCatProfile(CatProfile catprofile) {
		return catprofileDao.insertCatProfile(catprofile);
	}
	
	public int selectCatOneCount(CatProfile catprofile) {
		return catprofileDao.selectCatOneCount(catprofile);
	}
}

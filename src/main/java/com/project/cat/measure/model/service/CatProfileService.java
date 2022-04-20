package com.project.cat.measure.model.service;

import com.project.cat.measure.model.vo.CatProfile;

public interface CatProfileService {
	int insertCatProfile(CatProfile catprofile);
	int selectCatOneCount(CatProfile catprofile);
}

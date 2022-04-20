package com.project.cat.famous.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cat.common.Paging;
import com.project.cat.famous.model.dao.FamousDao;
import com.project.cat.famous.model.vo.Famous;

@Service("famousService")
public class FamousServiceImpl implements FamousService{
	
	@Autowired
	private FamousDao famousDao;

	@Override
	public int selectListCount() {
		return famousDao.selectListCount();
	}

	@Override
	public ArrayList<Famous> selectList(Paging page) {
		return famousDao.selectList(page);
	}

	@Override
	public Famous selectFamous(int register_num) {
		return famousDao.selectFamous(register_num);
	}

	@Override
	public int insertOriginFamous(Famous famous) {
		return famousDao.insertOriginFamous(famous);
	}

	@Override
	public int updateOriginFamous(Famous famous) {
		return famousDao.updateOriginFamous(famous);
	}

	@Override
	public int deleteFamous(Famous famous) {
		return famousDao.deleteFamous(famous);
	}

	@Override
	public int insertImage(Famous cat_original_img) {
		return famousDao.insertImage(cat_original_img);
	}

	@Override
	public int updateImage(Famous cat_rename_img) {
		return famousDao.updateImage(cat_rename_img);
	}
	
	
}

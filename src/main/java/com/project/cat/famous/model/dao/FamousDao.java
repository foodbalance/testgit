package com.project.cat.famous.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cat.common.Paging;
import com.project.cat.famous.model.vo.Famous;

@Repository("famousDao")
public class FamousDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public FamousDao() {}
	
	public int selectListCount() {
		return session.selectOne("famousMapper.getListCount");
	}
	
	public ArrayList<Famous> selectList(Paging page) {
		List<Famous> list = session.selectList("famousMapper.selectList", page);
		return(ArrayList<Famous>)list;
	}

	public Famous selectFamous(int register_num) {
		return session.selectOne("famousMapper.selectFamous", register_num);
	}

	public int insertOriginFamous(Famous famous) {
		return session.insert("famousMapper.insertOriginFamous", famous);
	}

	public int updateOriginFamous(Famous famous) {
		return session.update("famousMapper.updateOriginFamous", famous);
	}

	public int deleteFamous(Famous famous) {
		return session.delete("famousMapper.deleteFamous", famous);
	}

	public int insertImage(Famous cat_original_img) {
		return session.insert("famousMapper.insertImage", cat_original_img);
	}

	public int updateImage(Famous cat_rename_img) {
		return session.update("famousMapper.updateImage", cat_rename_img);
	}
	
}
package com.project.cat.famous.model.service;

import java.util.ArrayList;

import com.project.cat.common.Paging;
import com.project.cat.famous.model.vo.Famous;

public interface FamousService {
	int selectListCount();  //총 개시글 갯수 조회용 (페이지 수 계산 목적)
	ArrayList<Famous> selectList(Paging page);   //한 페이지에 출력할 게시글 조회용
	Famous selectFamous(int register_num);  //해당 번호에 대한 게시글 상세 조회
	int insertOriginFamous(Famous famous);  //원글 등록용
	int insertImage(Famous cat_original_img);  //고양이 이미지(자료) 등록용
	int updateOriginFamous(Famous famous);  //원글 수정용
	int updateImage(Famous cat_rename_img);  //고양이 이미지(자료) 수정용
	int deleteFamous(Famous famous);  //게시글 삭제용
}

package com.wework.workman.hunamResource.model.service;

import java.util.ArrayList;

import com.wework.workman.hunamResource.model.vo.Dept;
import com.wework.workman.hunamResource.model.vo.Modal;

public interface HumanResourceService {
	
	// 공지사항 중 인사(301) 관련 공지사항 갯수 조회
	int gethListCount();
	
	// modal dept리스트 불러오기
		ArrayList<Dept> selectModaDeptlList();
	// modal emp리스트 불러오기
	ArrayList<Modal> selectModalEmpList();

}

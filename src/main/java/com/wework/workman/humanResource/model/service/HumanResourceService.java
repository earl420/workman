package com.wework.workman.humanResource.model.service;

import java.util.ArrayList;

import com.wework.workman.common.PageInfo;
import com.wework.workman.humanResource.model.vo.Notice;

public interface HumanResourceService {
	
	// 공지사항 중 인사(301) 관련 공지사항 갯수 조회
	int gethListCount();
	
	// 공지사항 중 인사(301) 관련 공지사항 리스트 조회
	ArrayList<Notice> selecthList(PageInfo pi);

}

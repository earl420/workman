package com.wework.workman.mypage.model.service;

import java.util.ArrayList;

import com.wework.workman.common.PageInfo;
import com.wework.workman.mypage.model.vo.EmpList;
import com.wework.workman.mypage.model.vo.Mypage;

public interface MypageService {

	// 로그인 메소드
	Mypage loginMan(Mypage m);

	// 정보 수정
	int empUpdate(Mypage m);
	
	// 비번 수정
	int pwdUpdate(Mypage m);

	// 비번 찾기
	Mypage findPwd(Mypage m);

	// 새로운 비번
	int returnPwd(Mypage m);

	// 총 직원 수
	int empCount();
	
	// 총 직원 리스트
	ArrayList<EmpList> empList(PageInfo pi);

	// 검색한 직원 수
	int searchCount(String emp);

	// 검색한 직원
	ArrayList<EmpList> empSearch(String emp, PageInfo pi);


}

package com.wework.workman.mypage.model.service;

import com.wework.workman.hunamResource.model.vo.HumanResource;
import com.wework.workman.mypage.model.vo.Employee;

public interface MypageService {

	// 로그인 메소드
	HumanResource loginMan(Employee m);

}

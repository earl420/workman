package com.wework.workman.mypage.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wework.workman.common.PageInfo;
//import com.wework.workman.hunamResource.model.vo.HumanResource;
import com.wework.workman.mypage.model.dao.MypageDao;
import com.wework.workman.mypage.model.vo.EmpList;
import com.wework.workman.mypage.model.vo.Mypage;

//@Service("mypageService")
@Service("mService")
public class MypageServiceImpl implements MypageService{
	
	
	@Autowired
	private MypageDao mDao;


	/**
	 * 로그인
	 */
	@Override
	public Mypage loginMan(Mypage m) {
		return mDao.loginMan(m);
	}


	/**
	 * 정보수정
	 */
	@Override
	public int empUpdate(Mypage m) {
		return mDao.empUpdate(m);
	}


	/**
	 * 비번 변경
	 */
	@Override
	public int pwdUpdate(Mypage m) {
		return mDao.pwdUpdate(m);
	}


	/**
	 * 비번 찾기
	 */
	@Override
	public Mypage findPwd(Mypage m) {
		return mDao.findPwd(m);
	}


	/**
	 * 새로운 비번
	 */
	@Override
	public int returnPwd(Mypage m) {
		return mDao.returnPwd(m);
	}

	
	/**
	 * 총 직원 수
	 */
	@Override
	public int empCount() {
		return mDao.empCount();
	}


	/**
	 * 총 직원 리스트
	 */
	@Override
	public ArrayList<EmpList> empList(PageInfo pi) {
		return mDao.empList(pi);
	}


	/**
	 * 검색한 직원 수
	 */
	@Override
	public int searchCount(String emp) {
		return mDao.searchCount(emp);
	}

	/**
	 * 검색한 직원
	 */
	@Override
	public ArrayList<EmpList> empSearch(String emp, PageInfo pi) {
		return mDao.empSearch(emp, pi);
	}



	
}

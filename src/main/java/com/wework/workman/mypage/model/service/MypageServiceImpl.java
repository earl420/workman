package com.wework.workman.mypage.model.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wework.workman.hunamResource.model.vo.HumanResource;
import com.wework.workman.mypage.model.dao.MypageDao;
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

	
}

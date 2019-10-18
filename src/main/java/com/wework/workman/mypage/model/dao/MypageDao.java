package com.wework.workman.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.mypage.model.vo.Mypage;

@Repository("mypageDao")

public class MypageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 로그인
	 * @param m
	 * @return
	 */
	public Mypage loginMan(Mypage m) {
		System.out.println(m.getNum());
		return sqlSession.selectOne("mypageMapper.loginMan", m);
	}
}

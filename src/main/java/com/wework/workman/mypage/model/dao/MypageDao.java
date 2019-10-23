package com.wework.workman.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.mypage.model.vo.Mypage;

//@Repository("mypageDao")
@Repository("mDao")

public class MypageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 로그인
	 * @param m
	 * @return
	 */
	public Mypage loginMan(Mypage m) {
		return sqlSession.selectOne("mypageMapper.loginMan", m);
	}

	
	/**
	 * 정보 수정
	 * @param m
	 * @return
	 */
	public int empUpdate(Mypage m) {
		return sqlSession.update("mypageMapper.empUpdate", m);
	}


	/**
	 * 비밀번호 수정
	 * @param m
	 * @return
	 */
	public int pwdUpdate(Mypage m) {
		return sqlSession.update("mypageMapper.pwdUpdate", m);
	}
}

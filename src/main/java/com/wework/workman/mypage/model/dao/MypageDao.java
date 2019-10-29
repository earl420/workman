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
	 * 비번 수정
	 * @param m
	 * @return
	 */
	public int pwdUpdate(Mypage m) {
		return sqlSession.update("mypageMapper.pwdUpdate", m);
	}


	/**
	 * 비번 찾기
	 * @param m
	 * @return
	 */
	public Mypage findPwd(Mypage m) {
		return sqlSession.selectOne("mypageMapper.findPwd", m);
	}

	/**
	 * 새로운 비번
	 * @param m
	 * @return
	 */
	public int returnPwd(Mypage m) {
		return sqlSession.update("mypageMapper.pwdUpdate", m);
	}
}

package com.wework.workman.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.hunamResource.model.vo.HumanResource;

@Repository("mypageDao")
public class MypageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public HumanResource loginMan(HumanResource m) {
		return sqlSession.selectOne("mypage-mapper.loginMan", m);
	}
}

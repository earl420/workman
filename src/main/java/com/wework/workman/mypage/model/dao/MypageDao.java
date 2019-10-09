package com.wework.workman.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mypageDao")
public class MypageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}

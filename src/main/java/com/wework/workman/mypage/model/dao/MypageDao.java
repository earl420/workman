package com.wework.workman.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.hunamResource.model.vo.HumanResource;
import com.wework.workman.mypage.model.vo.Employee;

@Repository("mypageDao")
public class MypageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Employee loginMan(Employee m) {
		return sqlSession.selectOne("mypage-mapper.loginMan", m);
	}
}

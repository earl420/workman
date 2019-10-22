package com.wework.workman.hunamResource.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("humanResourceDao")
public class HumanResourceDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int gethListCount() {
		
		return sqlSession.selectOne("humanMapper.gethListCount");
	}
}

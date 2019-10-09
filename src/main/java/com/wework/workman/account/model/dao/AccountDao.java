package com.wework.workman.account.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("accountDao")
public class AccountDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}

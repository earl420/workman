package com.wework.workman.approval.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("expenseDao")
public class ExpenseDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}

package com.wework.workman.approval.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wework.workman.approval.model.dao.ExpenseDao;

@Service("expenseService")
public class ExpenseServiceImpl implements ExpenseService{
	@Resource(name = "expenseDao")
	private ExpenseDao eDao;
}

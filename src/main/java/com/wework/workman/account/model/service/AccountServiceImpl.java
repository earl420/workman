package com.wework.workman.account.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wework.workman.account.model.dao.AccountDao;

@Service("accountService")
public class AccountServiceImpl implements AccountService{
	@Resource(name="accountDao")
	private AccountDao aDao;
}

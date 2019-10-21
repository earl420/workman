package com.wework.workman.account.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wework.workman.account.model.dao.AccountDao;
import com.wework.workman.account.model.vo.AcNotice;
import com.wework.workman.common.PageInfo;

@Service("accountService")
public class AccountServiceImpl implements AccountService{
	@Resource(name="accountDao")
	private AccountDao aDao;

	@Override
	public int getNoticeListCount(String[] search) {
		return aDao.getNoticeListCount(search);
	}

	@Override
	public ArrayList<AcNotice> noticeList(String[] search, PageInfo pi) {
		return aDao.noticeList(search,pi);
	}

	@Override
	public AcNotice noticeDetail(String aNo) {
		return aDao.noticeDetail(aNo);
	}

	
}

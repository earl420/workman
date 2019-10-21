package com.wework.workman.account.model.service;

import java.util.ArrayList;

import com.wework.workman.account.model.vo.AcNotice;
import com.wework.workman.common.PageInfo;

public interface AccountService {

	int getNoticeListCount(String[] search);

	ArrayList<AcNotice> noticeList(String[] search, PageInfo pi);

	AcNotice noticeDetail(String aNo);
	
}

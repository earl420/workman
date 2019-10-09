package com.wework.workman.approval.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wework.workman.approval.model.dao.DraftDao;

@Service("draftService")
public class DraftServiceImpl implements DraftService{
	@Resource(name = "draftDao")
	private DraftDao dDao;
}

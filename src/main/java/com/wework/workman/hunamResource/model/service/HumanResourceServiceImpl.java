package com.wework.workman.hunamResource.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wework.workman.hunamResource.model.dao.HumanResourceDao;

@Service("humanResourceService")
public class HumanResourceServiceImpl implements HumanResourceService{
	@Resource(name="humanResourceDao")
	private HumanResourceDao hDao;

	@Override
	public int gethListCount() {
		
		return hDao.gethListCount();
	}
	
}
	

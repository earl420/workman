package com.wework.workman.hunamResource.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wework.workman.hunamResource.model.dao.HumanResourceDao;
import com.wework.workman.humanResource.model.vo.*;

@Service("humanResourceService")
public class HumanResourceServiceImpl implements HumanResourceService{
	@Resource(name="humanResourceDao")
	private HumanResourceDao hDao;

	@Override
	public int gethListCount() {
		
		return hDao.gethListCount();
	}

	@Override
	public ArrayList<Dept> selectModaDeptlList() {
		return hDao.selectModaDeptlList();
	}
	
	@Override
	public ArrayList<Modal> selectModalEmpList() {
		return hDao.selectModalEmpList();
	}
	
}
	

package com.wework.workman.approval.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wework.workman.approval.model.dao.ListDao;

@Service("listService")
public class ListServiceImpl implements ListService{
	
	@Autowired
	private ListDao lDao;
	

}

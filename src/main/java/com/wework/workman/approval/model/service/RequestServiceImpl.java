package com.wework.workman.approval.model.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wework.workman.approval.model.dao.RequestDao;

@Service("requestService")
public class RequestServiceImpl implements RequestService{
	
	@Autowired
	private RequestDao rDao;
}

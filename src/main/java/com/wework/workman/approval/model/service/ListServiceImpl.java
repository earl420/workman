package com.wework.workman.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wework.workman.approval.model.dao.ListDao;
import com.wework.workman.approval.model.vo.Doc;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.PageInfo;

@Service("listService")
public class ListServiceImpl implements ListService{
	
	@Autowired
	private ListDao lDao;

	@Override
	public int getallListCount(String userNum) {
		
		return lDao.getallListCount(userNum);
	}

	@Override
	public ArrayList<Doc> docList(PageInfo pi, String userNum) {
		return lDao.docList(pi, userNum); 
	}

	@Override
	public int selectCount(HashMap select) {
		return lDao.selectCount(select);
	}

	@Override
	public ArrayList<Doc> docselectList(PageInfo pi, HashMap select) {
		return lDao.docselectList(pi, select); 
	}

	@Override
	public int approvalListCount(String userNum) {
		return lDao.approvalListCount(userNum);
	}

	@Override
	public ArrayList<Doc> approvalList(PageInfo pi, String userNum) {
		return lDao.approvalList(pi, userNum); 
	}

	@Override
	public int allRequestListCount(String userNum) {
		return lDao.allRequestListCount(userNum);
	}

	@Override
	public ArrayList<Doc> docRequestList(PageInfo pi, String userNum) {
		return lDao.docRequestList(pi, userNum);
	}

	@Override
	public int selectRequestListCount(HashMap select) {
		return lDao.selectRequestListCount(select);
	}

	@Override
	public ArrayList<Doc> docsselectRequestList(PageInfo pi, HashMap select) {
		return lDao.docsselectRequestList(pi, select); 
	}


	

}

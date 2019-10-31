package com.wework.workman.approval.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wework.workman.approval.model.dao.RequestDao;
import com.wework.workman.approval.model.vo.Request;
import com.wework.workman.approval.model.vo.RequestSort;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.ConflrmSort;

@Service("requestService")
public class RequestServiceImpl implements RequestService{
	
	@Autowired
	private RequestDao rDao;

	@Override
	public String insertRequest(Request r, Conflrm c) {
		
		ConflrmSort cs = rDao.insertConflrm(c);
		r.setConfirmNum(cs.getConfirmNum());
		RequestSort rc = rDao.insertRequest(r);
		return rc.getRequestNum();
	}

	@Override
	public int insertFile(Attachment a) {
		return rDao.insertAttachment(a);
	}

	@Override
	public Request selectrequestDetail(String requestNum) {
		return rDao.selectrequestDetail(requestNum);
	}
}

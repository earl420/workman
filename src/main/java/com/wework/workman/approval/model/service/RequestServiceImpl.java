package com.wework.workman.approval.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wework.workman.approval.model.dao.RequestDao;
import com.wework.workman.approval.model.vo.Request;
import com.wework.workman.approval.model.vo.RequestSort;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.ConflrmSort;
import com.wework.workman.common.Reference;

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
	public int insertReference(Reference rf) {
		return rDao.insertReference(rf);
	}

	@Override
	public Request selectRequest(String requestNum) {
		return rDao.selectRequest(requestNum);
	}

	@Override
	public Conflrm selectConflrm(String confirmNum) {
		return rDao.selectConflrm(confirmNum);
	}

	@Override
	public Reference selectReference(String requestNum) {
		return rDao.selectReference(requestNum);
	}

	@Override
	public Attachment selectAttachment(String requestNum) {
		return rDao.selectAttachment(requestNum);
	}
	
	@Override
	public int updateConflrm1(String confirmNum, String docNum) {
		return rDao.updateConflrm1(confirmNum,docNum);
	}

	@Override
	public int updateConflrm2(String confirmNum) {
		return rDao.updateConflrm2(confirmNum);
	}

	@Override
	public int updateConflrm3(String confirmNum) {
		return rDao.updateConflrm3(confirmNum);
	}

	@Override
	public int updateConflrm4(String confirmNum) {
		return rDao.updateConflrm4(confirmNum);
	}

	@Override
	public int insertApproval(String requestNum) {
		return rDao.insertApproval(requestNum);
	}
	
	
}



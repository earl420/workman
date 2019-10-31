package com.wework.workman.approval.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wework.workman.approval.model.dao.DraftDao;
import com.wework.workman.approval.model.vo.Draft;
import com.wework.workman.approval.model.vo.DraftSort;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.ConflrmSort;

@Service("draftService")
public class DraftServiceImpl implements DraftService{
	
	@Autowired
	private DraftDao dDao;

	@Override
	public String insertDraft(Draft d, Conflrm c) {
		
		ConflrmSort cs = dDao.insertConflrm(c);
		System.out.println(cs.getConfirmNum());
		d.setConfirmNum(cs.getConfirmNum());
		DraftSort dc = dDao.insertDraft(d);
		return dc.getDraftNum();
	}

	@Override
	public int insertFile(Attachment a) {
		return dDao.insertAttachment(a);
	}

	@Override
	public Draft selectdraftDetail(String draftNum) {
		return dDao.selectdraftDetail(draftNum);
	}
	
	
}

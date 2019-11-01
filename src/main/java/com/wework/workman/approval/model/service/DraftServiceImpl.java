package com.wework.workman.approval.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wework.workman.approval.model.dao.DraftDao;
import com.wework.workman.approval.model.vo.Draft;
import com.wework.workman.approval.model.vo.DraftSort;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.ConflrmSort;
import com.wework.workman.common.Reference;

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
	public int insertReference(Reference rf) {
		return dDao.insertReference(rf);
	}

	@Override
	public Draft selectDraft(String draftNum) {
		return dDao.selectDraft(draftNum);
	}
	
	@Override
	public Conflrm selectConflrm(String confirmNum) {
		return dDao.selectConflrm(confirmNum);
	}

	@Override
	public Reference selectReference(String draftNum) {
		return dDao.selectReference(draftNum);
	}

	@Override
	public Attachment selectAttachment(String draftNum) {
		return dDao.selectAttachment(draftNum);
	}
	
	
}

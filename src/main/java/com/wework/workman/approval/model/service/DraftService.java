package com.wework.workman.approval.model.service;

import com.wework.workman.approval.model.vo.Draft;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.Reference;

public interface DraftService {
	
	// 기안 문서 등록
	String insertDraft(Draft d, Conflrm c);
	
	// 참조자 등록
	
	int insertReference(Reference rf);
	
	// 파일 등록
	int insertFile(Attachment a);
	
	// 기안 문서 디테일
	Draft selectDraft(String draftNum);
	
	Conflrm selectConflrm(String confirmNum);
	
	Reference selectReference(String draftNum);
	
	Attachment selectAttachment(String draftNum);
	
	int updateConflrm1(String confirmNum, String docNum);
	
	int updateConflrm2(String confirmNum);
	
	int updateConflrm3(String confirmNum);
	
	int updateConflrm4(String confirmNum);
	
	int insertApproval(String draftNum);
	

}

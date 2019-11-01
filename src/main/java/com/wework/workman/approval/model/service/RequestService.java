package com.wework.workman.approval.model.service;

import com.wework.workman.approval.model.vo.Request;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.Reference;

public interface RequestService {
	
	// 품의 문서 등록
	String insertRequest(Request r , Conflrm c);
	
	// 참조자 등록
	int insertReference(Reference rf);
	
	// 파일 등록
	int insertFile(Attachment a);
	
	// 품의 문서 디테일
	Request selectRequest(String requestNum);
	
	Conflrm selectConflrm(String confirmNum);
	
	Reference selectReference(String requestNum);
	
	Attachment selectAttachment(String requestNum);
	

}

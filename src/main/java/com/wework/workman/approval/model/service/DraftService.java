package com.wework.workman.approval.model.service;

import com.wework.workman.approval.model.vo.Draft;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.Conflrm;

public interface DraftService {
	
	// 기안 문서 등록
	String insertDraft(Draft d, Conflrm c);
	
	// 파일 등록
	int insertFile(Attachment a);
	
	// 기안 문서 디테일
	Draft selectdraftDetail(String draftNum);

}

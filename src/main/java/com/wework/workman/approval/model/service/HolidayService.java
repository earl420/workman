package com.wework.workman.approval.model.service;

import com.wework.workman.approval.model.vo.Holiday;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.Reference;

public interface HolidayService {
	
	// 휴가 문서 등록
	String insertHoliday(Holiday h,  Conflrm c);
	
	// 참조자 등록
	int insertReference(Reference rf);
	
	// 파일 등록
	int insertFile(Attachment a);
	
	// 휴가문서 디테일
	Holiday selectHoliday(String holiNum);
	
	Conflrm selectConflrm(String confirmNum);
	
	Reference selectReference(String holiNum);
	
	Attachment selectAttachment(String holiNum);
	
	int updateConflrm1(String confirmNum, String docNum);
	
	int updateConflrm2(String confirmNum);
	
	int updateConflrm3(String confirmNum);
	
	int updateConflrm4(String confirmNum);
	
	int insertApproval(String holiNum);
	
	
	
	
}

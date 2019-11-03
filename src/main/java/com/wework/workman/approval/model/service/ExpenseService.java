package com.wework.workman.approval.model.service;

import com.wework.workman.approval.model.vo.Expense;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.Reference;

public interface ExpenseService {

	// 지출결의서 등록
	String insertExpense(Expense e, Conflrm c);
	
	// 참조자 등록
	int insertReference(Reference rf);
	
	// 파일 등록
	int insertFile(Attachment a);
	
	// 지출결의서 문서 디테일
	Expense selectExpense(String expenseNum);
	
	Conflrm selectConflrm(String confirmNum);
	
	Reference selectReference(String expenseNum);
	
	Attachment selectAttachment(String expenseNum);
	
	int updateConflrm1(String confirmNum, String docNum);
	
	int updateConflrm2(String confirmNum);
	
	int updateConflrm3(String confirmNum);
	
	int updateConflrm4(String confirmNum);
	
	int insertApproval(String expenseNum);
}

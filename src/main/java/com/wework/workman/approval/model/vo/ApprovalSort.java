package com.wework.workman.approval.model.vo;

import java.sql.Date;

public class ApprovalSort {

	private int pNum;					// 최신등록 정렬
	private int rNum;					// 등록 순서 정렬
	private String approvalNum;			// 승인번호
	private String docNum;				// 문서번호
	
	public ApprovalSort() {
	}

	public ApprovalSort(int pNum, int rNum, String approvalNum, String docNum) {
		super();
		this.pNum = pNum;
		this.rNum = rNum;
		this.approvalNum = approvalNum;
		this.docNum = docNum;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public String getApprovalNum() {
		return approvalNum;
	}

	public void setApprovalNum(String approvalNum) {
		this.approvalNum = approvalNum;
	}

	public String getDocNum() {
		return docNum;
	}

	public void setDocNum(String docNum) {
		this.docNum = docNum;
	}

	@Override
	public String toString() {
		return "ApprovalSort [pNum=" + pNum + ", rNum=" + rNum + ", approvalNum=" + approvalNum + ", docNum=" + docNum
				+ "]";
	}

	
	
}

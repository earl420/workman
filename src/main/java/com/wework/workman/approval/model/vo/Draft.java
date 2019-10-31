package com.wework.workman.approval.model.vo;

import java.sql.Date;

public class Draft {
	
	private String draftNum;			// 기안서번호
	private int deptNum;				// 기안부서
	private String empNum;				// 기안자
	private String draftTitle;			// 기안제목
	private String draftContent;		// 기안내용
	private Date draftDate;				// 기안일시
	private String draftStatus;			// 상태      Y :등록시 대기 , N:반려,  P:진행 , C:완료 
	private Date draftComplete;			// 완료일시
	private String approvalNum;			// 승인번호
	private String confirmNum;			// 결제번호
	
	
	public Draft() {
		
	}


	public Draft(String draftNum, int deptNum, String empNum, String draftTitle, String draftContent, Date draftDate,
			String draftStatus, Date draftComplete, String approvalNum, String confirmNum) {
		super();
		this.draftNum = draftNum;
		this.deptNum = deptNum;
		this.empNum = empNum;
		this.draftTitle = draftTitle;
		this.draftContent = draftContent;
		this.draftDate = draftDate;
		this.draftStatus = draftStatus;
		this.draftComplete = draftComplete;
		this.approvalNum = approvalNum;
		this.confirmNum = confirmNum;
	}


	public String getDraftNum() {
		return draftNum;
	}


	public void setDraftNum(String draftNum) {
		this.draftNum = draftNum;
	}


	public int getDeptNum() {
		return deptNum;
	}


	public void setDeptNum(int deptNum) {
		this.deptNum = deptNum;
	}


	public String getEmpNum() {
		return empNum;
	}


	public void setEmpNum(String empNum) {
		this.empNum = empNum;
	}


	public String getDraftTitle() {
		return draftTitle;
	}


	public void setDraftTitle(String draftTitle) {
		this.draftTitle = draftTitle;
	}


	public String getDraftContent() {
		return draftContent;
	}


	public void setDraftContent(String draftContent) {
		this.draftContent = draftContent;
	}


	public Date getDraftDate() {
		return draftDate;
	}


	public void setDraftDate(Date draftDate) {
		this.draftDate = draftDate;
	}


	public String getDraftStatus() {
		return draftStatus;
	}


	public void setDraftStatus(String draftStatus) {
		this.draftStatus = draftStatus;
	}


	public Date getDraftComplete() {
		return draftComplete;
	}


	public void setDraftComplete(Date draftComplete) {
		this.draftComplete = draftComplete;
	}


	public String getApprovalNum() {
		return approvalNum;
	}


	public void setApprovalNum(String approvalNum) {
		this.approvalNum = approvalNum;
	}


	public String getConfirmNum() {
		return confirmNum;
	}


	public void setConfirmNum(String confirmNum) {
		this.confirmNum = confirmNum;
	}


	@Override
	public String toString() {
		return "Draft [draftNum=" + draftNum + ", deptNum=" + deptNum + ", empNum=" + empNum + ", draftTitle="
				+ draftTitle + ", draftContent=" + draftContent + ", draftDate=" + draftDate + ", draftStatus="
				+ draftStatus + ", draftComplete=" + draftComplete + ", approvalNum=" + approvalNum + ", confirmNum="
				+ confirmNum + "]";
	}

	
	
}

package com.wework.workman.approval.model.vo;

import java.sql.Date;

public class Request {
	
	private String requestNum;			// 품의서번호
	private int deptNum;				// 품의부서
	private String empNum;				// 품의자
	private String requestTitle;		// 품의제목
	private String requestContent;		// 품의내용
	private Date requestDate;			// 품의일시
	private String requestStatus;		// 상태	 Y :등록시 대기 , N:반려,  P:진행 , C:완료  
	private Date requestComplete;		// 완료일시
	private String approvalNum;			// 승인번호
	private String confirmNum;			// 결제번호
	
	public Request() {
		
	}

	public Request(String requestNum, int deptNum, String empNum, String requestTitle, String requestContent,
			Date requestDate, String requestStatus, Date requestComplete, String approvalNum, String confirmNum) {
		super();
		this.requestNum = requestNum;
		this.deptNum = deptNum;
		this.empNum = empNum;
		this.requestTitle = requestTitle;
		this.requestContent = requestContent;
		this.requestDate = requestDate;
		this.requestStatus = requestStatus;
		this.requestComplete = requestComplete;
		this.approvalNum = approvalNum;
		this.confirmNum = confirmNum;
	}

	public String getRequestNum() {
		return requestNum;
	}

	public void setRequestNum(String requestNum) {
		this.requestNum = requestNum;
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

	public String getRequestTitle() {
		return requestTitle;
	}

	public void setRequestTitle(String requestTitle) {
		this.requestTitle = requestTitle;
	}

	public String getRequestContent() {
		return requestContent;
	}

	public void setRequestContent(String requestContent) {
		this.requestContent = requestContent;
	}

	public Date getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}

	public String getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}

	public Date getRequestComplete() {
		return requestComplete;
	}

	public void setRequestComplete(Date requestComplete) {
		this.requestComplete = requestComplete;
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
		return "Request [requestNum=" + requestNum + ", deptNum=" + deptNum + ", empNum=" + empNum + ", requestTitle="
				+ requestTitle + ", requestContent=" + requestContent + ", requestDate=" + requestDate
				+ ", requestStatus=" + requestStatus + ", requestComplete=" + requestComplete + ", approvalNum="
				+ approvalNum + ", confirmNum=" + confirmNum + "]";
	}
	
	

}

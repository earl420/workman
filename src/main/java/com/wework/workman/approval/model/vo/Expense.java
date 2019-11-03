package com.wework.workman.approval.model.vo;

import java.sql.Date;

public class Expense {
	private String expenseNum;			// 지출결의번호
	private int deptNum;				// 지출결의부서
	private String empNum;				// 지출결의자
	private String expenseTitle;		// 지출결의제목
	private String expenseContent;		// 지출결의내용
	private Date expenseDate;			// 지출결의등록일시
	private String expenseType;			// 지출타입
	private String partnerNum;			// 거래처번호
	private int expensePrice;			// 거래금액
	private String expenseStatus;		// 상태	Y :등록시 대기 , N:반려,  P:진행 , C:완료  
	private Date  expenseComplete;		// 완료일시
	private String approvalNum;			// 승인번호
	private String confirmNum;			// 결제번호

	public Expense() {
		
	}

	public Expense(String expenseNum, int deptNum, String empNum, String expenseTitle, String expenseContent,
			Date expenseDate, String expenseType, String partnerNum, int expensePrice, String expenseStatus,
			Date expenseComplete, String approvalNum, String confirmNum) {
		super();
		this.expenseNum = expenseNum;
		this.deptNum = deptNum;
		this.empNum = empNum;
		this.expenseTitle = expenseTitle;
		this.expenseContent = expenseContent;
		this.expenseDate = expenseDate;
		this.expenseType = expenseType;
		this.partnerNum = partnerNum;
		this.expensePrice = expensePrice;
		this.expenseStatus = expenseStatus;
		this.expenseComplete = expenseComplete;
		this.approvalNum = approvalNum;
		this.confirmNum = confirmNum;
	}

	public String getExpenseNum() {
		return expenseNum;
	}

	public void setExpenseNum(String expenseNum) {
		this.expenseNum = expenseNum;
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

	public String getExpenseTitle() {
		return expenseTitle;
	}

	public void setExpenseTitle(String expenseTitle) {
		this.expenseTitle = expenseTitle;
	}

	public String getExpenseContent() {
		return expenseContent;
	}

	public void setExpenseContent(String expenseContent) {
		this.expenseContent = expenseContent;
	}

	public Date getExpenseDate() {
		return expenseDate;
	}

	public void setExpenseDate(Date expenseDate) {
		this.expenseDate = expenseDate;
	}

	public String getExpenseType() {
		return expenseType;
	}

	public void setExpenseType(String expenseType) {
		this.expenseType = expenseType;
	}

	public String getPartnerNum() {
		return partnerNum;
	}

	public void setPartnerNum(String partnerNum) {
		this.partnerNum = partnerNum;
	}

	public int getExpensePrice() {
		return expensePrice;
	}

	public void setExpensePrice(int expensePrice) {
		this.expensePrice = expensePrice;
	}

	public String getExpenseStatus() {
		return expenseStatus;
	}

	public void setExpenseStatus(String expenseStatus) {
		this.expenseStatus = expenseStatus;
	}

	public Date getExpenseComplete() {
		return expenseComplete;
	}

	public void setExpenseComplete(Date expenseComplete) {
		this.expenseComplete = expenseComplete;
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
		return "Expense [expenseNum=" + expenseNum + ", deptNum=" + deptNum + ", empNum=" + empNum + ", expenseTitle="
				+ expenseTitle + ", expenseContent=" + expenseContent + ", expenseDate=" + expenseDate
				+ ", expenseType=" + expenseType + ", partnerNum=" + partnerNum + ", expensePrice=" + expensePrice
				+ ", expenseStatus=" + expenseStatus + ", expenseComplete=" + expenseComplete + ", approvalNum="
				+ approvalNum + ", confirmNum=" + confirmNum + "]";
	}

	
	
	
}

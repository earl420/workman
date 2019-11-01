package com.wework.workman.approval.model.vo;

import java.sql.Date;

public class HolidaySort {
	
	private int pNum;					// 최신등록 정렬
	private int rNum;					// 등록 순서 정렬
	private String holiNum;				// 휴가신청번호
	private int deptNum;				// 휴가신청부서
	private String empNum;				// 휴가신청자
	private String holiType;			// 휴가신청타입
	private Date holiApply;				// 휴가신청일시
	private Date holidayStart;			// 휴가시작일
	private Date holidayEnd;			// 휴가종료일
	private String approvalNum;			// 승인번호
	private String confirmNum;			// 결제번호
	private String holidayStatus;		// 상태	 Y :등록시 대기 , N:반려,  P:진행 , C:완료  
	
	public HolidaySort() {
		
	}

	public HolidaySort(int pNum, int rNum, String holiNum, int deptNum, String empNum, String holiType, Date holiApply,
			Date holidayStart, Date holidayEnd, String approvalNum, String confirmNum, String holidayStatus) {
		super();
		this.pNum = pNum;
		this.rNum = rNum;
		this.holiNum = holiNum;
		this.deptNum = deptNum;
		this.empNum = empNum;
		this.holiType = holiType;
		this.holiApply = holiApply;
		this.holidayStart = holidayStart;
		this.holidayEnd = holidayEnd;
		this.approvalNum = approvalNum;
		this.confirmNum = confirmNum;
		this.holidayStatus = holidayStatus;
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

	public String getHoliNum() {
		return holiNum;
	}

	public void setHoliNum(String holiNum) {
		this.holiNum = holiNum;
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

	public String getHoliType() {
		return holiType;
	}

	public void setHoliType(String holiType) {
		this.holiType = holiType;
	}

	public Date getHoliApply() {
		return holiApply;
	}

	public void setHoliApply(Date holiApply) {
		this.holiApply = holiApply;
	}

	public Date getHolidayStart() {
		return holidayStart;
	}

	public void setHolidayStart(Date holidayStart) {
		this.holidayStart = holidayStart;
	}

	public Date getHolidayEnd() {
		return holidayEnd;
	}

	public void setHolidayEnd(Date holidayEnd) {
		this.holidayEnd = holidayEnd;
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

	public String getHolidayStatus() {
		return holidayStatus;
	}

	public void setHolidayStatus(String holidayStatus) {
		this.holidayStatus = holidayStatus;
	}

	@Override
	public String toString() {
		return "HolidaySort [pNum=" + pNum + ", rNum=" + rNum + ", holiNum=" + holiNum + ", deptNum=" + deptNum
				+ ", empNum=" + empNum + ", holiType=" + holiType + ", holiApply=" + holiApply + ", holidayStart="
				+ holidayStart + ", holidayEnd=" + holidayEnd + ", approvalNum=" + approvalNum + ", confirmNum="
				+ confirmNum + ", holidayStatus=" + holidayStatus + "]";
	}
	

}

package com.wework.workman.humanResource.model.vo;

import java.sql.Date;

public class Notice {
	
	private String noticeNum;
	private int noticeDept;
	private String noticeTitle;
	private String noticeContent;
	private String empNum;
	private String empName;
	private Date noticeDate;
	private Date noticeModify;
	private String noticeStatus;
	private int noticeAccType;
	
	public Notice() {
		
	}

	public Notice(String noticeNum, int noticeDept, String noticeTitle, String noticeContent, String empNum,
			String empName, Date noticeDate, Date noticeModify, String noticeStatus, int noticeAccType) {
		super();
		this.noticeNum = noticeNum;
		this.noticeDept = noticeDept;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.empNum = empNum;
		this.empName = empName;
		this.noticeDate = noticeDate;
		this.noticeModify = noticeModify;
		this.noticeStatus = noticeStatus;
		this.noticeAccType = noticeAccType;
	}

	public String getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(String noticeNum) {
		this.noticeNum = noticeNum;
	}

	public int getNoticeDept() {
		return noticeDept;
	}

	public void setNoticeDept(int noticeDept) {
		this.noticeDept = noticeDept;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getEmpNum() {
		return empNum;
	}

	public void setEmpNum(String empNum) {
		this.empNum = empNum;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public Date getNoticeModify() {
		return noticeModify;
	}

	public void setNoticeModify(Date noticeModify) {
		this.noticeModify = noticeModify;
	}

	public String getNoticeStatus() {
		return noticeStatus;
	}

	public void setNoticeStatus(String noticeStatus) {
		this.noticeStatus = noticeStatus;
	}

	public int getNoticeAccType() {
		return noticeAccType;
	}

	public void setNoticeAccType(int noticeAccType) {
		this.noticeAccType = noticeAccType;
	}

	@Override
	public String toString() {
		return "Notice [noticeNum=" + noticeNum + ", noticeDept=" + noticeDept + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", empNum=" + empNum + ", empName=" + empName + ", noticeDate="
				+ noticeDate + ", noticeModify=" + noticeModify + ", noticeStatus=" + noticeStatus + ", noticeAccType="
				+ noticeAccType + "]";
	}
	
	

}

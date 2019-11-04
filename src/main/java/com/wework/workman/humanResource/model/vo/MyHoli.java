package com.wework.workman.humanResource.model.vo;

import java.sql.Date;

public class MyHoli {
	
	private String docNum;
	private String holiType;
	private int due;
	private Date holiStart;
	private Date holiEnd;
	private String holiStatus;
	
	public MyHoli() {
		
	}

	public MyHoli(String docNum, String holiType, int due, Date holiStart, Date holiEnd, String holiStatus) {
		super();
		this.docNum = docNum;
		this.holiType = holiType;
		this.due = due;
		this.holiStart = holiStart;
		this.holiEnd = holiEnd;
		this.holiStatus = holiStatus;
	}

	public String getDocNum() {
		return docNum;
	}

	public void setDocNum(String docNum) {
		this.docNum = docNum;
	}

	public String getHoliType() {
		return holiType;
	}

	public void setHoliType(String holiType) {
		this.holiType = holiType;
	}

	public int getDue() {
		return due;
	}

	public void setDue(int due) {
		this.due = due;
	}

	public Date getHoliStart() {
		return holiStart;
	}

	public void setHoliStart(Date holiStart) {
		this.holiStart = holiStart;
	}

	public Date getHoliEnd() {
		return holiEnd;
	}

	public void setHoliEnd(Date holiEnd) {
		this.holiEnd = holiEnd;
	}

	public String getHoliStatus() {
		return holiStatus;
	}

	public void setHoliStatus(String holiStatus) {
		this.holiStatus = holiStatus;
	}

	@Override
	public String toString() {
		return "MyHoli [docNum=" + docNum + ", holiType=" + holiType + ", due=" + due + ", holiStart=" + holiStart
				+ ", holiEnd=" + holiEnd + ", holiStatus=" + holiStatus + "]";
	}
	
	
	

}

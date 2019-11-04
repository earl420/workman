package com.wework.workman.humanResource.model.vo;

import java.sql.Date;

public class UseHoli {
	
	private String holiNum;
	private String empNum;
	private String holiType;
	private Date holiStart;
	private Date holiEnd;
	private String holiStatus;
	private int due;
	public UseHoli() {
		super();
	}
	public UseHoli(String holiNum, String empNum, String holiType, Date holiStart, Date holiEnd, String holiStatus,
			int due) {
		this.holiNum = holiNum;
		this.empNum = empNum;
		this.holiType = holiType;
		this.holiStart = holiStart;
		this.holiEnd = holiEnd;
		this.holiStatus = holiStatus;
		this.due = due;
	}
	public String getHoliNum() {
		return holiNum;
	}
	public void setHoliNum(String holiNum) {
		this.holiNum = holiNum;
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
	public int getDue() {
		return due;
	}
	public void setDue(int due) {
		this.due = due;
	}
	@Override
	public String toString() {
		return "UseHoli [holiNum=" + holiNum + ", empNum=" + empNum + ", holiType=" + holiType + ", holiStart="
				+ holiStart + ", holiEnd=" + holiEnd + ", holiStatus=" + holiStatus + ", due=" + due + "]";
	}

	
	

}

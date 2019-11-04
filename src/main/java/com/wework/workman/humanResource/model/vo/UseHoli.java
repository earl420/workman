package com.wework.workman.humanResource.model.vo;

import java.sql.Date;

public class UseHoli {
	
	private String holiNum;
	private String empNum;
	private String holiType;
	private Date holiStart;
	private Date holiEnd;
	private String holiday_status;
	
	public UseHoli() {
		
	}

	public UseHoli(String holiNum, String empNum, String holiType, Date holiStart, Date holiEnd,
			String holiday_status) {
		super();
		this.holiNum = holiNum;
		this.empNum = empNum;
		this.holiType = holiType;
		this.holiStart = holiStart;
		this.holiEnd = holiEnd;
		this.holiday_status = holiday_status;
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

	public String getHoliday_status() {
		return holiday_status;
	}

	public void setHoliday_status(String holiday_status) {
		this.holiday_status = holiday_status;
	}

	@Override
	public String toString() {
		return "UseHoli [holiNum=" + holiNum + ", empNum=" + empNum + ", holiType=" + holiType + ", holiStart="
				+ holiStart + ", holiEnd=" + holiEnd + ", holiday_status=" + holiday_status + "]";
	}

	

}

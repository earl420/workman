package com.wework.workman.humanResource.model.vo;

import java.sql.Date;

public class Att {
	
	private String empNum;
	private Date attDate;
	private String timeOn;
	private String timeOff;
	
	public Att() {
		
	}

	public Att(String empNum, Date attDate, String timeOn, String timeOff) {
		super();
		this.empNum = empNum;
		this.attDate = attDate;
		this.timeOn = timeOn;
		this.timeOff = timeOff;
	}

	public String getEmpNum() {
		return empNum;
	}

	public void setEmpNum(String empNum) {
		this.empNum = empNum;
	}

	public Date getAttDate() {
		return attDate;
	}

	public void setAttDate(Date attDate) {
		this.attDate = attDate;
	}

	public String getTimeOn() {
		return timeOn;
	}

	public void setTimeOn(String timeOn) {
		this.timeOn = timeOn;
	}

	public String getTimeOff() {
		return timeOff;
	}

	public void setTimeOff(String timeOff) {
		this.timeOff = timeOff;
	}

	@Override
	public String toString() {
		return "Att [empNum=" + empNum + ", attDate=" + attDate + ", timeOn=" + timeOn + ", timeOff=" + timeOff + "]";
	}

}

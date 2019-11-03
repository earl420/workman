package com.wework.workman.calendar.model.vo;

import java.util.Date;

public class Attendance {
	
	private String empNum;
	private Date att_date;
	private String time_on;
	private String time_off;
	
	
	public Attendance() {
		super();
	}


	public Attendance(String empNum, Date att_date, String time_on, String time_off) {
		this.empNum = empNum;
		this.att_date = att_date;
		this.time_on = time_on;
		this.time_off = time_off;
	}


	public String getEmpNum() {
		return empNum;
	}


	public void setEmpNum(String empNum) {
		this.empNum = empNum;
	}


	public Date getAtt_date() {
		return att_date;
	}


	public void setAtt_date(Date att_date) {
		this.att_date = att_date;
	}


	public String getTime_on() {
		return time_on;
	}


	public void setTime_on(String time_on) {
		this.time_on = time_on;
	}


	public String getTime_off() {
		return time_off;
	}


	public void setTime_off(String time_off) {
		this.time_off = time_off;
	}


	@Override
	public String toString() {
		return "Attendance [empNum=" + empNum + ", att_date=" + att_date + ", time_on=" + time_on + ", time_off="
				+ time_off + "]";
	}


}

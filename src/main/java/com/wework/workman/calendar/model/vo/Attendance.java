package com.wework.workman.calendar.model.vo;

import java.util.Date;

public class Attendance {
	
	private int empNum;
	private String att_date;
	private String time_on;
	private String time_off;
	
	
	public Attendance() {
		super();
	}


	public Attendance(int empNum, String att_date, String time_on, String time_off) {
		super();
		this.empNum = empNum;
		this.att_date = att_date;
		this.time_on = time_on;
		this.time_off = time_off;
	}


	public int getEmpNum() {
		return empNum;
	}


	public void setEmpNum(int empNum) {
		this.empNum = empNum;
	}


	public String getAtt_date() {
		return att_date;
	}


	public void setAtt_date(String att_date) {
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

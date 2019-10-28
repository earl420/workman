package com.wework.workman.calendar.model.vo;

import java.util.Date;

public class Attendance {
	
	private int empNum;
	private Date att_date;
	private Date time_on;
	private Date time_off;
	
	
	public Attendance() {
		super();
	}


	public Attendance(int empNum, Date att_date, Date time_on, Date time_off) {
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



	public Date getAtt_date() {
		return att_date;
	}



	public void setAtt_date(Date att_date) {
		this.att_date = att_date;
	}



	public Date getTime_on() {
		return time_on;
	}



	public void setTime_on(Date time_on) {
		this.time_on = time_on;
	}



	public Date getTime_off() {
		return time_off;
	}



	public void setTime_off(Date time_off) {
		this.time_off = time_off;
	}



	@Override
	public String toString() {
		return "Attendance [empNum=" + empNum + ", att_date=" + att_date + ", time_on=" + time_on + ", time_off="
				+ time_off + "]";
	}
	
	
	
	

}

package com.wework.workman.account.model.vo;

public class Attendance2 {
	private String empNum;
	private String today;
	private String time;
	public Attendance2() {
	}
	public Attendance2(String empNum, String today, String time) {
		super();
		this.empNum = empNum;
		this.today = today;
		this.time = time;
	}
	public String getEmpNum() {
		return empNum;
	}
	public void setEmpNum(String empNum) {
		this.empNum = empNum;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "Attendance [empNum=" + empNum + ", today=" + today + ", time=" + time + "]";
	}
	
}

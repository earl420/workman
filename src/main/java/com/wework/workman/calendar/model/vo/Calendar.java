package com.wework.workman.calendar.model.vo;

import java.sql.Date;

public class Calendar {
	
	private String empNum;
	private int deptNum;
	private String description;
	private Date start;
	private Date end;
	private String ctype;
	private String userName;
	
	
	public Calendar() {
		super();
	}


	public Calendar(String empNum, int deptNum, String description, Date start, Date end, String ctype,
			String userName) {
		super();
		this.empNum = empNum;
		this.deptNum = deptNum;
		this.description = description;
		this.start = start;
		this.end = end;
		this.ctype = ctype;
		this.userName = userName;
	}


	public String getEmpNum() {
		return empNum;
	}


	public void setEmpNum(String empNum) {
		this.empNum = empNum;
	}


	public int getDeptNum() {
		return deptNum;
	}


	public void setDeptNum(int deptNum) {
		this.deptNum = deptNum;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public Date getStart() {
		return start;
	}


	public void setStart(Date start) {
		this.start = start;
	}


	public Date getEnd() {
		return end;
	}


	public void setEnd(Date end) {
		this.end = end;
	}


	public String getCtype() {
		return ctype;
	}


	public void setCtype(String ctype) {
		this.ctype = ctype;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	@Override
	public String toString() {
		return "Calendar [empNum=" + empNum + ", deptNum=" + deptNum + ", description=" + description + ", start="
				+ start + ", end=" + end + ", ctype=" + ctype + ", userName=" + userName + "]";
	}


	

}
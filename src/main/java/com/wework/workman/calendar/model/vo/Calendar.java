package com.wework.workman.calendar.model.vo;

import java.sql.Date;

public class Calendar {
	
	private int empNum;
	private String _id;
	private String title;
	private String description;
	private Date start;
	private Date end;
	private String type;
	private String userName;
	private String backgroundColor;
	private String textColor;
	private Boolean allDay;
	
	
	public Calendar() {
		super();
	}


	public Calendar(int empNum, String _id, String title, String description, Date start, Date end, String type,
			String userName, String backgroundColor, String textColor, Boolean allDay) {
		super();
		this.empNum = empNum;
		this._id = _id;
		this.title = title;
		this.description = description;
		this.start = start;
		this.end = end;
		this.type = type;
		this.userName = userName;
		this.backgroundColor = backgroundColor;
		this.textColor = textColor;
		this.allDay = allDay;
	}



	public int getEmpNum() {
		return empNum;
	}


	public void setEmpNum(int empNum) {
		this.empNum = empNum;
	}


	public String get_id() {
		return _id;
	}


	public void set_id(String _id) {
		this._id = _id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
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


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getBackgroundColor() {
		return backgroundColor;
	}


	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}


	public String getTextColor() {
		return textColor;
	}


	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}


	public Boolean getAllDay() {
		return allDay;
	}


	public void setAllDay(Boolean allDay) {
		this.allDay = allDay;
	}


	@Override
	public String toString() {
		return "Calendar [empNum=" + empNum + ", _id=" + _id + ", title=" + title + ", description=" + description
				+ ", start=" + start + ", end=" + end + ", type=" + type + ", userName=" + userName
				+ ", backgroundColor=" + backgroundColor + ", textColor=" + textColor + ", allDay=" + allDay + "]";
	}


	
}

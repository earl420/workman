package com.wework.workman.account.model.vo;

public class IsState {
	private String startDate;
	private String endDate;
	public IsState() {
		super();
	}
	public IsState(String startDate, String endDate) {
		super();
		this.startDate = startDate;
		this.endDate = endDate;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	@Override
	public String toString() {
		return "IsState [startDate=" + startDate + ", endDate=" + endDate + "]";
	}
	
	
}

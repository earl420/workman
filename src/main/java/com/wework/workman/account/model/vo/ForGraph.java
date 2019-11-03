package com.wework.workman.account.model.vo;

public class ForGraph {
	private int year; //연도 와 비용 가져올것
	private int quarter; //분기와 매출 가져올것
	public ForGraph() {
	}
	public ForGraph(int year, int quarter) {
		super();
		this.year = year;
		this.quarter = quarter;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getQuarter() {
		return quarter;
	}
	public void setQuarter(int quarter) {
		this.quarter = quarter;
	}
	@Override
	public String toString() {
		return  year + "," + quarter;
	}
	
	
	
}

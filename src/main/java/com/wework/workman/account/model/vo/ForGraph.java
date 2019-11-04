package com.wework.workman.account.model.vo;

public class ForGraph {
	private long year; //연도 와 비용 가져올것
	private long quarter; //분기와 매출 가져올것
	public ForGraph() {
	}
	public ForGraph(long year, long quarter) {
		this.year = year;
		this.quarter = quarter;
	}
	public long getYear() {
		return year;
	}
	public void setYear(long year) {
		this.year = year;
	}
	public long getQuarter() {
		return quarter;
	}
	public void setQuarter(long quarter) {
		this.quarter = quarter;
	}
	@Override
	public String toString() {
		return "ForGraph [year=" + year + ", quarter=" + quarter + "]";
	}
	
	
	
	
}

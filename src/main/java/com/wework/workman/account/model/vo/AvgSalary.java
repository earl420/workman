package com.wework.workman.account.model.vo;

public class AvgSalary {
	private int avgTotal;
	private int avgDept;
	private int avgGrade;
	public AvgSalary() {
		super();
	}
	public AvgSalary(int avgTotal, int avgDept, int avgGrade) {
		this.avgTotal = avgTotal;
		this.avgDept = avgDept;
		this.avgGrade = avgGrade;
	}
	public int getAvgTotal() {
		return avgTotal;
	}
	public void setAvgTotal(int avgTotal) {
		this.avgTotal = avgTotal;
	}
	public int getAvgDept() {
		return avgDept;
	}
	public void setAvgDept(int avgDept) {
		this.avgDept = avgDept;
	}
	public int getAvgGrade() {
		return avgGrade;
	}
	public void setAvgGrade(int avgGrade) {
		this.avgGrade = avgGrade;
	}
	@Override
	public String toString() {
		return "AvgSalary [avgTotal=" + avgTotal + ", avgDept=" + avgDept + ", avgGrade=" + avgGrade + "]";
	}
	
}

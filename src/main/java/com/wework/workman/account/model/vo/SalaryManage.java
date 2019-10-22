package com.wework.workman.account.model.vo;

public class SalaryManage {
	private String empNum;
	private String deptNum;
	private String deptName;
	private String empName;
	private String gradeName;
	private int salYear;
	private int monSalary;
	private int yearSalary;
	private double increaseRate;
	public SalaryManage() {
		super();
	}
	public SalaryManage(String empNum, String deptNum, String deptName, String empName, String gradeName, int salYear,
			int monSalary, int yearSalary, double increaseRate) {
		super();
		this.empNum = empNum;
		this.deptNum = deptNum;
		this.deptName = deptName;
		this.empName = empName;
		this.gradeName = gradeName;
		this.salYear = salYear;
		this.monSalary = monSalary;
		this.yearSalary = yearSalary;
		this.increaseRate = increaseRate;
	}
	public String getEmpNum() {
		return empNum;
	}
	public void setEmpNum(String empNum) {
		this.empNum = empNum;
	}
	public String getDeptNum() {
		return deptNum;
	}
	public void setDeptNum(String deptNum) {
		this.deptNum = deptNum;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public int getSalYear() {
		return salYear;
	}
	public void setSalYear(int salYear) {
		this.salYear = salYear;
	}
	public int getMonSalary() {
		return monSalary;
	}
	public void setMonSalary(int monSalary) {
		this.monSalary = monSalary;
	}
	public int getYearSalary() {
		return yearSalary;
	}
	public void setYearSalary(int yearSalary) {
		this.yearSalary = yearSalary;
	}
	public double getIncreaseRate() {
		return increaseRate;
	}
	public void setIncreaseRate(double increaseRate) {
		this.increaseRate = increaseRate;
	}
	@Override
	public String toString() {
		return "SalaryManage [empNum=" + empNum + ", deptNum=" + deptNum + ", deptName=" + deptName + ", empName="
				+ empName + ", gradeName=" + gradeName + ", salYear=" + salYear + ", monSalary=" + monSalary
				+ ", yearSalary=" + yearSalary + ", increaseRate=" + increaseRate + "]";
	}
	
	
}

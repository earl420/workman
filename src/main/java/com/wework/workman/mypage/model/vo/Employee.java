package com.wework.workman.mypage.model.vo;

import java.sql.Date;

public class Employee {
	
	private int empNum;
	private String empPwd;
	private String empName;
	private String empEmail;
	private String empGender;
	private Date empBirth;
	private String empPhone;
	private int gradeNum;
	private int deftNum;
	private int empSalary;
	private Date enrollDate;
	private Date resignDate;
	private String empStatus;
	private String empAccount;
	private String empBack;
	
	public Employee() {
		super();
	}

	public Employee(int empNum, String empPwd, String empName, String empEmail, String empGender, Date empBirth,
			String empPhone, int gradeNum, int deftNum, int empSalary, Date enrollDate, Date resignDate,
			String empStatus, String empAccount, String empBack) {
		super();
		this.empNum = empNum;
		this.empPwd = empPwd;
		this.empName = empName;
		this.empEmail = empEmail;
		this.empGender = empGender;
		this.empBirth = empBirth;
		this.empPhone = empPhone;
		this.gradeNum = gradeNum;
		this.deftNum = deftNum;
		this.empSalary = empSalary;
		this.enrollDate = enrollDate;
		this.resignDate = resignDate;
		this.empStatus = empStatus;
		this.empAccount = empAccount;
		this.empBack = empBack;
	}

	public int getEmpNum() {
		return empNum;
	}

	public void setEmpNum(int empNum) {
		this.empNum = empNum;
	}

	public String getEmpPwd() {
		return empPwd;
	}

	public void setEmpPwd(String empPwd) {
		this.empPwd = empPwd;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpEmail() {
		return empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	public String getEmpGender() {
		return empGender;
	}

	public void setEmpGender(String empGender) {
		this.empGender = empGender;
	}

	public Date getEmpBirth() {
		return empBirth;
	}

	public void setEmpBirth(Date empBirth) {
		this.empBirth = empBirth;
	}

	public String getEmpPhone() {
		return empPhone;
	}

	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
	}

	public int getGradeNum() {
		return gradeNum;
	}

	public void setGradeNum(int gradeNum) {
		this.gradeNum = gradeNum;
	}

	public int getDeftNum() {
		return deftNum;
	}

	public void setDeftNum(int deftNum) {
		this.deftNum = deftNum;
	}

	public int getEmpSalary() {
		return empSalary;
	}

	public void setEmpSalary(int empSalary) {
		this.empSalary = empSalary;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getResignDate() {
		return resignDate;
	}

	public void setResignDate(Date resignDate) {
		this.resignDate = resignDate;
	}

	public String getEmpStatus() {
		return empStatus;
	}

	public void setEmpStatus(String empStatus) {
		this.empStatus = empStatus;
	}

	public String getEmpAccount() {
		return empAccount;
	}

	public void setEmpAccount(String empAccount) {
		this.empAccount = empAccount;
	}

	public String getEmpBack() {
		return empBack;
	}

	public void setEmpBack(String empBack) {
		this.empBack = empBack;
	}

	@Override
	public String toString() {
		return "Employee [empNum=" + empNum + ", empPwd=" + empPwd + ", empName=" + empName + ", empEmail=" + empEmail
				+ ", empGender=" + empGender + ", empBirth=" + empBirth + ", empPhone=" + empPhone + ", gradeNum="
				+ gradeNum + ", deftNum=" + deftNum + ", empSalary=" + empSalary + ", enrollDate=" + enrollDate
				+ ", resignDate=" + resignDate + ", empStatus=" + empStatus + ", empAccount=" + empAccount
				+ ", empBack=" + empBack + "]";
	}

	
	
	

}

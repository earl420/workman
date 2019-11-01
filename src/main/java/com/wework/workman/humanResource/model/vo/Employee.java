package com.wework.workman.humanResource.model.vo;

import java.sql.Date;

public class Employee {
	
	private String empNum;
	private String empPwd;
	private String empName;
	private String email;
	private String gender;
	private Date birth;
	private String empPhone;
	private String empAddress;
	private int gradeNum;
	private String gradeName;
	private int deptNum;
	private String deptName;
	private int empSalary;
	private Date enrollDate;
	private Date resignDate;
	private String empStatus;
	private String empAccount;
	private String empBank;
	private int count;
	
	public Employee() {
		
	}

	public Employee(String empNum, String empPwd, String empName, String email, String gender, Date birth,
			String empPhone, String empAddress, int gradeNum, String gradeName, int deptNum, String deptName,
			int empSalary, Date enrollDate, Date resignDate, String empStatus, String empAccount, String empBank,
			int count) {
		super();
		this.empNum = empNum;
		this.empPwd = empPwd;
		this.empName = empName;
		this.email = email;
		this.gender = gender;
		this.birth = birth;
		this.empPhone = empPhone;
		this.empAddress = empAddress;
		this.gradeNum = gradeNum;
		this.gradeName = gradeName;
		this.deptNum = deptNum;
		this.deptName = deptName;
		this.empSalary = empSalary;
		this.enrollDate = enrollDate;
		this.resignDate = resignDate;
		this.empStatus = empStatus;
		this.empAccount = empAccount;
		this.empBank = empBank;
		this.count = count;
	}

	public String getEmpNum() {
		return empNum;
	}

	public void setEmpNum(String empNum) {
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getEmpPhone() {
		return empPhone;
	}

	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
	}

	public String getEmpAddress() {
		return empAddress;
	}

	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}

	public int getGradeNum() {
		return gradeNum;
	}

	public void setGradeNum(int gradeNum) {
		this.gradeNum = gradeNum;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public int getDeptNum() {
		return deptNum;
	}

	public void setDeptNum(int deptNum) {
		this.deptNum = deptNum;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
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

	public String getEmpBank() {
		return empBank;
	}

	public void setEmpBank(String empBank) {
		this.empBank = empBank;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Employee [empNum=" + empNum + ", empPwd=" + empPwd + ", empName=" + empName + ", email=" + email
				+ ", gender=" + gender + ", birth=" + birth + ", empPhone=" + empPhone + ", empAddress=" + empAddress
				+ ", gradeNum=" + gradeNum + ", gradeName=" + gradeName + ", deptNum=" + deptNum + ", deptName="
				+ deptName + ", empSalary=" + empSalary + ", enrollDate=" + enrollDate + ", resignDate=" + resignDate
				+ ", empStatus=" + empStatus + ", empAccount=" + empAccount + ", empBank=" + empBank + ", count="
				+ count + "]";
	}
	
	
}

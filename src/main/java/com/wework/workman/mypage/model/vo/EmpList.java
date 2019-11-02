package com.wework.workman.mypage.model.vo;

import java.sql.Date;

public class EmpList {

	private String num;
	private String name;
	private String email;
	private String phone;
	private int gradeNum;
	private int deftNum;
	private String status;
	private String gradeName;
	private String deptName;
	public EmpList() {
		super();
	}
	public EmpList(String num, String name, String email, String phone, int gradeNum, int deftNum, String status,
			String gradeName, String deptName) {
		super();
		this.num = num;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.gradeNum = gradeNum;
		this.deftNum = deftNum;
		this.status = status;
		this.gradeName = gradeName;
		this.deptName = deptName;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	@Override
	public String toString() {
		return "EmpList [num=" + num + ", name=" + name + ", email=" + email + ", phone=" + phone + ", gradeNum="
				+ gradeNum + ", deftNum=" + deftNum + ", status=" + status + ", gradeName=" + gradeName + ", deptName="
				+ deptName + "]";
	}
	
	
	
	
}

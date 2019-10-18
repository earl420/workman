package com.wework.workman.mypage.model.vo;

import java.sql.Date;

public class Mypage {
	
	private String num;
	private String pwd;
	private String name;
	private String email;
	private String gender;
	private Date birth;
	private String phone;
	private String address;
	private int gradeNum;
	private int deftNum;
	private int salary;
	private Date enrollDate;
	private Date resignDate;
	private String status;
	private String account;
	private String bank;
	
	public Mypage() {
		super();
	}

	public Mypage(String num, String pwd, String name, String email, String gender, Date birth, String phone,
			String address, int gradeNum, int deftNum, int salary, Date enrollDate, Date resignDate, String status,
			String account, String bank) {
		super();
		this.num = num;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.birth = birth;
		this.phone = phone;
		this.address = address;
		this.gradeNum = gradeNum;
		this.deftNum = deftNum;
		this.salary = salary;
		this.enrollDate = enrollDate;
		this.resignDate = resignDate;
		this.status = status;
		this.account = account;
		this.bank = bank;
	}



	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	@Override
	public String toString() {
		return "Mypage [num=" + num + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", gender=" + gender
				+ ", birth=" + birth + ", phone=" + phone + ", address=" + address + ", gradeNum=" + gradeNum
				+ ", deftNum=" + deftNum + ", salary=" + salary + ", enrollDate=" + enrollDate + ", resignDate="
				+ resignDate + ", status=" + status + ", account=" + account + ", bank=" + bank + "]";
	}
	
	

}

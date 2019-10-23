package com.wework.workman.account.model.vo;

import java.sql.Date;

public class Fixture {
	private String fixtureNum;
	private String fixtureType;
	private String fixtureName;
	private Date fixtureBuy;
	private String deptNum;
	private String deptName;
	private String empNum;
	private String empName;
	private int endurance;
	private int fixturePrice;
	private int residualValue;//잔존가치
	public Fixture() {
	}
	public Fixture(String fixtureNum, String fixtureType, String fixtureName, Date fixtureBuy, String deptNum,
			String deptName, String empNum, String empName, int endurance, int fixturePrice, int residualValue) {
		super();
		this.fixtureNum = fixtureNum;
		this.fixtureType = fixtureType;
		this.fixtureName = fixtureName;
		this.fixtureBuy = fixtureBuy;
		this.deptNum = deptNum;
		this.deptName = deptName;
		this.empNum = empNum;
		this.empName = empName;
		this.endurance = endurance;
		this.fixturePrice = fixturePrice;
		this.residualValue = residualValue;
	}
	public String getFixtureNum() {
		return fixtureNum;
	}
	public void setFixtureNum(String fixtureNum) {
		this.fixtureNum = fixtureNum;
	}
	public String getFixtureType() {
		return fixtureType;
	}
	public void setFixtureType(String fixtureType) {
		this.fixtureType = fixtureType;
	}
	public String getFixtureName() {
		return fixtureName;
	}
	public void setFixtureName(String fixtureName) {
		this.fixtureName = fixtureName;
	}
	public Date getFixtureBuy() {
		return fixtureBuy;
	}
	public void setFixtureBuy(Date fixtureBuy) {
		this.fixtureBuy = fixtureBuy;
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
	public String getEmpNum() {
		return empNum;
	}
	public void setEmpNum(String empNum) {
		this.empNum = empNum;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public int getEndurance() {
		return endurance;
	}
	public void setEndurance(int endurance) {
		this.endurance = endurance;
	}
	public int getFixturePrice() {
		return fixturePrice;
	}
	public void setFixturePrice(int fixturePrice) {
		this.fixturePrice = fixturePrice;
	}
	public int getResidualValue() {
		return residualValue;
	}
	public void setResidualValue(int residualValue) {
		this.residualValue = residualValue;
	}
	@Override
	public String toString() {
		return "Fixture [fixtureNum=" + fixtureNum + ", fixtureType=" + fixtureType + ", fixtureName=" + fixtureName
				+ ", fixtureBuy=" + fixtureBuy + ", deptNum=" + deptNum + ", deptName=" + deptName + ", empNum="
				+ empNum + ", empName=" + empName + ", endurance=" + endurance + ", fixturePrice=" + fixturePrice
				+ ", residualValue=" + residualValue + "]";
	}
	
	
	
	
}

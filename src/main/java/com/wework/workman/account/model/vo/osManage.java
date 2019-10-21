package com.wework.workman.account.model.vo;

import java.sql.Date;

public class osManage {
	private String licenseManage;
	private String productName;
	private String licenseNum;
	private String payNum;
	private Date licenseStart;
	private Date licenseEnd;
	private Date licenseUpdate;
	public osManage() {
	}
	public osManage(String licenseManage, String productName, String licenseNum, String payNum, Date licenseStart,
			Date licenseEnd, Date licenseUpdate) {
		this.licenseManage = licenseManage;
		this.productName = productName;
		this.licenseNum = licenseNum;
		this.payNum = payNum;
		this.licenseStart = licenseStart;
		this.licenseEnd = licenseEnd;
		this.licenseUpdate = licenseUpdate;
	}
	public String getLicenseManage() {
		return licenseManage;
	}
	public void setLicenseManage(String licenseManage) {
		this.licenseManage = licenseManage;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getLicenseNum() {
		return licenseNum;
	}
	public void setLicenseNum(String licenseNum) {
		this.licenseNum = licenseNum;
	}
	public String getPayNum() {
		return payNum;
	}
	public void setPayNum(String payNum) {
		this.payNum = payNum;
	}
	public Date getLicenseStart() {
		return licenseStart;
	}
	public void setLicenseStart(Date licenseStart) {
		this.licenseStart = licenseStart;
	}
	public Date getLicenseEnd() {
		return licenseEnd;
	}
	public void setLicenseEnd(Date licenseEnd) {
		this.licenseEnd = licenseEnd;
	}
	public Date getLicenseUpdate() {
		return licenseUpdate;
	}
	public void setLicenseUpdate(Date licenseUpdate) {
		this.licenseUpdate = licenseUpdate;
	}
	@Override
	public String toString() {
		return "osManage [licenseManage=" + licenseManage + ", productName=" + productName + ", licenseNum="
				+ licenseNum + ", payNum=" + payNum + ", licenseStart=" + licenseStart + ", licenseEnd=" + licenseEnd
				+ ", licenseUpdate=" + licenseUpdate + "]";
	}
	
	
}

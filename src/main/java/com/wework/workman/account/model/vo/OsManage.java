package com.wework.workman.account.model.vo;

import java.sql.Date;

public class OsManage {
	private String licenseManage;
	private String productName;
	private String licenseNum;
	private String payNum;
	private Date licenseStart;
	private Date licenseEnd;
	private Date licenseUpdate;
	private int saleCount;
	private int salePrice;
	private int endurance;
	private String empNum;
	private String partnerNum;
	public String getPartnerNum() {
		return partnerNum;
	}
	public void setPartnerNum(String partnerNum) {
		this.partnerNum = partnerNum;
	}
	public OsManage() {
	}
	public OsManage(String licenseManage, String productName, String licenseNum, String payNum, Date licenseStart,
			Date licenseEnd, Date licenseUpdate, int saleCount, int salePrice, int endurance, String empNum) {
		super();
		this.licenseManage = licenseManage;
		this.productName = productName;
		this.licenseNum = licenseNum;
		this.payNum = payNum;
		this.licenseStart = licenseStart;
		this.licenseEnd = licenseEnd;
		this.licenseUpdate = licenseUpdate;
		this.saleCount = saleCount;
		this.salePrice = salePrice;
		this.endurance = endurance;
		this.empNum = empNum;
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
	public int getSaleCount() {
		return saleCount;
	}
	public void setSaleCount(int saleCount) {
		this.saleCount = saleCount;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public int getEndurance() {
		return endurance;
	}
	public void setEndurance(int endurance) {
		this.endurance = endurance;
	}
	public String getEmpNum() {
		return empNum;
	}
	public void setEmpNum(String empNum) {
		this.empNum = empNum;
	}
	@Override
	public String toString() {
		return "OsManage [licenseManage=" + licenseManage + ", productName=" + productName + ", licenseNum="
				+ licenseNum + ", payNum=" + payNum + ", licenseStart=" + licenseStart + ", licenseEnd=" + licenseEnd
				+ ", licenseUpdate=" + licenseUpdate + ", saleCount=" + saleCount + ", salePrice=" + salePrice
				+ ", endurance=" + endurance + ", empNum=" + empNum + ", partnerNum=" + partnerNum + "]";
	}
	
	
	
}

package com.wework.workman.account.model.vo;

import java.sql.Date;

public class SaleManage {
	private String salesNum;
	private String productCode;
	private String productName;
	private int productPrice;
	private Date salesDate;
	private String empNum;
	private String empName;
	private int salesAmount;
	private String partnerNum;
	private String partnerName;
	public SaleManage() {
	}
	public SaleManage(String salesNum, String productCode, String productName, int productPrice, Date salesDate,
			String empNum, String empName, int salesAmount, String partnerNum, String partnerName) {
		super();
		this.salesNum = salesNum;
		this.productCode = productCode;
		this.productName = productName;
		this.productPrice = productPrice;
		this.salesDate = salesDate;
		this.empNum = empNum;
		this.empName = empName;
		this.salesAmount = salesAmount;
		this.partnerNum = partnerNum;
		this.partnerName = partnerName;
	}
	public String getSalesNum() {
		return salesNum;
	}
	public void setSalesNum(String salesNum) {
		this.salesNum = salesNum;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public Date getSalesDate() {
		return salesDate;
	}
	public void setSalesDate(Date salesDate) {
		this.salesDate = salesDate;
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
	public int getSalesAmount() {
		return salesAmount;
	}
	public void setSalesAmount(int salesAmount) {
		this.salesAmount = salesAmount;
	}
	public String getPartnerNum() {
		return partnerNum;
	}
	public void setPartnerNum(String partnerNum) {
		this.partnerNum = partnerNum;
	}
	public String getPartnerName() {
		return partnerName;
	}
	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}
	@Override
	public String toString() {
		return "SaleManage [salesNum=" + salesNum + ", productCode=" + productCode + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", salesDate=" + salesDate + ", empNum=" + empNum + ", empName="
				+ empName + ", salesAmount=" + salesAmount + ", partnerNum=" + partnerNum + ", partnerName="
				+ partnerName + "]";
	}
	
	
}

package com.wework.workman.account.model.vo;

import java.sql.Date;

public class SaleManage {
	private String salesNum;
	private String productNum;
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
	public SaleManage(String salesNum, String productNum, String productName, int productPrice, Date salesDate,
			String empNum, String empName, int salesAmount, String partnerNum, String partnerName) {
		this.salesNum = salesNum;
		this.productNum = productNum;
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
	public String getProductNum() {
		return productNum;
	}
	public void setProductNum(String productNum) {
		this.productNum = productNum;
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
		return "SaleManage [salesNum=" + salesNum + ", productNum=" + productNum + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", salesDate=" + salesDate + ", empNum=" + empNum + ", empName="
				+ empName + ", salesAmount=" + salesAmount + ", partnerNum=" + partnerNum + ", partnerName="
				+ partnerName + "]";
	}
	
	
}

package com.wework.workman.account.model.vo;

public class Partner {
	private String partnerNum;
	private String partnerName;
	private String partnerPhone;
	private String partnerFax;
	private String partnerAddress;
	private String bussinessNum;
	private String partnerEmp;
	
	
	public Partner() {
		
	}


	public Partner(String partnerNum, String partnerName, String partnerPhone, String partnerFax, String partnerAddress,
			String bussinessNum, String partnerEmp) {
		super();
		this.partnerNum = partnerNum;
		this.partnerName = partnerName;
		this.partnerPhone = partnerPhone;
		this.partnerFax = partnerFax;
		this.partnerAddress = partnerAddress;
		this.bussinessNum = bussinessNum;
		this.partnerEmp = partnerEmp;
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


	public String getPartnerPhone() {
		return partnerPhone;
	}


	public void setPartnerPhone(String partnerPhone) {
		this.partnerPhone = partnerPhone;
	}


	public String getPartnerFax() {
		return partnerFax;
	}


	public void setPartnerFax(String partnerFax) {
		this.partnerFax = partnerFax;
	}


	public String getPartnerAddress() {
		return partnerAddress;
	}


	public void setPartnerAddress(String partnerAddress) {
		this.partnerAddress = partnerAddress;
	}


	public String getBussinessNum() {
		return bussinessNum;
	}


	public void setBussinessNum(String bussinessNum) {
		this.bussinessNum = bussinessNum;
	}


	public String getPartnerEmp() {
		return partnerEmp;
	}


	public void setPartnerEmp(String partnerEmp) {
		this.partnerEmp = partnerEmp;
	}


	@Override
	public String toString() {
		return "Partner [partnerNum=" + partnerNum + ", partnerName=" + partnerName + ", partnerPhone=" + partnerPhone
				+ ", partnerFax=" + partnerFax + ", partnerAddress=" + partnerAddress + ", bussinessNum=" + bussinessNum
				+ ", partnerEmp=" + partnerEmp + "]";
	}
	
	
	
	
}

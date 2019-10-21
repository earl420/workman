package com.wework.workman.account.model.vo;

public class Partner {
	private String partnerNum;
	private String partnerName;
	public Partner() {
	}
	public Partner(String partnerNum, String partnerName) {
		this.partnerNum = partnerNum;
		this.partnerName = partnerName;
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
		return "Partner [partnerNum=" + partnerNum + ", partnerName=" + partnerName + "]";
	}
	
	
}

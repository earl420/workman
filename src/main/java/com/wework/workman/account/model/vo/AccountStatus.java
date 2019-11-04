package com.wework.workman.account.model.vo;

public class AccountStatus {
	
	private String deptside; //차변
	private long account1;//차변금액
	private String credit;//대변
	private long account2;//대변 금액
	public AccountStatus() {
		super();
	}
	public AccountStatus(String deptside, long account1, String credit, long account2) {
		this.deptside = deptside;
		this.account1 = account1;
		this.credit = credit;
		this.account2 = account2;
	}
	public String getDeptside() {
		return deptside;
	}
	public void setDeptside(String deptside) {
		this.deptside = deptside;
	}
	public long getAccount1() {
		return account1;
	}
	public void setAccount1(long account1) {
		this.account1 = account1;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public long getAccount2() {
		return account2;
	}
	public void setAccount2(long account2) {
		this.account2 = account2;
	}
	@Override
	public String toString() {
		return "AccountStatus [deptside=" + deptside + ", account1=" + account1 + ", credit=" + credit + ", account2="
				+ account2 + "]";
	}
	
	
	
}

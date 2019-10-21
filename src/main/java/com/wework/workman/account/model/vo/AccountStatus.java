package com.wework.workman.account.model.vo;

public class AccountStatus {
	
	private String deptside; //차변
	private int account1;//차변금액
	private String credit;//대변
	private int account2;//대변 금액
	public AccountStatus() {
		super();
	}
	public AccountStatus(String deptside, int account1, String credit, int account2) {
		super();
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
	public int getAccount1() {
		return account1;
	}
	public void setAccount1(int account1) {
		this.account1 = account1;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public int getAccount2() {
		return account2;
	}
	public void setAccount2(int account2) {
		this.account2 = account2;
	}
	@Override
	public String toString() {
		return "AccountStatus [deptside=" + deptside + ", account1=" + account1 + ", credit=" + credit + ", account2="
				+ account2 + "]";
	}
	
	
}

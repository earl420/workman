package com.wework.workman.account.model.vo;

public class IncomeStatement {
	private String accountSubject;
	private int account;
	
	public IncomeStatement() {
	}
	public IncomeStatement(String accountSubject, int account) {
		this.accountSubject = accountSubject;
		this.account = account;
	}
	public String getAccountSubject() {
		return accountSubject;
	}
	public void setAccountSubject(String accountSubject) {
		this.accountSubject = accountSubject;
	}
	public int getAccount() {
		return account;
	}
	public void setAccount(int account) {
		this.account = account;
	}
	@Override
	public String toString() {
		return "IncomeStatement [accountSubject=" + accountSubject + ", account=" + account + "]";
	}
	
	
}

package com.wework.workman.account.model.vo;

public class IncomeStatement {
	private String accountSubject;
	private long account;
	public IncomeStatement() {
		super();
	}
	public IncomeStatement(String accountSubject, long account) {
		super();
		this.accountSubject = accountSubject;
		this.account = account;
	}
	public String getAccountSubject() {
		return accountSubject;
	}
	public void setAccountSubject(String accountSubject) {
		this.accountSubject = accountSubject;
	}
	public long getAccount() {
		return account;
	}
	public void setAccount(long account) {
		this.account = account;
	}
	@Override
	public String toString() {
		return "IncomeStatement [accountSubject=" + accountSubject + ", account=" + account + "]";
	}
	

	
}

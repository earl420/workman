package com.wework.workman.chatting.model.vo;

public class LoginTemp {
	private String loginId;
	private String loginName;
	public LoginTemp() {
		
	}
	public LoginTemp(String loginId, String loginName) {
		super();
		this.loginId = loginId;
		this.loginName = loginName;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	@Override
	public String toString() {
		return "LoginTemp [loginId=" + loginId + ", loginName=" + loginName + "]";
	}
	
}

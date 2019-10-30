package com.wework.workman.account.model.vo;

public class NoticeFile {
	private String originalName;
	private String rename;
	private String path;
	public NoticeFile() {
	}
	public NoticeFile(String originalName, String rename, String path) {
		super();
		this.originalName = originalName;
		this.rename = rename;
		this.path = path;
	}
	public String getOriginalName() {
		return originalName;
	}
	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}
	public String getRename() {
		return rename;
	}
	public void setRename(String rename) {
		this.rename = rename;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	@Override
	public String toString() {
		return "NoticeFile [originalName=" + originalName + ", rename=" + rename + ", path=" + path + "]";
	}
	
	
}

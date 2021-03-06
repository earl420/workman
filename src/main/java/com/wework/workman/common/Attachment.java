package com.wework.workman.common;

public class Attachment {
	
	private String attNum;
	private String docNum;
	private String attOriginalName;
	private String attPath;
	private String attRename;
	
	public Attachment() {
		
	}

	public Attachment(String attNum, String docNum, String attOriginalName, String attPath, String attRename) {
		super();
		this.attNum = attNum;
		this.docNum = docNum;
		this.attOriginalName = attOriginalName;
		this.attPath = attPath;
		this.attRename = attRename;
	}

	public String getAttNum() {
		return attNum;
	}

	public void setAttNum(String attNum) {
		this.attNum = attNum;
	}

	public String getDocNum() {
		return docNum;
	}

	public void setDocNum(String docNum) {
		this.docNum = docNum;
	}

	public String getAttOriginalName() {
		return attOriginalName;
	}

	public void setAttOriginalName(String attOriginalName) {
		this.attOriginalName = attOriginalName;
	}

	public String getAttPath() {
		return attPath;
	}

	public void setAttPath(String attPath) {
		this.attPath = attPath;
	}

	public String getAttRename() {
		return attRename;
	}

	public void setAttRename(String attRename) {
		this.attRename = attRename;
	}

	@Override
	public String toString() {
		return "Attachment [attNum=" + attNum + ", docNum=" + docNum + ", attOriginalName=" + attOriginalName
				+ ", attPath=" + attPath + ", attRename=" + attRename + "]";
	}
	

}

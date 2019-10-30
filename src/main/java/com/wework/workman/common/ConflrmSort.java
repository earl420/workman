package com.wework.workman.common;

public class ConflrmSort {
	
	private int pNum;			// 최신등록 순서 
	private int rNum;			// 등록된 순서
	private String confirmNum;		// 결제번호
	
	public ConflrmSort() {
		
	}

	public ConflrmSort(int pNum, int rNum, String confirmNum) {
		super();
		this.pNum = pNum;
		this.rNum = rNum;
		this.confirmNum = confirmNum;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public String getConfirmNum() {
		return confirmNum;
	}

	public void setConfirmNum(String confirmNum) {
		this.confirmNum = confirmNum;
	}

	@Override
	public String toString() {
		return "ConflrmSort [pNum=" + pNum + ", rNum=" + rNum + ", confirmNum=" + confirmNum + "]";
	}
	
	

}

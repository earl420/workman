package com.wework.workman.common;

public class Reference {
	
	private String docNum;
	private String empNum1;
	private String empNum2;
	private String empNum3;
	private String empNum4;
	
	public Reference() {
		
	}

	public Reference(String docNum, String empNum1, String empNum2, String empNum3, String empNum4) {
		super();
		this.docNum = docNum;
		this.empNum1 = empNum1;
		this.empNum2 = empNum2;
		this.empNum3 = empNum3;
		this.empNum4 = empNum4;
	}

	public String getDocNum() {
		return docNum;
	}

	public void setDocNum(String docNum) {
		this.docNum = docNum;
	}

	public String getEmpNum1() {
		return empNum1;
	}

	public void setEmpNum1(String empNum1) {
		this.empNum1 = empNum1;
	}

	public String getEmpNum2() {
		return empNum2;
	}

	public void setEmpNum2(String empNum2) {
		this.empNum2 = empNum2;
	}

	public String getEmpNum3() {
		return empNum3;
	}

	public void setEmpNum3(String empNum3) {
		this.empNum3 = empNum3;
	}

	public String getEmpNum4() {
		return empNum4;
	}

	public void setEmpNum4(String empNum4) {
		this.empNum4 = empNum4;
	}

	@Override
	public String toString() {
		return "Reference [docNum=" + docNum + ", empNum1=" + empNum1 + ", empNum2=" + empNum2 + ", empNum3=" + empNum3
				+ ", empNum4=" + empNum4 + "]";
	}
	
	

}

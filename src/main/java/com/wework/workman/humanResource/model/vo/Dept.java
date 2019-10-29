package com.wework.workman.humanResource.model.vo;

public class Dept {
	
	private int deptNum;
	private String deptName;
	
	public Dept() {
		
	}

	public Dept(int deptNum, String deptName) {
		super();
		this.deptNum = deptNum;
		this.deptName = deptName;
	}

	public int getDeptNum() {
		return deptNum;
	}

	public void setDeptNum(int deptNum) {
		this.deptNum = deptNum;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	@Override
	public String toString() {
		return "Dept [deptNum=" + deptNum + ", deptName=" + deptName + "]";
	}
		
}

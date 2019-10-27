package com.wework.workman.humanResource.model.vo;

public class Department {
	
	private int deptNum;
	private String deptName;
	private String empNum;
	private String empName;
	
	public Department() {
		
	}

	public Department(int deptNum, String deptName, String empNum, String empName) {
		super();
		this.deptNum = deptNum;
		this.deptName = deptName;
		this.empNum = empNum;
		this.empName = empName;
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

	public String getEmpNum() {
		return empNum;
	}

	public void setEmpNum(String empNum) {
		this.empNum = empNum;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	@Override
	public String toString() {
		return "Department [deptNum=" + deptNum + ", deptName=" + deptName + ", empNum=" + empNum + ", empName="
				+ empName + "]";
	}
	
	

}

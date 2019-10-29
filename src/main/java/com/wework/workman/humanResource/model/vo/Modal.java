package com.wework.workman.humanResource.model.vo;

public class Modal {
	
	
	private String empNum;		// 사원번호
	private String empName;  	// 이름
	private String gradeName; 	// 직급
	private String deptName;  	// 부서명
	
	public Modal() {
		
	}

	public Modal(String empNum, String empName, String gradeName, String deptName) {
		super();
		this.empNum = empNum;
		this.empName = empName;
		this.gradeName = gradeName;
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

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	@Override
	public String toString() {
		return "Modal [empNum=" + empNum + ", empName=" + empName + ", gradeName=" + gradeName + ", deptName="
				+ deptName + "]";
	}
}

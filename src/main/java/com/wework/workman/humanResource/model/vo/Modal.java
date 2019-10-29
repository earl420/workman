package com.wework.workman.humanResource.model.vo;

public class Modal {
	
	private String empName;  	//이름
	private String gradeName; 	//직급
	private String deptName;  	//부서명
	
	public Modal() {
		
	}

	public Modal(String empName, String gradeName, String deptName) {
		super();
		this.empName = empName;
		this.gradeName = gradeName;
		this.deptName = deptName;
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
		return "Modal [empName=" + empName + ", gradeName=" + gradeName + ", deptName=" + deptName + "]";
	}
	
	
}

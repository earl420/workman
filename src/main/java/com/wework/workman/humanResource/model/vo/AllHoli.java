package com.wework.workman.humanResource.model.vo;

public class AllHoli {
	
	private String empNum;
	private String empName;
	private String deptName;
	private int holiCount;
	private int holiLeft;
	
	public AllHoli() {
		
	}

	public AllHoli(String empNum, String empName, String deptName, int holiCount, int holiLeft) {
		super();
		this.empNum = empNum;
		this.empName = empName;
		this.deptName = deptName;
		this.holiCount = holiCount;
		this.holiLeft = holiLeft;
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

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public int getHoliCount() {
		return holiCount;
	}

	public void setHoliCount(int holiCount) {
		this.holiCount = holiCount;
	}

	public int getHoliLeft() {
		return holiLeft;
	}

	public void setHoliLeft(int holiLeft) {
		this.holiLeft = holiLeft;
	}

	@Override
	public String toString() {
		return "AllHoli [empNum=" + empNum + ", empName=" + empName + ", deptName=" + deptName + ", holiCount="
				+ holiCount + ", holiLeft=" + holiLeft + "]";
	}


}

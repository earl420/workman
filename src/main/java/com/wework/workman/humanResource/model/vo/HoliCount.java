package com.wework.workman.humanResource.model.vo;

public class HoliCount {
	
	private String empNum;
	private int holiCount;
	private int holiLeft;
	private String holiYear;
	
	public HoliCount() {
		
	}

	public HoliCount(String empNum, int holiCount, int holiLeft, String holiYear) {
		super();
		this.empNum = empNum;
		this.holiCount = holiCount;
		this.holiLeft = holiLeft;
		this.holiYear = holiYear;
	}

	public String getEmpNum() {
		return empNum;
	}

	public void setEmpNum(String empNum) {
		this.empNum = empNum;
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

	public String getHoliYear() {
		return holiYear;
	}

	public void setHoliYear(String holiYear) {
		this.holiYear = holiYear;
	}

	@Override
	public String toString() {
		return "HoliCount [empNum=" + empNum + ", holiCount=" + holiCount + ", holiLeft=" + holiLeft + ", holiYear="
				+ holiYear + "]";
	}

}

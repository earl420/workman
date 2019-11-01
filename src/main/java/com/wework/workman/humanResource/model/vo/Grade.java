package com.wework.workman.humanResource.model.vo;

public class Grade {
	
	private int gradeNum;
	private String gradeName;
	
	public Grade() {
		
	}

	public Grade(int gradeNum, String gradeName) {
		super();
		this.gradeNum = gradeNum;
		this.gradeName = gradeName;
	}

	public int getGradeNum() {
		return gradeNum;
	}

	public void setGradeNum(int gradeNum) {
		this.gradeNum = gradeNum;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	@Override
	public String toString() {
		return "Grade [gradeNum=" + gradeNum + ", gradeName=" + gradeName + "]";
	}
	
	

}

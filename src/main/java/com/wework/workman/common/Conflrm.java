package com.wework.workman.common;

import java.sql.Date;

public class Conflrm {
	
	public String confirmNum;		//결제번호
	public String confirmEmp1;		//결제자1
	public String confirmEmp2;		//결제자2
	public String confirmEmp3;		//결제자3
	public String confirmEmp4;		//결제자4
	public Date confirmDate1;		//결제1일시
	public Date confirmDate2;		//결제2일시
	public Date confirmDate3;		//결제3일시
	public Date confirmDate4;		//결제4일시
	
	public Conflrm() {
		
	}

	public Conflrm(String confirmNum, String confirmEmp1, String confirmEmp2, String confirmEmp3, String confirmEmp4,
			Date confirmDate1, Date confirmDate2, Date confirmDate3, Date confirmDate4) {
		super();
		this.confirmNum = confirmNum;
		this.confirmEmp1 = confirmEmp1;
		this.confirmEmp2 = confirmEmp2;
		this.confirmEmp3 = confirmEmp3;
		this.confirmEmp4 = confirmEmp4;
		this.confirmDate1 = confirmDate1;
		this.confirmDate2 = confirmDate2;
		this.confirmDate3 = confirmDate3;
		this.confirmDate4 = confirmDate4;
	}

	public String getConfirmNum() {
		return confirmNum;
	}

	public void setConfirmNum(String confirmNum) {
		this.confirmNum = confirmNum;
	}

	public String getConfirmEmp1() {
		return confirmEmp1;
	}

	public void setConfirmEmp1(String confirmEmp1) {
		this.confirmEmp1 = confirmEmp1;
	}

	public String getConfirmEmp2() {
		return confirmEmp2;
	}

	public void setConfirmEmp2(String confirmEmp2) {
		this.confirmEmp2 = confirmEmp2;
	}

	public String getConfirmEmp3() {
		return confirmEmp3;
	}

	public void setConfirmEmp3(String confirmEmp3) {
		this.confirmEmp3 = confirmEmp3;
	}

	public String getConfirmEmp4() {
		return confirmEmp4;
	}

	public void setConfirmEmp4(String confirmEmp4) {
		this.confirmEmp4 = confirmEmp4;
	}

	public Date getConfirmDate1() {
		return confirmDate1;
	}

	public void setConfirmDate1(Date confirmDate1) {
		this.confirmDate1 = confirmDate1;
	}

	public Date getConfirmDate2() {
		return confirmDate2;
	}

	public void setConfirmDate2(Date confirmDate2) {
		this.confirmDate2 = confirmDate2;
	}

	public Date getConfirmDate3() {
		return confirmDate3;
	}

	public void setConfirmDate3(Date confirmDate3) {
		this.confirmDate3 = confirmDate3;
	}

	public Date getConfirmDate4() {
		return confirmDate4;
	}

	public void setConfirmDate4(Date confirmDate4) {
		this.confirmDate4 = confirmDate4;
	}

	@Override
	public String toString() {
		return "Conflrm [confirmNum=" + confirmNum + ", confirmEmp1=" + confirmEmp1 + ", confirmEmp2=" + confirmEmp2
				+ ", confirmEmp3=" + confirmEmp3 + ", confirmEmp4=" + confirmEmp4 + ", confirmDate1=" + confirmDate1
				+ ", confirmDate2=" + confirmDate2 + ", confirmDate3=" + confirmDate3 + ", confirmDate4=" + confirmDate4
				+ "]";
	}

	
}

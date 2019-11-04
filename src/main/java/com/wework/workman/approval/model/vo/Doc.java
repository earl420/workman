package com.wework.workman.approval.model.vo;

import java.sql.Date;

public class Doc{

	private String docNum;			//문서 번호
	private String docEmpName;		//등록자 이름
	private String docGradeName;	//등록자 직급
	private String docTitle;		//문서 제목
	private String docContent;		//문서 내용
	private Date docDate;			//문서 등록일
	private String docStatus;		//문서 상태
	private String confirmNum;		//결재번호
	public String confirmEmp1;		//결제자1
	public String confirmEmp2;		//결제자2
	public String confirmEmp3;		//결제자3
	public String confirmEmp4;		//결제자4
	public Date confirmDate1;		//결제1일시
	public Date confirmDate2;		//결제2일시
	public Date confirmDate3;		//결제3일시
	public Date confirmDate4;		//결제4일시
	public String empNum1;			//참조자1
	public String empNum2;			//참조자2
	public String empNum3;			//참조자3
	public String empNum4;			//참조자3
	
	public Doc() {
		
	}

	public Doc(String docNum, String docEmpName, String docGradeName, String docTitle, String docContent, Date docDate,
			String docStatus, String confirmNum, String confirmEmp1, String confirmEmp2, String confirmEmp3,
			String confirmEmp4, Date confirmDate1, Date confirmDate2, Date confirmDate3, Date confirmDate4,
			String empNum1, String empNum2, String empNum3, String empNum4) {
		super();
		this.docNum = docNum;
		this.docEmpName = docEmpName;
		this.docGradeName = docGradeName;
		this.docTitle = docTitle;
		this.docContent = docContent;
		this.docDate = docDate;
		this.docStatus = docStatus;
		this.confirmNum = confirmNum;
		this.confirmEmp1 = confirmEmp1;
		this.confirmEmp2 = confirmEmp2;
		this.confirmEmp3 = confirmEmp3;
		this.confirmEmp4 = confirmEmp4;
		this.confirmDate1 = confirmDate1;
		this.confirmDate2 = confirmDate2;
		this.confirmDate3 = confirmDate3;
		this.confirmDate4 = confirmDate4;
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

	public String getDocEmpName() {
		return docEmpName;
	}

	public void setDocEmpName(String docEmpName) {
		this.docEmpName = docEmpName;
	}

	public String getDocGradeName() {
		return docGradeName;
	}

	public void setDocGradeName(String docGradeName) {
		this.docGradeName = docGradeName;
	}

	public String getDocTitle() {
		return docTitle;
	}

	public void setDocTitle(String docTitle) {
		this.docTitle = docTitle;
	}

	public String getDocContent() {
		return docContent;
	}

	public void setDocContent(String docContent) {
		this.docContent = docContent;
	}

	public Date getDocDate() {
		return docDate;
	}

	public void setDocDate(Date docDate) {
		this.docDate = docDate;
	}

	public String getDocStatus() {
		return docStatus;
	}

	public void setDocStatus(String docStatus) {
		this.docStatus = docStatus;
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
		return "Doc [docNum=" + docNum + ", docEmpName=" + docEmpName + ", docGradeName=" + docGradeName + ", docTitle="
				+ docTitle + ", docContent=" + docContent + ", docDate=" + docDate + ", docStatus=" + docStatus
				+ ", confirmNum=" + confirmNum + ", confirmEmp1=" + confirmEmp1 + ", confirmEmp2=" + confirmEmp2
				+ ", confirmEmp3=" + confirmEmp3 + ", confirmEmp4=" + confirmEmp4 + ", confirmDate1=" + confirmDate1
				+ ", confirmDate2=" + confirmDate2 + ", confirmDate3=" + confirmDate3 + ", confirmDate4=" + confirmDate4
				+ ", empNum1=" + empNum1 + ", empNum2=" + empNum2 + ", empNum3=" + empNum3 + ", empNum4=" + empNum4
				+ "]";
	}

	
	
	
	
}

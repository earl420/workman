package com.wework.workman.humanResource.model.service;

import java.util.ArrayList;

import com.wework.workman.common.Attachment;
import com.wework.workman.common.PageInfo;
import com.wework.workman.humanResource.model.vo.Department;
import com.wework.workman.humanResource.model.vo.Dept;
import com.wework.workman.humanResource.model.vo.Employee;
import com.wework.workman.humanResource.model.vo.Grade;
import com.wework.workman.humanResource.model.vo.Modal;
import com.wework.workman.humanResource.model.vo.Notice;

public interface HumanResourceService {
	
	// 전체 공지사항 리스트 갯수
	int getnListCount();
	
	// 전체 공지사항 리스트
	ArrayList<Notice> selectnList(PageInfo pi);
	
	// 전체 공지사항 상세조회
	Notice getnDetail(String noticeNum);
	
	// 공지사항 중 인사(301) 관련 공지사항 갯수 조회
	int gethListCount();
	
	// 공지사항 중 인사(301) 관련 공지사항 리스트 조회
	ArrayList<Notice> selectHRnList(PageInfo pi);
	
	// 공지사항 상세조회
	Notice gethrnDetail(String noticeNum);
	
	// 공지사항 작성
	int insertNotice(Notice n);
	
	// 공지사항 수정
	int updateNotice(Notice n);
	
	// 첨부파일 업로드
	int insertAtt(Attachment a);
	
	// 조직도 조회
	ArrayList<Department> getDeptList();
	
	// 조직도의 부서별 직원 조회
	ArrayList<Employee> getEmp();
	
	// 조직별 직원 수 조회
	ArrayList<Employee> getEmpCount();
	
	// modal dept리스트 불러오기
	ArrayList<Dept> selectModaDeptlList();
	
	// modal grade리스트 불러오기
	ArrayList<Grade> selectModalGradeList();
		
	// modal emp리스트 불러오기
	ArrayList<Modal> selectModalEmpList();
	
	// modal에서 선택된 empNum의 Modal 리스트 불러오기
	ArrayList<Modal> selectModalList(String[] empList);
	
	// 부서 추가
	int addDept(String deptName);
	
	// 부서명 수정
	int updateDept(Dept d);
	
	// 부서 삭제
	int  deleteDept(int deptNum);
	
	// 직원 등록
	int insertEmp(Employee e);

	// 부서 이름으로 부서 번호 가져오기
	int getDeptNum(String deptName);
	
	// 직급 이름으로 직급 번호 가져오기
	int getGradeNum(String gradeName);
	
	// 부서 이름으로 직원 불러오기
	ArrayList<Employee> elistByName(String deptName);
	
	// 인사/인사관리/ 사용자 관리 -> 수정하기 버튼 클릭 시(직급, 부서 수정)
	int updateEmp(Employee e);
}

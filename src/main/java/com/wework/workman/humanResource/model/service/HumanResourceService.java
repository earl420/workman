package com.wework.workman.humanResource.model.service;

import java.util.ArrayList;

import com.wework.workman.common.Attachment;
import com.wework.workman.common.PageInfo;
import com.wework.workman.humanResource.model.vo.Department;
import com.wework.workman.humanResource.model.vo.Employee;
import com.wework.workman.humanResource.model.vo.Notice;

public interface HumanResourceService {
	
	// 공지사항 중 인사(301) 관련 공지사항 갯수 조회
	int gethListCount();
	
	// 공지사항 중 인사(301) 관련 공지사항 리스트 조회
	ArrayList<Notice> selectHRnList(PageInfo pi);
	
	// 공지사항 상세조회
	Notice gethrnDetail(String noticeNum);
	
	// 공지사항 작성
	int insertNotice(Notice n);
	
	// 첨부파일 업로드
	int insertAtt(Attachment a);
	
	// 조직도 조회
	ArrayList<Department> getDeptList();
	
	// 조직도의 부서별 직원 조회
	ArrayList<Employee> getEmp();
	
	// 조직별 직원 수 조회
	ArrayList<Employee> getEmpCount();

}

package com.wework.workman.calendar.model.service;

import java.util.ArrayList;

import com.wework.workman.calendar.model.vo.Calendar;

public interface CalendarService {

		int insertCalendar(Calendar c);  // 일정등록
		 
		int updateCalendar(String empNum); // 일정수정
		
		Calendar calendarDetail(String empNum); // 일정 상세보기
		
		int deleteCalendar(String empNum); // 일정 삭제
		
		
		
		ArrayList<Calendar> selectList(int deptNum); // 리스트 조회
}

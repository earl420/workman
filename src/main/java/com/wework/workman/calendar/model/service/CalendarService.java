package com.wework.workman.calendar.model.service;

import com.wework.workman.calendar.model.vo.Calendar;

public interface CalendarService {

		int insertCalendar(Calendar c); // 일정등록
		
		int updateCalendar(int empNum); // 일정수정
		
		Calendar calendarDetail(int empNum); // 일정상세보기
		
		int deleteCalendar(int empNum); // 일정삭제
}

package com.wework.workman.calendar.model.service;

import com.wework.workman.calendar.model.vo.Calendar;

public interface CalendarService {

		int insertCalendar(Calendar c); // 일정등록
		
		int updateCalendar(int _id); // 일정수정
		
		Calendar CalendarDetail(int _id); // 일정상세보기
		
		int deleteCalendar(int _id); // 일정삭제
}

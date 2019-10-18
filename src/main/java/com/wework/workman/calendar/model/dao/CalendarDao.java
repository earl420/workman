package com.wework.workman.calendar.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.calendar.model.vo.Calendar;

@Repository("calendarDao")
public class CalendarDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 일정등록
	public int insertCalendar(Calendar c) {
		return sqlSession.insert("calendar-mapper.insertCalendar", c);
	}
	
	// 일정수정
	public int updateCalendar(int _id) {
		return sqlSession.update("calendar-mapper.updateCalendar", _id);
	}
	
	// 일정상세보기
	public Calendar CalendarDetail(int _id) {
		return sqlSession.selectOne("calendar-mapper.CalendarDetail", _id);
	}
	
	// 일정삭제
	public int deleteCalendar(int _id) {
		return sqlSession.update("calendar-mapper.deleteCalendar", _id);
	}
}



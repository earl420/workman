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
		return sqlSession.insert("calendarMapper.insertCalendar", c);
	}
	
	// 일정수정
	public int updateCalendar(int empNum) {
		return sqlSession.update("calendarMapper.updateCalendar", empNum);
	}
	
	// 상세보기
	public Calendar calendarDetail(int empNum) {
		return sqlSession.selectOne("calendarMapper.calendarDetail", empNum);
	}
	
	// 일정삭제
	public int deleteCalendar(int empNum) {
		return sqlSession.update("calendarMapper.deleteCalendar", empNum);
	}
}



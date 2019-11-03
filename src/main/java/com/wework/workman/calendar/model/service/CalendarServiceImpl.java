package com.wework.workman.calendar.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wework.workman.calendar.model.dao.CalendarDao;
import com.wework.workman.calendar.model.vo.Calendar;

@Service("calendarService")
public class CalendarServiceImpl implements CalendarService {
	@Resource(name="calendarDao")
	private CalendarDao cDao;

	@Override // 일정등록
	public int insertCalendar(Calendar c) {
		
		return cDao.insertCalendar(c);
	}

	@Override // 일정수정
	public int updateCalendar(String empNum) {
	
		return cDao.updateCalendar(empNum);
	}

	/*
	 * @Override // 상세보기 public Calendar calendarDetail(String empNum) {
	 * 
	 * return cDao.calendarDetail(empNum); }
	 */

	@Override // 삭제
	public int deleteCalendar(String empNum) {
		
		return cDao.deleteCalendar(empNum);
	}

	@Override // 상세 조회
	public ArrayList<Calendar> selectList(int deptNum) {
		
		return cDao.selectList(deptNum);
	}

}

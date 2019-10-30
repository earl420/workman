package com.wework.workman.calendar.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.calendar.model.vo.Attendance;

@Repository("attendanceDao")
public class AttendanceDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
		public int insertAttendance(Attendance a) {
			return sqlSession.insert("calendarMapper.Attendance", a);
		}
		
		public int updateAttendance(Attendance a) {
			return sqlSession.update("calendarMapper.updateAttendance", a);
		}
}

package com.wework.workman.calendar.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.calendar.model.vo.Attendance;

@Repository("attendanceDao")
public class AttendanceDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 출근등록
		public int insertAttendance(Attendance a) {
			return sqlSession.insert("calendar-mapper.insertAttend", a);
		}
		
	// 퇴근등록
		public int insertOut(Attendance a) {
			return sqlSession.insert("calendar-mapper.insertAttend", a);
		}
}

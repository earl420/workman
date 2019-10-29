package com.wework.workman.calendar.model.service;

import com.wework.workman.calendar.model.vo.Attendance;

public interface AttendanceService {
	
	int insertAttendance(Attendance a); // 출근등록
	
	int insertOut(Attendance a); // 퇴근등록

}

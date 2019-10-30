package com.wework.workman.calendar.model.service;

import com.wework.workman.calendar.model.vo.Attendance;

public interface AttendanceService {
	
	int insertAttendance(Attendance a);
	
	int updateAttendance(Attendance a);

}

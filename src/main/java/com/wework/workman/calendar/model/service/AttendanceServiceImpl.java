package com.wework.workman.calendar.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wework.workman.calendar.model.dao.AttendanceDao;
import com.wework.workman.calendar.model.vo.Attendance;

@Service("attendanceService")
public class AttendanceServiceImpl implements AttendanceService {
	@Resource(name="attendanceDao")
	private AttendanceDao aDao;
	
	@Override // 출석등록
	public int insertAttendance(Attendance a) {
		
		return aDao.insertAttendance(a);
	}

	@Override // 퇴근
	public int insertOut(Attendance a) {
		
		return aDao.insertOut(a);
	}

}

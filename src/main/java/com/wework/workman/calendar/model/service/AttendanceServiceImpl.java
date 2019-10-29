package com.wework.workman.calendar.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wework.workman.calendar.model.dao.AttendanceDao;
import com.wework.workman.calendar.model.vo.Attendance;

@Service("attendanceService")
public class AttendanceServiceImpl implements AttendanceService {
	@Resource(name="attendanceDao")
	private AttendanceDao aDao;
	
	@Override 
	public int insertAttendance(Attendance a) {
		
		return aDao.insertAttendance(a);
	}

}

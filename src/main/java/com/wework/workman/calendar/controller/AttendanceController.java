package com.wework.workman.calendar.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wework.workman.calendar.model.service.AttendanceService;
import com.wework.workman.calendar.model.vo.Attendance;

public class AttendanceController {
	@Resource(name="attendanceService")
	private AttendanceService aService;
	
	// 출근
	@RequestMapping("attend.wo")
	public String Attendance(Attendance a, Model model,
							   @RequestParam("empNum") int empNum,
							   @RequestParam("att_date") Date att_date,
							   @RequestParam("time_on") Date time_on) {
		
		int result = aService.insertAttendance(a);
		
		if(result > 0) { //성공
			
			return "calendar/calendarDetailView";
		
		}else { // 실패
			
			System.out.println("출근실패");
			return "common/errorPage";
			
		}
	}
	
	// 퇴근
	@RequestMapping("out.wo")
	public String Out(Attendance a, Model model,
							   @RequestParam("empNum") int empNum,
							   @RequestParam("att_date") Date att_date,
							   @RequestParam("time_off") Date time_off) {
		
		int result = aService.insertOut(a);
		
		if(result > 0) { // 성공
			
			return "calendar/calendarDetailView";
		
		}else { // 실패
			
			System.out.println("퇴근실패");
			return "common/errorPage";
			
		}
	}
}

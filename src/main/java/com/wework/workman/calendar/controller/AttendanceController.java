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
	
	// Ãâ±Ù
	@RequestMapping("attend.wo")
	public String Attendance(Attendance a, Model model,
							   @RequestParam("empNum") int empNum,
							   @RequestParam("att_date") Date att_date,
							   @RequestParam("time_on") Date time_on) {
		
		int result = aService.insertAttendance(a);
		
		if(result > 0) { //Ãâ¼®µÊ
			
			return "calendar/calendarDetailView";
		
		}else { // ¾ÈµÊ
			
			System.out.println("Ãâ¼® ½ÇÆÐ");
			return "common/errorPage";
			
		}
	}
	
	// Åð±Ù
	@RequestMapping("out.wo")
	public String Out(Attendance a, Model model,
							   @RequestParam("empNum") int empNum,
							   @RequestParam("att_date") Date att_date,
							   @RequestParam("time_off") Date time_off) {
		
		int result = aService.insertOut(a);
		
		if(result > 0) { //Åð±ÙµÊ
			
			return "calendar/calendarDetailView";
		
		}else { // ¾ÈµÊ
			
			System.out.println("Åð±Ù ½ÇÆÐ");
			return "common/errorPage";
			
		}
	}
}

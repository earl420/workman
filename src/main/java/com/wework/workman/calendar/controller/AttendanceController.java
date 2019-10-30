package com.wework.workman.calendar.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wework.workman.calendar.model.service.AttendanceService;
import com.wework.workman.calendar.model.vo.Attendance;

@Controller
public class AttendanceController {
	@Resource(name="attendanceService")
	private AttendanceService aService;
	
	// 출퇴근
	@RequestMapping("attend.wo")
	public String Attendance(Attendance a, Model model) {
		System.out.println(a);
		
		int result = aService.insertAttendance(a);
		
		if(result > 0) { //성공
			
			return "home";
		
		}else { // 실패
			
			System.out.println("실패");
			return "common/errorPage";
			
		}
	}

}

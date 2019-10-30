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
	public String Attendance(Attendance a, Model model, String flag) {
		System.out.println(a);
		
		int result = 1;
		
		if(flag.equals("출")) {
			result = aService.insertAttendance(a);
			flag="퇴";
		}else if (flag.equals("퇴")) {
			result = aService.updateAttendance(a);
			flag="출";
		}
		model.addAttribute("flag",flag);
		if(result > 0) { 
			 return "redirect:home.wo";
			 }
		 else {
			  model.addAttribute("msg", "실패!!"); 
			  return "common/404error"; 
		 }
		
	}

}

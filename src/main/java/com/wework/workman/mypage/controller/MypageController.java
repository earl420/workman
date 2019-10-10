package com.wework.workman.mypage.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wework.workman.mypage.model.service.MypageService;

@Controller
public class MypageController {
	
	@Resource(name="mypageService")
	private MypageService mService;
	

	@RequestMapping("empInfo.wo")
	public String empInfo() {
		return "mypage/empInfo.jsp";
	}
	
	@RequestMapping("attendance.wo")
	public String attendance() {
		return "mypage/attendance.jsp";
	}
	
	@RequestMapping("diligenceAndLaziness.wo")
	public String diligenceAndLaziness() {
		return "diligenceAndLaziness.jsp";
	}
	
	@RequestMapping("annualLeave.wo")
	public String annualLeave() {
		return "annualLeave.jsp";
	}
	
	
}



package com.wework.workman.mypage.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.wework.workman.mypage.model.service.MypageService;

@SessionAttributes("")
@Controller
public class MypageController {
	
	@Resource(name="mypageService")
	private MypageService mService;
	

	@RequestMapping("empInfo.wo")
	public String empInfoView() {
		return "myPage/empInfo";
	}
	
	@RequestMapping("attendance.wo")
	public String attendance() {
		return "myPage/attendance";
	}
	
	@RequestMapping("diligenceAndLaziness.wo")
	public String diligenceAndLaziness() {
		return "myPage/diligenceAndLaziness";
	}
	
	@RequestMapping("annualLeave.wo")
	public String annualLeave() {
		return "myPage/annualLeave";
	}
	
	
}



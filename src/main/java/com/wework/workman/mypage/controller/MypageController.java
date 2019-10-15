package com.wework.workman.mypage.controller;

import javax.annotation.Resource;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.wework.workman.hunamResource.model.vo.HumanResource;
import com.wework.workman.mypage.model.service.MypageService;
import com.wework.workman.mypage.model.vo.Employee;

@SessionAttributes("")
@Controller
public class MypageController {
	
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Resource(name="mypageService")
	private MypageService mService;
	
	
	@RequestMapping("myPageView.wo")
	public String myPageView() {
		return "myPage/myPageView";
	}

	@RequestMapping("empInfo.wo")
	public String empInfoView() {
		return "myPage/empInfo";
	}
	
	@RequestMapping("attendance.wo")
	public String attendance() {
		return "myPage/attendance";
	}
	
	@RequestMapping("changePwd.wo")
	public String annualLeave() {
		return "myPage/ChangePwd";
	}
	
	
	/**
	 * 로그인
	 * @param h
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String loginEmp(Employee m, Model model) {
		
		HumanResource loginMan = mService.loginMan(m);
		
		/*
		 * if(loginMan != null && bcryptPasswordEncoder.matches(m.getEmpPwd(),
		 * loginMan.getPwd()) { model.addAttribute("loginMan", loginMan); return
		 * "redirect:home.wo";
		 * 
		 * }else {
		 * 
		 * 
		 * }
		 */
		
		return "redirect:home.wo";
		
	}
	
	/**
	 * 로그아웃
	 * @param status
	 * @return
	 */
	@RequestMapping("logout.wo")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:login.wo";
	}
	
	
	
}



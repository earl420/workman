package com.wework.workman.mypage.controller;

import javax.annotation.Resource;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.wework.workman.mypage.model.service.MypageService;
import com.wework.workman.mypage.model.vo.Employee;

@SessionAttributes("")
@Controller
public class MypageController {
	
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Resource(name="mypageService")
	private MypageService mService;
	
	/**
	 * 로그인 페이지
	 * @return
	 */
	@RequestMapping("loginPage.wo")
	public String loginPage() {
		return "myPage/login";
	}
	
	@RequestMapping("myPageView.wo")
	public String myPageView() {
		return "myPage/myPageView";
	}

	/**
	 * 정보 수정 페이지
	 * @return
	 */
	@RequestMapping("empInfo.wo")
	public String empInfoView() {
		return "myPage/empInfo";
	}
	
	/**
	 * 비밀번호 확인 페이지
	 * @return
	 */
	@RequestMapping("confirmPwdPage.wo")
	public String security() {
		return "myPage/confirmPwd";
	}
	
	/**
	 * 비밀번호 변경 페이지
	 * @return
	 */
	@RequestMapping("changePwdPage.wo")
	public String changePwdPage() {
		return "myPage/changePwd";
	}
	
	/**
	 * 사원번호 찾기 페이지
	 * @return
	 */
	@RequestMapping("findNoPage.wo")
	public String findNoPage() {
		return "myPage/findNo";
	}
	
	/**
	 * 비밀번호 찾기 페이지
	 * @return
	 */
	@RequestMapping("findPwdPage.wo")
	public String findPwdPage() {
		return "myPage/findPwd";
	}
	
	
	/**
	 * 로그인
	 * @param h
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String loginEmp(Employee m, Model model) {
		
		//Employee loginMan = mService.loginMan(m);
		
		/*
		 * if(loginMan != null && bcryptPasswordEncoder.matches(m.getEmpPwd(),
		 * loginMan.getPwd()) { model.addAttribute("loginMan", loginMan); return
		 * return "redirect:home.wo";
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
		return "redirect:loginPage.wo";
	}
	
	
	
}



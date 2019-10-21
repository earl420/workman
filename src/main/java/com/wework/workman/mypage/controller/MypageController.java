package com.wework.workman.mypage.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.wework.workman.mypage.model.service.MypageService;
import com.wework.workman.mypage.model.vo.Mypage;

@SessionAttributes("loginMan")
@Controller
public class MypageController {
	
	@Autowired
	private MypageService mService;
	
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	private Logger logger = LoggerFactory.getLogger(MypageController.class);

//	@Resource(name = "mypageService")
//	private MypageService mService;

	/**
	 * 로그인 페이지
	 * 
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
	 * 
	 * @return
	 */
	@RequestMapping("empInfo.wo")
	public String empInfoView() {
		return "myPage/empInfo";
	}

	/**
	 * 비밀번호 확인 페이지
	 * 
	 * @return
	 */
	@RequestMapping("confirmPwdPage.wo")
	public String security() {
		return "myPage/confirmPwd";
	}

	/**
	 * 비밀번호 변경 페이지
	 * 
	 * @return
	 */
	@RequestMapping("changePwdPage.wo")
	public String changePwdPage() {
		return "myPage/changePwd";
	}

	/**
	 * 사원번호 찾기 페이지
	 * 
	 * @return
	 */
	@RequestMapping("findNoPage.wo")
	public String findNoPage() {
		return "myPage/findNo";
	}

	/**
	 * 비밀번호 찾기 페이지
	 * 
	 * @return
	 */
	@RequestMapping("findPwdPage.wo")
	public String findPwdPage() {
		return "myPage/findPwd";
	}
	
	/**
	 * 비밀번호 찾기 변경
	 * @return
	 */
	@RequestMapping("returnPwdPage.wo")
	public String returnPwdPage() {
		return "myPage/returnPwdPage";
	}

	
	
	/**
	 * 암호화 전 로그인
	 * @param m
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "login.wo", method = RequestMethod.POST) 
	  public String loginEmp(Mypage m, Model model) {
		  
		  System.out.println("controller" + m.getNum());
		  Mypage loginMan = mService.loginMan(m);
		  
		  if(loginMan != null && loginMan.getPwd().equals(m.getPwd())) { 
			  model.addAttribute("loginMan", loginMan); 
			  System.out.println("OOO");
			  return "redirect:home.wo";
		  
		  }else {
			  System.out.println("XXX");
			  return "redirect:loginPage.wo"; 
		  }
	  
	  }
	
	/**
	 * 로그인
	 * 
	 * @param h
	 * @param model
	 * @return
	 */
	/*
	  @RequestMapping(value = "login.wo", method = RequestMethod.POST) 
	  public String loginEmp(Mypage m, Model model) {
		  
	  
		  Mypage loginMan = mService.loginMan(m);
		  
		  if(loginMan != null && bcryptPasswordEncoder.matches(m.getPwd(), loginMan.getPwd())) { 
			  model.addAttribute("loginMan", loginMan); 
			  return "redirect:home.wo";
		  
		  }else {
			  return "redirect:loginPage.wo"; 
		  }
	  
	  }
	 */

	/**
	 * 로그아웃
	 * 
	 * @param status
	 * @return
	 */
	@RequestMapping("logout.wo")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:loginPage.wo";
	}

}

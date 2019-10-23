package com.wework.workman.mypage.controller;


import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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
	 * 암호화 전 로그인
	 * @param m
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value = "login.wo", method = RequestMethod.POST) 
	public String loginEmp(Mypage m, Model model/* , HttpServletResponse response */){
		  
		  Mypage loginMan = mService.loginMan(m);
		  
		  if(loginMan != null && loginMan.getPwd().equals(m.getPwd())) { 
			  
			  model.addAttribute("loginMan", loginMan); 
			  return "redirect:home.wo";
		  
		  }else {
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
	
	
	/**
	 * 정보수정
	 * 
	 * @param m
	 * @param model
	 * @param address1
	 * @param address2
	 * @return
	 */
	@RequestMapping("empUpdate.wo")
	public String empUpdate(Mypage m, Model model,
							@RequestParam("address1") String address1,
							@RequestParam("address2") String address2) {
		
		
		m.setAddress(address1 + "," + address2);
		
		System.out.println(m.getPhone());
		System.out.println(m.getAddress());
		
		int result = mService.empUpdate(m);
		if(result > 0) {
			model.addAttribute("loginMan", m);
			return "redirect:home.wo";
		}else {
			
			return "myPage/empInfo";
		}
	}
	
	
	
	/**
	 * 비밀번호 찾기
	 * @return
	 */
	@RequestMapping("returnPwd.wo")
	public String returnPwdPage(Mypage m) {
		
		
		
		
		
		return "myPage/returnPwdPage";
	}
	
	
	/**
	 * 비밀번호 변경 전 확인
	 * @param pwd
	 * @param model
	 * @return
	 */
	@RequestMapping("confirmPwd.wo")
	public String confirmPwd(String pwd, Model model) {
		
			  
			  return "myPage/changePwd";
			  
		  
		
		
	}
	
	@RequestMapping(value = "findPwd.wo", method = RequestMethod.POST)
	public String findPwd() {
		
		return "00";
	}
		
		
		
		
	
	
	
	

}

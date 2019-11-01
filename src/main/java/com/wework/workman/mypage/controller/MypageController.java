package com.wework.workman.mypage.controller;


import java.io.IOException;
import java.util.ArrayList;

import javax.print.attribute.PrintRequestAttribute;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.wework.workman.account.model.vo.AcNotice;
import com.wework.workman.common.PageInfo;
import com.wework.workman.common.Pagination;
import com.wework.workman.mypage.model.service.MypageService;
import com.wework.workman.mypage.model.vo.EmpList;
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

	/**
	 * 마이 페이지
	 * @return
	 */
	@RequestMapping("mypageView.wo")
	public ModelAndView myPageView(ModelAndView mv,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		
		int empCount = mService.empCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, empCount);
		ArrayList<EmpList> list = mService.empList(pi);
		for (int i = 0; i < list.size(); i++) {
			String eNum = list.get(i).getNum().substring(6);
			list.get(i).setNum(eNum);
		}
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("myPage/mypageView");
		
		
		return mv;
	}
	

	/**
	 * 정보 수정 페이지
	 * 
	 * @return
	 */
	@RequestMapping("empInfo.wo")
	public String empInfoView(HttpSession session) {
		Mypage m = (Mypage)session.getAttribute("loginMan");

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
	public String loginEmp(Mypage m, Model model){
		  
		  Mypage loginMan = mService.loginMan(m);
		  if(loginMan != null && loginMan.getPwd().equals(m.getPwd())) { 
			  model.addAttribute("loginMan", loginMan);
			  model.addAttribute("login", "로그인 되었습니다.");
			  return "home";
		  
		  }else {
			  model.addAttribute("error", "사번 또는 비밀번호를 확인해주세요.");
			  return "myPage/login";
			  

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
		
		
		int result = mService.empUpdate(m);
		Mypage mp = (Mypage)model.getAttribute("loginMan");
		if(result > 0) {
			Mypage loginMan = mService.loginMan(mp);
			model.addAttribute("loginMan",loginMan);
			model.addAttribute("success", "정보가 수정 되었습니다.");
			return "home";
		}else {
			
			return "myPage/changePwd";
		}
	}
	
	/**
	 * 비번 변경 전 재확인
	 * @param pwd
	 * @param model
	 * @return
	 */
	@RequestMapping("confirmPwd.wo")
	public String confirmPwd(Model model, @RequestParam("pwd") String pwd) {
		
		Mypage mp = (Mypage)model.getAttribute("loginMan");
		
		if(pwd != null && pwd.equals(mp.getPwd())) { 
			Mypage loginMan = mService.loginMan(mp);
			model.addAttribute("success", "새로운 비밀번호를 설정해주세요");
			model.addAttribute("loginMan", loginMan);
			return "myPage/changePwd";
		}else {
			model.addAttribute("error", "비밀번호가 맞지 않습니다.");
			return "myPage/confirmPwd";
			  	
		}
		
	}
	
	/**
	 * 비번 수정
	 * @param model
	 * @param pwd
	 * @return
	 */
	@RequestMapping("changePwd.wo")
	public String changePwd(Model model, @RequestParam("pwd") String pwd) {
		
		Mypage m = (Mypage)model.getAttribute("loginMan");
		m.setPwd(pwd);
		int result = mService.pwdUpdate(m);		
		if(result > 0) {
			model.addAttribute("success", "비밀번호가 변경 되었습니다.");
			return "myPage/login";
		}else {
			
			return "myPage/changePwd";
		}
		
	}
	
	
	
	/**
	 * 비밀번호 찾기
	 * @param m
	 * @param model
	 * @return
	 */
	@RequestMapping("findPwd.wo")
	public String findPwd(Mypage m, Model model) {
		
		Mypage returnPwd = mService.findPwd(m);
		if(returnPwd != null) {
			model.addAttribute("returnPwd", returnPwd);
			return "myPage/returnPwd";
		}else {
			model.addAttribute("error", "사원정보가 맞지 않습니다.");
			return "myPage/findPwd";
			
		}
		
	}
	
	/**
	 * 새로운 비번
	 * @param pwd
	 * @param model
	 * @return
	 */
	@RequestMapping("returnPwd.wo")
	public String returnPwd(Mypage m, Model model) {
		
		System.out.println(m);
		int result = mService.returnPwd(m);
		if(result > 0) {
			model.addAttribute("success", "비밀번호가 변경 되었습니다.");
			return "myPage/login";
		}else {
			
			return "myPage/returnPwd";
		}
		
		
	}
	
	
		
	
	

}

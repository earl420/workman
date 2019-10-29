package com.wework.workman.calendar.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wework.workman.calendar.model.service.CalendarService;
import com.wework.workman.calendar.model.vo.Calendar;

@Controller("calendarController")
public class CalendarController {
	@Resource(name="calendarService")
	private CalendarService cService;
	
	
	// 캘린더
	@RequestMapping("calDetailView.wo") 
	public String calendarDetailView() { 
		
		return "calendar/calendarDetailViewNew"; 
	}
	  
	  
	// 상세보기
	@RequestMapping("cDetail.wo")
	public ModelAndView calendarDetail(int empNum, ModelAndView mv) {
		
		Calendar c = cService.calendarDetail(empNum);
		
		if(c != null) {
			mv.addObject("c",c).setViewName("calendar/CalendarDetailViewNew");
		}else {
			mv.addObject("msg","상세보기 실패").setViewName("common/404error");
		}
		
		return mv;
	}
  
	  
	
	  // 일정등록 뷰
	  @RequestMapping("calInsertView.wo") 
	  public String calendarInsertView() {
	  
	  return "calendar/calendarInsertView"; }
	 
	 
	
	  // 일정등록
	 @RequestMapping("calInsert.wo") 
	  public String insertBoard(Calendar c, HttpServletRequest request, Model model) {
	  
		 System.out.println(c);
		 
		int result = cService.insertCalendar(c);
		  
		 if(result > 0) { 
			 return "redirect:calDetail.wo"; 
			 }
		 else {
			  model.addAttribute("msg", "일정등록 실패!!"); 
			  return "common/404error"; 
		 }
		 
	  }
	

	// 수정하기
	@RequestMapping("calUpdate.wo")
	public String updateCalendar(int empNum, HttpServletRequest request) {
		
		int result = cService.updateCalendar(empNum);
		
		if(result > 0) {
			return "redirect:calDetail.wo";
		}else {
			return "common/404error";
		}
	}
	
	// 삭제하기
	@RequestMapping("calDelete.wo")
	public String CalendarDelete(int empNum, HttpServletRequest request) {
		
		int result = cService.deleteCalendar(empNum);
		
		if(result > 0) {
			return "redirect:calDetail.wo";
		}else {
			return "common/404error";
		}
	}
	

}

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
	
	
	// 캘린더 상세보기 뷰
	@RequestMapping("calDetailView.wo") 
	public String calendarDetailView() { 
		
		return "calendar/calendarDetailView"; 
	}
	  
	  
	// 일정 상세보기-----
	@RequestMapping("cDetail.wo")
	public ModelAndView CalendarDetail(int _id, ModelAndView mv) {
		
		Calendar c = cService.CalendarDetail(_id);
		
		if(c != null) {
			mv.addObject("c",c).setViewName("calendar/CalendarDetailView");
		}else {
			mv.addObject("msg","게시글 상세조회 실패").setViewName("common/404error");
		}
		
		return mv;
	}
  
	  
	// 일정등록 뷰
	 @RequestMapping("calInsertView.wo") 
	 public String calendarInsertView() { 
		 
		return "calendar/calendarInsertView"; 
	}
	 
	
	// 일정등록
	@RequestMapping("calInsert.wo")
	public String insertBoard(Calendar c, HttpServletRequest request, Model model) {
		
		int result = cService.insertCalendar(c);
		
		if(result > 0) {
			return "redirect:calDetail.wo";
		}else {
			model.addAttribute("msg", "게시판 작성 실패!!");
			return "common/404error";
		}
		
	}
	
	
	// 일정수정------
	@RequestMapping("calUpdate.wo")
	public String updateCalendar(int _id, HttpServletRequest request) {
		
		int result = cService.deleteCalendar(_id);
		
		if(result > 0) {
			return "redirect:calDetail.wo";
		}else {
			return "common/404error";
		}
	}
	
	// 일정삭제-------
	@RequestMapping("calDelete.wo")
	public String CalendarDelete(int _id, HttpServletRequest request) {
		
		int result = cService.deleteCalendar(_id);
		
		if(result > 0) {
			return "redirect:calDetail.wo";
		}else {
			return "common/404error";
		}
	}
}

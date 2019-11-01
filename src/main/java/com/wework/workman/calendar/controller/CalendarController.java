package com.wework.workman.calendar.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.wework.workman.calendar.model.service.CalendarService;
import com.wework.workman.calendar.model.vo.Calendar;
import com.wework.workman.mypage.model.vo.Mypage;

@Controller("calendarController")
public class CalendarController {
	@Resource(name="calendarService")
	private CalendarService cService;
	
	
	// 캘린더
	@RequestMapping("calDetailView.wo") 
	public String calendarDetailView() { 
		
		
		return "calendar/calendarDetailViewNew"; 
	}
	
	@ResponseBody
	@RequestMapping("calDetailView2.wo") 
	public String calDetail(HttpServletResponse response, HttpSession session) throws JsonIOException, IOException {
		
 		int deptNum= ((Mypage)session.getAttribute("loginMan")).getDeftNum();
 		
		ArrayList<Calendar> calendarList = cService.selectList(deptNum);
		
		//System.out.println(calendarList);
		
		/*
		 * ArrayList<FullCalendar> list = new ArrayList<FullCalendar>(); for (int i = 0;
		 * i < calendarList.size(); i++) { list.add(new FullCalendar((i+1)+"",
		 * calendarList.get(i).getDescription(), calendarList.get(i).getDescription(),
		 * calendarList.get(i).getStart(), calendarList.get(i).getEnd(),
		 * calendarList.get(i).getCtype(), "red", "white", true)); }
		 */
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(calendarList, response.getWriter());
		
		return "calendar/calendarDetailViewNew"; 
	}
	  
	  
	// 상세보기
	@RequestMapping("cDetail.wo")
	public ModelAndView calendarDetail(String empNum, ModelAndView mv) {
		
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
	  
	  return "calendar/calendarInsertView"; 
	  }
	 
	  // 일정등록
	 @RequestMapping("calInsert.wo") 
	public String insertCalendar(Calendar c, Model model) {
		 
		 int result = cService.insertCalendar(c);
			model.addAttribute("result", result);
			
		 //return "calendar/calendarDetailViewNew";
			return "redirect:calInsert.wo";
		 
		/*
		 * int result = cService.insertCalendar(c);
		 * 
		 * if(result > 0) { return "calendar/calendarInsertView"; } else {
		 * model.addAttribute("msg", "일정등록 실패!!"); return "common/404error"; }
		 */
		 
	  }
	

	// 수정하기
	@RequestMapping("calUpdate.wo")
	public String updateCalendar(String empNum) {
		
		int result = cService.updateCalendar(empNum);
		
		if(result > 0) {
			return "redirect:calDetail.wo";
		}else {
			return "common/404error";
		}
	}
	
	// 삭제하기
	@RequestMapping("calDelete.wo")
	public String CalendarDelete(String empNum) {
		
		int result = cService.deleteCalendar(empNum);
		
		if(result > 0) {
			return "redirect:calDetail.wo";
		}else {
			return "common/404error";
		}
	}
	

	 

}

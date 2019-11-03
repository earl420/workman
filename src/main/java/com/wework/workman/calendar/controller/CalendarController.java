package com.wework.workman.calendar.controller;


import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.wework.workman.calendar.model.service.CalendarService;
import com.wework.workman.calendar.model.vo.Calendar;
import com.wework.workman.mypage.model.vo.Mypage;

@Controller("calendarController")
public class CalendarController {
	@Resource(name = "calendarService")
	private CalendarService cService;

	// 캘린더
	@RequestMapping("calDetailView.wo")
	public String calendarDetailView(Model model, HttpSession session) {

		int deptNum = ((Mypage) session.getAttribute("loginMan")).getDeftNum();

		ArrayList<Calendar> calendarList = cService.selectList(deptNum);

		JSONArray jArr = new JSONArray();
		for (int i = 0; i < calendarList.size(); i++) {
			JSONObject obj = new JSONObject(); // obj.put("_id", i+1);
			obj.put("_id", i+1);
			obj.put("title", calendarList.get(i).getDescription());
			obj.put("description", calendarList.get(i).getDescription());
			String start = calendarList.get(i).getStart().toString();
			obj.put("start", start);
			String end = calendarList.get(i).getEnd().toString();
			obj.put("end", end);
			if (calendarList.get(i).getCtype().equals("전체")) {
				obj.put("color", "red");
				obj.put("textColor", "white");
			} else if (calendarList.get(i).getCtype().equals("부서")) {
				obj.put("color", "green");
				obj.put("textColor", "white");
			} else {
				obj.put("color", "blue");
				obj.put("textColor", "white");
			}

			jArr.add(obj);

		}

		model.addAttribute("list", jArr);

		return "calendar/calendarDetailViewNew";
	}

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("calDetailView2.wo") public void
	 * calDetail(HttpServletResponse response, HttpSession session) throws
	 * JsonIOException, IOException {
	 * 
	 * int deptNum= ((Mypage)session.getAttribute("loginMan")).getDeftNum();
	 * 
	 * ArrayList<Calendar> calendarList = cService.selectList(deptNum);
	 * 
	 * //System.out.println(calendarList);
	 * 
	 * 
	 * ArrayList<FullCalendar> list = new ArrayList<FullCalendar>(); for (int i = 0;
	 * i < calendarList.size(); i++) { list.add(new FullCalendar((i+1)+"",
	 * calendarList.get(i).getDescription(), calendarList.get(i).getDescription(),
	 * calendarList.get(i).getStart(), calendarList.get(i).getEnd(),
	 * calendarList.get(i).getCtype(), "red", "white", true)); }
	 * 
	 * 
	 * response.setContentType("application/json; charset=utf-8");
	 * 
	 * Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	 * gson.toJson(calendarList, response.getWriter()); }
	 * 
	 * 
	 * // 상세보기
	 * 
	 * @RequestMapping("cDetail.wo") public ModelAndView calendarDetail(String
	 * empNum, ModelAndView mv) {
	 * 
	 * Calendar c = cService.calendarDetail(empNum);
	 * 
	 * if(c != null) {
	 * mv.addObject("c",c).setViewName("calendar/CalendarDetailViewNew"); }else {
	 * mv.addObject("msg","상세보기 실패").setViewName("common/404error"); }
	 * 
	 * return mv; }
	 */

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

		return "redirect:calDetailView.wo";

	}

	// 수정하기
	@RequestMapping("calUpdate.wo")
	public String updateCalendar(String empNum) {

		int result = cService.updateCalendar(empNum);

		if (result > 0) {
			return "redirect:calDetail.wo";
		} else {
			return "common/404error";
		}
	}

	// 삭제하기
	@RequestMapping("calDelete.wo")
	public String CalendarDelete(String empNum) {

		int result = cService.deleteCalendar(empNum);

		if (result > 0) {
			return "redirect:calDetail.wo";
		} else {
			return "common/404error";
		}
	}

}

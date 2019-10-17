package com.wework.workman.calendar.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wework.workman.calendar.model.service.CalendarService;

@Controller("calendarController")
public class CalendarController {
	@Resource(name="calendarService")
	private CalendarService cService;
	
	
	@RequestMapping("calDetail.wo")
	public String calendarDetail() {
		return "calendar/calendarDetail";
	}
	
	@RequestMapping("calInsert.wo")
	public String calendarInsert() {
		return "calendar/calendarInsert";
	}
}

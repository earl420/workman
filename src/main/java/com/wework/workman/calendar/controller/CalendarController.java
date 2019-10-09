package com.wework.workman.calendar.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.wework.workman.calendar.model.service.CalendarService;

@Controller("calendarController")
public class CalendarController {
	@Resource(name="calendarService")
	private CalendarService cService;
}

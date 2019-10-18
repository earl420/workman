package com.wework.workman.approval.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wework.workman.approval.model.service.HolidayService;

@Controller
public class HolidayController {
	@Autowired
	private HolidayService hService;
	
	/** 휴가 작성
	 * @return
	 */
	@RequestMapping("holiDayWrite.wo")
	public String holiDayWrite() {
		
		return "approval/holiDayWrite";
	}
	
	/** 휴가 디테일 화면
	 * @return
	 */
	@RequestMapping("holiDayDetail.wo")
	public String holiDayDetail() {
		
		return "approval/holiDayDetail";
	}
}

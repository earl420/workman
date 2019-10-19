package com.wework.workman.approval.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wework.workman.approval.model.service.DraftService;

@Controller
public class DraftController {
	@Autowired
	private DraftService dService;
	
	/** 기안서 작성
	 * @return
	 */
	@RequestMapping("draftWrite.wo")
	public String draftWrite() {
		
		return "approval/draftWrite";
	}
	
	/** 기안서 디테일 화면
	 * @return
	 */
	@RequestMapping("draftDetail.wo")
	public String draftDetail() {
		
		return "approval/draftDetail";
	}
	
	
}

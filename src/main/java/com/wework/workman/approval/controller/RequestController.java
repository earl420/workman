package com.wework.workman.approval.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wework.workman.approval.model.service.RequestService;

@Controller
public class RequestController {
	@Autowired
	private RequestService rService;
	
	/** 품의서 작성
	 * @return
	 */
	@RequestMapping("requestWrite.wo")
	public String requestWrite() {
		
		return "approval/requestWrite";
	}
	
	/** 품의서 디테일화면
	 * @return
	 */
	@RequestMapping("requestDetail.wo")
	public String requestDetail() {
		
		return "approval/requestDetail";
	}
}

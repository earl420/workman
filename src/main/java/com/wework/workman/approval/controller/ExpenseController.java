package com.wework.workman.approval.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wework.workman.approval.model.service.ExpenseService;

@Controller
public class ExpenseController {
	@Autowired
	private ExpenseService eService;
	
	/** 지출결의서 작성
	 * @return
	 */
	@RequestMapping("expenseWrite.wo")
	public String expenseWrite() {
		
		return "approval/expenseWrite";
	}
}

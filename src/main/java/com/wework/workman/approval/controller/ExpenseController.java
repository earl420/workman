package com.wework.workman.approval.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.wework.workman.approval.model.service.ExpenseService;

@Controller
public class ExpenseController {
	@Resource(name = "expenseService")
	private ExpenseService eService;
}

package com.wework.workman.account.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.wework.workman.account.model.service.AccountService;

@Controller
public class AccountController {
	@Resource(name="accountService")
	private AccountService aService;
}

package com.wework.workman.account.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wework.workman.account.model.service.AccountService;

@Controller
public class AccountController {
	@Resource(name="accountService")
	private AccountService aService;
	
	@RequestMapping("acnoticeList.wo")
	public String accountList(@RequestParam(value = "page", required = false) String page) {
		System.out.println(page);
		return "account/aNotice";
	}
	
	@RequestMapping("aninsert.wo")
	public String aNoticeInsert() {
		return "account/insertNotice";
	}
	@RequestMapping("acDetail.wo")
	public String aNoticeDetail(@RequestParam(name = "aNo", defaultValue = "1") String aNo ) {
		System.out.println(aNo);
		return "account/detailNotice";
	}
}

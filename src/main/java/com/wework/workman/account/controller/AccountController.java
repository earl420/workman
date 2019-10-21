package com.wework.workman.account.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wework.workman.account.model.service.AccountService;
import com.wework.workman.account.model.vo.AcNotice;
import com.wework.workman.common.PageInfo;
import com.wework.workman.common.Pagination;

@Controller
public class AccountController {
	@Resource(name="accountService")
	private AccountService aService;
	
	@RequestMapping("acnoticeList.wo")
	public String accountList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value="search", required = false, defaultValue = "") String search1) {
		
		String[] search= search1.split(" ");
		
		int listCount = aService.getNoticeListCount(search);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<AcNotice> list = aService.noticeList(search,pi);
		
		
		return "account/aNotice";
	}
	
	@RequestMapping("aninsert.wo")
	public String aNoticeInsert(@RequestParam("noticeTitle") String noticeTitle,
			@RequestParam("noticeContent") String noticeContent,
			@RequestParam("noticeType") int noticeAccType,
			@RequestParam(value="insertDate", required = false) String insertDate,
			@RequestParam(value="type", required=false) String type,
			@RequestParam(value="term", required=false) String term) {
		
		
		
		return "account/insertNotice";
	}
	@RequestMapping("acDetail.wo")
	public String aNoticeDetail(@RequestParam(name = "aNo", defaultValue = "1") String aNo , Model model) {
		AcNotice notice = aService.noticeDetail(aNo);
		model.addAttribute("notice", notice);
		return "account/detailNotice";
	}
	@RequestMapping("salelist.wo")
	public String saleList(@RequestParam(name="currentPage", required = false) String currentPage) {
		return "account/saleList";
	}
	@RequestMapping("oslist.wo")
	public String osList(@RequestParam(name="currentPage", required = false) String currentPage) {
		return "account/osList";
	}
	@RequestMapping("fixturelist.wo")
	public String fixtureList(@RequestParam(name="currentPage", required = false) String currentPage) {
		return "account/fixtureList";
	}
	@RequestMapping("salarylist.wo")
	public String salaryList(@RequestParam(name="currentPage", required = false) String currentPage) {
		return "account/salaryList";
	}
	@RequestMapping("salarydetail.wo")
	public String salaryDetail(@RequestParam(name="sNo", required = false) int sNo) {
		return "account/salaryDetail";
	}
}

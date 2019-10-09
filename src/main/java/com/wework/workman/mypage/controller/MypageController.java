package com.wework.workman.mypage.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.wework.workman.mypage.model.service.MypageService;

@Controller
public class MypageController {
	@Resource(name="mypageService")
	private MypageService mService;
}

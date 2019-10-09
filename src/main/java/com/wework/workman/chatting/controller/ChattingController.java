package com.wework.workman.chatting.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.wework.workman.chatting.model.service.ChattingService;

@Controller("chattingController")
public class ChattingController {
	@Resource(name="chattingService")
	private ChattingService cService;
}

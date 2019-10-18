package com.wework.workman.chatting.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wework.workman.HomeController;

@Controller("chattingController")
public class ChattingController {
//	@Resource(name="chattingService")
//	private ChattingService cService;
	
	
	@RequestMapping(value="/chatting.wo", method = RequestMethod.GET)
	public String chattingMain() {
		return "chatting/chatting";
	}
	
	
	
	
}

package com.wework.workman.approval.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.wework.workman.approval.model.service.RequestService;

@Controller
public class RequestController {
	@Resource(name = "requestService")
	private RequestService rService;
}

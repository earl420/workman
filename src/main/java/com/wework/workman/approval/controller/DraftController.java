package com.wework.workman.approval.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.wework.workman.approval.model.service.DraftService;

@Controller
public class DraftController {
	@Resource(name = "draftService")
	private DraftService dService;
}

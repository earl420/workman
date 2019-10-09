package com.wework.workman.hunamResource.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.wework.workman.hunamResource.model.service.HumanResourceService;

@Controller
public class HumanResourceController {
	@Resource(name="humanResourceService")
	private HumanResourceService hService;
}

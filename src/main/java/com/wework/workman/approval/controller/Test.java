package com.wework.workman.approval.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wework.workman.humanResource.model.service.HumanResourceService;
import com.wework.workman.humanResource.model.vo.Modal;

@Controller
public class Test {

	@Resource(name="humanResourceService")
	private HumanResourceService hService;
	
	// 결제자 선택 리시트 
	@ResponseBody
	@RequestMapping(value= "submitEmpList.wo", produces="application/json; charset=utf-8")
	public String submitEmpList1(HttpServletResponse response,@RequestParam(value="empList[]",required=false) String[] empList) throws JsonProcessingException{
		
			
			System.out.println(empList);
			ArrayList<Modal> list = hService.selectModalList(empList);
			ObjectMapper mapper = new ObjectMapper();
			System.out.println(list);
			String jsonStr =  mapper.writeValueAsString(list);
			System.out.println(jsonStr);
			return jsonStr;
	}
}

package com.wework.workman.approval.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wework.workman.account.model.service.AccountService;
import com.wework.workman.account.model.vo.Partner;
import com.wework.workman.approval.model.service.ExpenseService;
import com.wework.workman.humanResource.model.service.HumanResourceService;
import com.wework.workman.humanResource.model.vo.Dept;
import com.wework.workman.humanResource.model.vo.Modal;

@Controller
public class ExpenseController {
	@Autowired
	private ExpenseService eService;
	
	@Resource(name="humanResourceService")
	private HumanResourceService hService;
	
	@Resource(name="accountService")
	private AccountService aService;
	
	/** 지출결의서 작성
	 * @return
	 */
	@RequestMapping("expenseWrite.wo")
	public ModelAndView expenseWrite(@RequestParam(value = "empNum", required = false) String empNum,
			@RequestParam(value = "empName", required = false)String empName, ModelAndView mv) {
		
		ArrayList<Dept> dlist = hService.selectModaDeptlList();
		ArrayList<Modal> mlist = hService.selectModalEmpList();
		ArrayList<Partner> plist = aService.partnerList();
		mv.addObject("mlist",mlist);
		mv.addObject("dlist",dlist);
		mv.addObject("plist",plist);
		mv.addObject("empNum", empNum);
		mv.addObject("empName", empName);
		mv.setViewName("approval/expenseWrite");
		return mv;
		
	}
	
	// 결제자 선택 리시트 
			@ResponseBody
			@RequestMapping(value= "submitEmpList7.wo", produces="application/json; charset=utf-8")
			public String submitEmpList1(HttpServletResponse response,@RequestParam(value="empList[]",required=false) String[] empList) throws JsonProcessingException{
				
					
				ArrayList<Modal> list = hService.selectModalList(empList);
				ObjectMapper mapper = new ObjectMapper();
				String jsonStr =  mapper.writeValueAsString(list);
				return jsonStr;
			}
			
			@ResponseBody
			@RequestMapping(value= "submitEmpList8.wo", produces="application/json; charset=utf-8")
			public String submitEmpList2(HttpServletResponse response,@RequestParam(value="empList2[]",required=false) String[] empList2) throws JsonProcessingException{
				
					
				ArrayList<Modal> list = hService.selectModalList(empList2);
				ObjectMapper mapper = new ObjectMapper();
				String jsonStr =  mapper.writeValueAsString(list);
				return jsonStr;
			}
			
	
	/** 지출결의서 디테일 화면
	 * @return
	 */
	@RequestMapping("expenseDetail.wo")
	public String expenseDetail() {
		
		return "approval/expenseDetail";
	}
}

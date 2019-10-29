package com.wework.workman.approval.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wework.workman.approval.model.service.DraftService;
import com.wework.workman.humanResource.model.service.HumanResourceService;
import com.wework.workman.humanResource.model.vo.Dept;
import com.wework.workman.humanResource.model.vo.Modal;

@Controller
public class DraftController {
	@Autowired
	private DraftService dService;
	
	@Resource(name="humanResourceService")
	private HumanResourceService hService;
	
	/** 기안서 작성
	 * @return
	 */
	@RequestMapping("draftWrite.wo")
	public ModelAndView draftWrite(@RequestParam(value = "empNum", required = false) String empNum,
			@RequestParam(value = "empName", required = false)String empName, ModelAndView mv) {
		
		ArrayList<Dept> dlist = hService.selectModaDeptlList();
		ArrayList<Modal> mlist = hService.selectModalEmpList();
		
		mv.addObject("mlist",mlist);
		mv.addObject("dlist",dlist);
		mv.addObject("empNum", empNum);
		mv.addObject("empName", empName);
		mv.setViewName("approval/draftWrite");
		return mv;
	}
	
	// 결제자 선택 리시트 
		@ResponseBody
		@RequestMapping(value= "submitEmpList1.wo", produces="application/json; charset=utf-8")
		public String submitEmpList1(HttpServletResponse response,@RequestParam(value="empList[]",required=false) String[] empList) throws JsonProcessingException{
			
				
				System.out.println(empList);
				
				ObjectMapper mapper = new ObjectMapper();
				ArrayList list = new ArrayList();
				for(int i =0; i<empList.length; i++) {
					list.add(empList[i]);
				}
				System.out.println(list);
				String jsonStr =  mapper.writeValueAsString(list);
				System.out.println(jsonStr);
				return jsonStr;
		}
		
		@ResponseBody
		@RequestMapping(value= "submitEmpList2.wo", produces="application/json; charset=utf-8")
		public String submitEmpList2(HttpServletResponse response,@RequestParam(value="empList2[]",required=false) String[] empList2) throws JsonProcessingException{
			
				
				System.out.println(empList2);
				
				ObjectMapper mapper = new ObjectMapper();
				ArrayList list = new ArrayList();
				for(int i =0; i<empList2.length; i++) {
					list.add(empList2[i]);
				}
				System.out.println(list);
				String jsonStr =  mapper.writeValueAsString(list);
				System.out.println(jsonStr);
				return jsonStr;
		}
		
	
	/** 기안서 디테일 화면
	 * @return
	 */
	@RequestMapping("draftDetail.wo")
	public String draftDetail() {
		
		return "approval/draftDetail";
	}
	
	
	
}

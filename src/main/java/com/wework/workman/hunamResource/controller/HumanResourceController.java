package com.wework.workman.hunamResource.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.wework.workman.hunamResource.model.service.HumanResourceService;
import com.wework.workman.humanResource.model.vo.Dept;
import com.wework.workman.humanResource.model.vo.Modal;

@Controller
public class HumanResourceController {
	@Resource(name="humanResourceService")
	private HumanResourceService hService;
	
	// 인사/공지사항
//	@RequestMapping("hrNotice")
//	public ModelAndView selectList(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage) {
//		
//		int listCount = hService.gethListCount();
//		
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
//		
////		ArrayList<Notice>
//		
//	}
	// 인사/인사정보/조직도
	@RequestMapping("empChart.wo")
	public String empChartMain() {
		
		return "humanResource/empChart";
	}
	// 인사/인사정보/직원목록
	@RequestMapping("empList.wo")
	public String empListMain() {
		
		return "humanResource/empList";
	}
	// 인사/휴가근태/휴가신청
	@RequestMapping("addHoliday.wo")
	public String addHoliday() {
		
		return "humanResource/addHolidayForm";
	}
	// 인사/휴가근태/휴가현황
	@RequestMapping("showHoliday.wo")
	public String showHoliday() {
		
		return "humanResource/showHoliday";
	}
	// 인사/휴가근태/근태현황
	@RequestMapping("showAtt.wo")
	public String showAtt() {
		
		return "humanResource/showAtt";
	}
	// 인사/인사 관리/조직도 관리
	@RequestMapping("mngEmpChart.wo")
	public String mngEmpChart() {
		
		return "humanResource/mngEmpChart";
	}
	// 인사/인사 관리/ 조직도 관리 -> 조직도 관리 버튼
	@RequestMapping("updateEmpChart.wo")
	public String updateEmpChart() {
		
		return "humanResource/updateEmpChart";
	}
	// 직원등록화면
	@RequestMapping("addEmpForm.wo")
	public String addEmpForm() {
		
		return "humanResource/addEmpForm";
	}
	// 직원정보 수정 화면
	@RequestMapping("updateEmpForm.wo")
	public String updateEmpForm() {
		
		return "humanResource/updateEmpForm";
	}
	// 인사/인사 관리/사용자 관리
	@RequestMapping("mngUser.wo")
	public String mngEmp() {
		
		return "humanResource/mngUser";
	}
	// 인사/인사 관리/인사자 관리
	@RequestMapping("manager.wo")
	public String manager() {
		
		return "humanResource/manager";
	}
	// 인사/휴가근태 관리/휴가관리
	@RequestMapping("mngHoliday.wo")
	public String mngHoliday() {
		
		return "humanResource/mngHoliday";
	}
	// 인사/휴가근태 관리/근태관리
	@RequestMapping("mngAtt.wo")
	public String mngAtt() {
		
		return "humanResource/mngAtt";
	}
	
	//----------------------------------------
	
	
}

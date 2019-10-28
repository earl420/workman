package com.wework.workman.humanResource.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wework.workman.common.PageInfo;
import com.wework.workman.common.Pagination;
import com.wework.workman.humanResource.model.service.HumanResourceService;
import com.wework.workman.humanResource.model.vo.Notice;

@Controller
public class HumanResourceController {
	@Resource(name="humanResourceService")
	private HumanResourceService hService;
	
	// 인사/공지사항
	@RequestMapping("hrNotice.wo")
	public ModelAndView selectList(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage) {
		int listCount = hService.gethListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Notice> list = hService.selectHRnList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("humanResource/notice");
		
		return mv;
		
	}
	
	// 인사/공지사항 상세보기 조회
	@RequestMapping("hrnDetail.wo")
	public ModelAndView hrnDetail(ModelAndView mv, String noticeNum) {
		
		Notice n = hService.gethrnDetail(noticeNum);
		
		if(n != null) {
			mv.addObject("n", n).setViewName("humanResource/noticeDetailView");
		}else {
			mv.setViewName("common/500error");
		}
		return mv;
	}
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

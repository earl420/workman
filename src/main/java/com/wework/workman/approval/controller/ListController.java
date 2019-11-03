package com.wework.workman.approval.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wework.workman.approval.model.service.ListService;
import com.wework.workman.approval.model.vo.Doc;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.PageInfo;
import com.wework.workman.common.Pagination;
import com.wework.workman.humanResource.model.service.HumanResourceService;
import com.wework.workman.humanResource.model.vo.Dept;
import com.wework.workman.humanResource.model.vo.Modal;
import com.wework.workman.mypage.model.vo.Mypage;

@Controller
public class ListController {
	
	@Autowired
	private ListService lService;
	
	@Resource(name="humanResourceService")
	private HumanResourceService hService;
	
	/** 전체리스트
	 * @return
	 */
	@RequestMapping("allList.wo")
	public ModelAndView allList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, HttpSession session, ModelAndView mv) {
		
		String userNum = ((Mypage)session.getAttribute("loginMan")).getNum();
		
		int listCount = lService.getallListCount(userNum);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Doc> doclist = lService.docList(pi,userNum);
		System.out.println(doclist);
		mv.addObject("pi", pi);
		mv.addObject("doclist", doclist);
		
		mv.setViewName("approval/allList");
		return mv;
	}
	
	/** 대기리스트
	 * @return
	 */
	@RequestMapping("waitingList.wo")
	public ModelAndView waitingList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, HttpSession session, ModelAndView mv) {
		
		String userNum = ((Mypage)session.getAttribute("loginMan")).getNum();
		HashMap<String,String> select = new HashMap<>();
		
		select.put("userNum", userNum);
		select.put("status", "Y");
		
		int listCount = lService.selectCount(select);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Doc> doclist = lService.docselectList(pi,select);
		mv.addObject("pi", pi);
		mv.addObject("doclist", doclist);
		
		mv.setViewName("approval/waitingList");
		return mv;
	}
	
	/** 승인리스트
	 * @return
	 */
	@RequestMapping("approvalList.wo")
	public ModelAndView approvalList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, HttpSession session, ModelAndView mv) {
		
		String userNum = ((Mypage)session.getAttribute("loginMan")).getNum();
		
		int listCount = lService.approvalListCount(userNum);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Doc> doclist = lService.approvalList(pi,userNum);
		mv.addObject("pi", pi);
		mv.addObject("doclist", doclist);
		mv.setViewName("approval/approvalList");
		return mv;
	}
	
	/** 진행리스트
	 * @return
	 */
	@RequestMapping("proceedingList.wo")
	public ModelAndView proceedingList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, HttpSession session, ModelAndView mv) {
		
		
		String userNum = ((Mypage)session.getAttribute("loginMan")).getNum();
		HashMap<String,String> select = new HashMap<>();
		
		select.put("userNum", userNum);
		select.put("status", "P");
		
		int listCount = lService.selectCount(select);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Doc> doclist = lService.docselectList(pi,select);
		mv.addObject("pi", pi);
		mv.addObject("doclist", doclist);
		
		
		mv.setViewName("approval/proceedingList");
		return mv;
	}
	
	/** 완료리스트
	 * @return
	 */
	@RequestMapping("completeList.wo")
	public ModelAndView completeList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, HttpSession session, ModelAndView mv) {
		

		String userNum = ((Mypage)session.getAttribute("loginMan")).getNum();
		HashMap<String,String> select = new HashMap<>();
		
		select.put("userNum", userNum);
		select.put("status", "C");
		
		int listCount = lService.selectCount(select);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Doc> doclist = lService.docselectList(pi,select);
		mv.addObject("pi", pi);
		mv.addObject("doclist", doclist);
		
		mv.setViewName("approval/completeList");
		return mv;
	}
	
	/** 결제요청문서 전체리스트
	 * @return
	 */
	@RequestMapping("allRequestList.wo")
	public ModelAndView allRequestList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, HttpSession session, ModelAndView mv) {
		
		String userNum = ((Mypage)session.getAttribute("loginMan")).getNum();
		
		int listCount = lService.allRequestListCount(userNum);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Doc> doclist = lService.docRequestList(pi,userNum);
		mv.addObject("pi", pi);
		mv.addObject("doclist", doclist);
		mv.setViewName("approval/allRequestList");
		return mv;
	}
	/** 결제요청문서 기안서리스트
	 * @return
	 */
	@RequestMapping("draftRequestList.wo")
	public ModelAndView draftRequestList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, HttpSession session, ModelAndView mv) {
		
		String userNum = ((Mypage)session.getAttribute("loginMan")).getNum();
		
		HashMap<String,String> select = new HashMap<>();
		
		select.put("userNum", userNum);
		select.put("docNum", "DRAFT%");
		
		int listCount = lService.selectRequestListCount(select);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Doc> doclist = lService.docsselectRequestList(pi,select);
		System.out.println(listCount);
		mv.addObject("pi", pi);
		mv.addObject("doclist", doclist);
		mv.setViewName("approval/draftRequestList");
		return mv;
		
	}
	/** 결제요청문서 품의서리스트
	 * @return
	 */
	@RequestMapping("requestRequestList.wo")
	public ModelAndView requestRequestList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, HttpSession session, ModelAndView mv) {
		
		String userNum = ((Mypage)session.getAttribute("loginMan")).getNum();
		
		HashMap<String,String> select = new HashMap<>();
		
		select.put("userNum", userNum);
		select.put("docNum", "REQ%");
		
		int listCount = lService.selectRequestListCount(select);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Doc> doclist = lService.docsselectRequestList(pi,select);
		System.out.println(listCount);
		mv.addObject("pi", pi);
		mv.addObject("doclist", doclist);
		mv.setViewName("approval/requestRequestList");
		return mv;
	}
	/** 결제요청문서 지출결의서리스트
	 * @return
	 */
	@RequestMapping("expenseRequestList.wo")
	public ModelAndView expenseRequestList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, HttpSession session, ModelAndView mv) {
		
		String userNum = ((Mypage)session.getAttribute("loginMan")).getNum();
		
		HashMap<String,String> select = new HashMap<>();
		
		select.put("userNum", userNum);
		select.put("docNum", "EXPENSE%");
		
		int listCount = lService.selectRequestListCount(select);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Doc> doclist = lService.docsselectRequestList(pi,select);
		System.out.println(listCount);
		mv.addObject("pi", pi);
		mv.addObject("doclist", doclist);
		mv.setViewName("approval/expenseRequestList");
		return mv;
	}
	/** 결제요청문서 휴가리스트
	 * @return
	 */
	@RequestMapping("holiDayRequestList.wo")
	public ModelAndView holiDayRequestList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, HttpSession session, ModelAndView mv) {
		
		String userNum = ((Mypage)session.getAttribute("loginMan")).getNum();
		
		HashMap<String,String> select = new HashMap<>();
		
		select.put("userNum", userNum);
		select.put("docNum", "HOLI%");
		
		int listCount = lService.selectRequestListCount(select);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Doc> doclist = lService.docsselectRequestList(pi,select);
		System.out.println(listCount);
		mv.addObject("pi", pi);
		mv.addObject("doclist", doclist);
		mv.setViewName("approval/holiDayRequestList");
		return mv;
	}
	
	// 모델에 부서 및 사원들 리시트
	@RequestMapping("test.wo")
	public ModelAndView test(ModelAndView mv ) {
		ArrayList<Dept> dlist = hService.selectModaDeptlList();
		ArrayList<Modal> mlist = hService.selectModalEmpList();
		
		
		mv.addObject("dlist",dlist);
		mv.addObject("mlist",mlist);
		System.out.println(mlist);
		mv.setViewName("approval/test");
		return mv;
	}
	
	
	
	
	
	
	


}

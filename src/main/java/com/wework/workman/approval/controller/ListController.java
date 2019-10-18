package com.wework.workman.approval.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wework.workman.approval.model.service.ListService;

@Controller
public class ListController {
	
	@Autowired
	private ListService lService;
	
	/** 전체리스트
	 * @return
	 */
	@RequestMapping("allList.wo")
	public String allList() {
		
		return "approval/allList";
	}
	
	/** 대기리스트
	 * @return
	 */
	@RequestMapping("waitingList.wo")
	public String waitingList() {
		
		return "approval/waitingList";
	}
	
	/** 진행리스트
	 * @return
	 */
	@RequestMapping("proceedingList.wo")
	public String proceedingList() {
		
		return "approval/proceedingList";
	}
	
	/** 승인리스트
	 * @return
	 */
	@RequestMapping("approvalList.wo")
	public String approvalList() {
		
		return "approval/approvalList";
	}
	
	/** 완료리스트
	 * @return
	 */
	@RequestMapping("completeList.wo")
	public String completeList() {
		
		return "approval/completeList";
	}
	
	/** 결제요청문서 전체리스트
	 * @return
	 */
	@RequestMapping("allRequestList.wo")
	public String allRequestList() {
		
		return "approval/allRequestList";
	}
	/** 결제요청문서 기안서리스트
	 * @return
	 */
	@RequestMapping("draftRequestList.wo")
	public String draftRequestList() {
		
		return "approval/draftRequestList";
	}
	/** 결제요청문서 품의서리스트
	 * @return
	 */
	@RequestMapping("requestRequestList.wo")
	public String requestRequestList() {
		
		return "approval/requestRequestList";
	}
	/** 결제요청문서 지출결의서리스트
	 * @return
	 */
	@RequestMapping("expenseRequestList.wo")
	public String expenseRequestList() {
		
		return "approval/expenseRequestList";
	}
	/** 결제요청문서 휴가리스트
	 * @return
	 */
	@RequestMapping("holiDayRequestList.wo")
	public String holiDayRequestList() {
		
		return "approval/holiDayRequestList";
	}
	
	/** 반려문서 리스트
	 * @return
	 */
	@RequestMapping("companionList.wo")
	public String companionList() {
		
		return "approval/companionList";
	}
	
	/** 임시저장 리스트
	 * @return
	 */
	@RequestMapping("temporaryList.wo")
	public String temporaryList() {
		
		return "approval/temporaryList";
	}
	
	@RequestMapping("test.wo")
	public String test() {
		
		return "approval/test";
	}
	
	
	
	
	
	


}

package com.wework.workman.approval.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wework.workman.account.model.service.AccountService;
import com.wework.workman.account.model.vo.Partner;
import com.wework.workman.approval.model.service.ExpenseService;
import com.wework.workman.approval.model.vo.Expense;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.Reference;
import com.wework.workman.humanResource.model.service.HumanResourceService;
import com.wework.workman.humanResource.model.vo.Dept;
import com.wework.workman.humanResource.model.vo.Modal;
import com.wework.workman.mypage.model.vo.Mypage;

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
			@RequestParam(value = "empName", required = false)String empName,
			@RequestParam(value = "msg", required = false) String msg,
			@RequestParam(value = "partnerNum", required = false) String partnerNum,
			ModelAndView mv) {
		
		ArrayList<Dept> dlist = hService.selectModaDeptlList();
		ArrayList<Modal> mlist = hService.selectModalEmpList();
		ArrayList<Partner> plist = aService.partnerList();
		mv.addObject("mlist",mlist);
		mv.addObject("dlist",dlist);
		mv.addObject("plist",plist);
		mv.addObject("empNum", empNum);
		mv.addObject("empName", empName);
		mv.addObject("msg", msg);
		mv.setViewName("approval/expenseWrite");
		return mv;
		
	}
	
	@ResponseBody
	@RequestMapping(value= "selectPartner.wo", produces="application/json; charset=utf-8")
	public String selectPartner(HttpServletResponse response,@RequestParam(value="partnerNum", required=false )String partnerNum) throws JsonProcessingException {
			
		Partner p = aService.selectPartner(partnerNum);
		System.out.println(p);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr =  mapper.writeValueAsString(p);
		return jsonStr;
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
	
	@RequestMapping("insertExpense.wo")
	public ModelAndView insertExpense(Expense e, Attachment a, ModelAndView mv, HttpServletRequest request, HttpSession session,
										@RequestParam(name="file", required=false) MultipartFile file,
										@RequestParam(name="applicant", required=false) String[] applicant,
										@RequestParam(name="referrer", required=false) String[] referrer) {

		// 결제자 추가
		Conflrm c = new Conflrm();
		switch (applicant.length) {
		case 1:
			c.setConfirmEmp1(applicant[0]);
			break;
		case 2:
			c.setConfirmEmp1(applicant[0]);
			c.setConfirmEmp2(applicant[1]);
			break;
		case 3:
			c.setConfirmEmp1(applicant[0]);
			c.setConfirmEmp2(applicant[1]);
			c.setConfirmEmp3(applicant[2]);
			break;

		case 4:
			c.setConfirmEmp1(applicant[0]);
			c.setConfirmEmp2(applicant[1]);
			c.setConfirmEmp3(applicant[2]);
			c.setConfirmEmp4(applicant[3]);
			break;
		}
		
		e.setDeptNum(((Mypage)session.getAttribute("loginMan")).getDeftNum());
		e.setEmpNum(((Mypage)session.getAttribute("loginMan")).getNum());
	
		String expenseNum = eService.insertExpense(e,c);
		System.out.println(expenseNum);
		
		// 승인자 추가
		Reference rf = new Reference();
		System.out.println("===================================");
		System.out.println(referrer);
		if(referrer != null) {
			switch (referrer.length) {
				case 1:
					rf.setEmpNum1(referrer[0]);
					break;
				case 2:
					rf.setEmpNum1(referrer[0]);
					rf.setEmpNum2(referrer[1]);
					break;
				case 3:
					rf.setEmpNum1(referrer[0]);
					rf.setEmpNum2(referrer[1]);
					rf.setEmpNum3(referrer[2]);
					break;

				case 4:
					rf.setEmpNum1(referrer[0]);
					rf.setEmpNum2(referrer[1]);
					rf.setEmpNum3(referrer[2]);
					rf.setEmpNum4(referrer[3]);
					break;
				}
			rf.setDocNum(expenseNum);
			int result = eService.insertReference(rf);
		}
		
		
		if(!file.getOriginalFilename().equals("")) { // 첨부파일이 넘어온 경우
		
		// 서버에 파일등록(폴더에 저장)
		// 내가 저장하고자 하는 파일 , request 전달하고 실제로 저장된 파일명 돌려주는 saveFile
			String renameFileName = saveFile(file, request, a);
		
			if(renameFileName != null) { // 파일이 잘 저장된 경우
				a.setAttOriginalName(file.getOriginalFilename());
				a.setAttRename(renameFileName);
				a.setDocNum(expenseNum);
			}
			int result = eService.insertFile(a);
		}
		if(!expenseNum.equals("null")) {
			mv.addObject("expenseNum", expenseNum);
			mv.setViewName("redirect:expenseDetail.wo");
		}else {
			mv.setViewName("redirect:expenseWrite.wo");
		}
	
	return mv;
		
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request, Attachment a) {

		// 파일이 저장될 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\upload";
		
		File folder = new File(savePath); // 저장될 폴더 지정
		
		if(!folder.exists()) { // 폴더가 없다면
			folder.mkdirs();	// 폴더생성해라
		}
		String originalFileName = file.getOriginalFilename(); //원본명(확장자)
		
		// 파일명 수정작업 --> 년월일시분초.확장자
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) // 년월일시분초 
								+ originalFileName.substring(originalFileName.lastIndexOf("."));
		
		// 실제 저장될 경로 savePath + 저장하고자 하는 파일명 renameFileName
		
		String renamePath = savePath + "\\" + renameFileName; // resources\bupload/20120311200000
		
		a.setAttPath(renamePath);
		
		try {
			file.transferTo(new File(renamePath)); // 이때 서버에 업로드 됨
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		} 
			
		return renameFileName;
	}
			
	
	/** 지출결의서 디테일 화면
	 * @return
	 */
	@RequestMapping("expenseDetail.wo")
	public ModelAndView expenseDetail(String expenseNum, ModelAndView mv) {
		
		Expense e = eService.selectExpense(expenseNum);
		Conflrm c = eService.selectConflrm(e.getConfirmNum());
		Reference rf = eService.selectReference(expenseNum);
		Attachment a = eService.selectAttachment(expenseNum);
		ArrayList<Modal> mlist = hService.selectModalEmpList();
		
		System.out.println(e);
		System.out.println(c);
		System.out.println(rf);
		System.out.println(a);
		
		mv.addObject("e",e);
		mv.addObject("c",c);
		mv.addObject("rf",rf);
		mv.addObject("a",a);
		mv.addObject("mlist",mlist);
		mv.setViewName("approval/expenseDetail");
		
		return mv;
	}
	
	@RequestMapping("successExpense.wo")
	public ModelAndView successDraft( ModelAndView mv,
									  @RequestParam(name="confirmNum", required=false) String confirmNum,
									  @RequestParam(name="expenseNum", required=false) String docNum,
									  @RequestParam(name="count", required=false) int count) {
		
		Conflrm c = eService.selectConflrm(confirmNum);
		
		int count1 = 0;
		if(c.getConfirmEmp4() != null) {
			count1=4;
		}else if(c.getConfirmEmp3() != null){
			count1=3;
		}else if(c.getConfirmEmp2() != null){
			count1=2;
		}else {
			count1=1;
		}
		
		int result1=0;
		int result2=0;
		switch (count) {
		case 1:
			result1 = eService.updateConflrm1(confirmNum, docNum);
			 if(count1==1) {
				 result2 = eService.insertApproval(docNum);
			 }
			break;
		case 2:
			 result1 = eService.updateConflrm2(confirmNum);
			 if(count1==2) {
				 result2 = eService.insertApproval(docNum);
			 }
			break;
		case 3:
			 result1 = eService.updateConflrm3(confirmNum);
			 if(count1==3) {
				 result2 = eService.insertApproval(docNum);
			 }
			break;
			
		case 4:
			 result1 = eService.updateConflrm4(confirmNum);
			 if(count1==4) {
				 result2 = eService.insertApproval(docNum);
			 }
			break;
		}
		mv.setViewName("redirect:allList.wo");
		return mv;
	}
}

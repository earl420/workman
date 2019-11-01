package com.wework.workman.approval.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
import com.wework.workman.approval.model.service.HolidayService;
import com.wework.workman.approval.model.vo.Holiday;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.Reference;
import com.wework.workman.humanResource.model.service.HumanResourceService;
import com.wework.workman.humanResource.model.vo.Dept;
import com.wework.workman.humanResource.model.vo.Modal;
import com.wework.workman.mypage.model.vo.Mypage;

@Controller
public class HolidayController {
	
	@Autowired
	private HolidayService hoService;
	
	@Resource(name="humanResourceService")
	private HumanResourceService hService;
	
	/** 휴가 작성
	 * @return
	 */
	@RequestMapping("holiDayWrite.wo")
	public ModelAndView holiDayWrite(@RequestParam(value = "empNum", required = false) String empNum,
			@RequestParam(value = "empName", required = false)String empName, ModelAndView mv) {
		
		ArrayList<Dept> dlist = hService.selectModaDeptlList();
		ArrayList<Modal> mlist = hService.selectModalEmpList();
		
		mv.addObject("mlist",mlist);
		mv.addObject("dlist",dlist);
		mv.addObject("empNum", empNum);
		mv.addObject("empName", empName);
		mv.setViewName("approval/holiDayWrite");
		return mv;
	}
	
	// 결제자 선택 리시트 
	@ResponseBody
	@RequestMapping(value= "submitEmpList5.wo", produces="application/json; charset=utf-8")
	public String submitEmpList1(HttpServletResponse response,@RequestParam(value="empList[]",required=false) String[] empList) throws JsonProcessingException{
		
			
		ArrayList<Modal> list = hService.selectModalList(empList);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr =  mapper.writeValueAsString(list);
		return jsonStr;
	}
	
	@ResponseBody
	@RequestMapping(value= "submitEmpList6.wo", produces="application/json; charset=utf-8")
	public String submitEmpList2(HttpServletResponse response,@RequestParam(value="empList2[]",required=false) String[] empList2) throws JsonProcessingException{
		
			
		ArrayList<Modal> list = hService.selectModalList(empList2);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr =  mapper.writeValueAsString(list);
		return jsonStr;
	}
	
	/** 휴가 디테일 화면
	 * @return
	 */
	@RequestMapping("holiDayDetail.wo")
	public ModelAndView holiDayDetail(String holiNum, ModelAndView mv) {
		
		Holiday h = hoService.selectHoliday(holiNum);
		Conflrm c = hoService.selectConflrm(h.getConfirmNum());
		Reference rf = hoService.selectReference(holiNum);
		Attachment a = hoService.selectAttachment(holiNum);
		
		System.out.println(h);
		System.out.println(c);
		System.out.println(rf);
		System.out.println(a);
		
		mv.addObject("h",h);
		mv.addObject("c",c);
		mv.addObject("rf",rf);
		mv.addObject("a",a);
		mv.setViewName("approval/holiDayDetail");
		return mv;
	}
	
	@RequestMapping("insertHoliday.wo")
	public ModelAndView insertHoliday(Holiday h, ModelAndView mv, HttpServletRequest request, HttpSession session,
									@RequestParam(name="daterangepicker_start", required=false) String start,
									@RequestParam(name="daterangepicker_end", required=false) String end,
									@RequestParam(name="file", required=false) MultipartFile file,
									@RequestParam(name="applicant", required=false) String[] applicant,
									@RequestParam(name="referrer", required=false) String[] referrer){
		
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
				h.setDeptNum(((Mypage)session.getAttribute("loginMan")).getDeftNum());
				h.setEmpNum(((Mypage)session.getAttribute("loginMan")).getNum());
				
				System.out.println(start);
				System.out.println(end);
				
				java.sql.Date holidayStart=java.sql.Date.valueOf(start);
				java.sql.Date holidayEnd=java.sql.Date.valueOf(end);
				
				
				h.setHolidayStart( holidayStart);
				h.setHolidayEnd(holidayEnd);
				
				
				String holiNum = hoService.insertHoliday(h,c);
				
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
							rf.setEmpNum1(referrer[1]);
							break;
						case 3:
							rf.setEmpNum1(referrer[0]);
							rf.setEmpNum1(referrer[1]);
							rf.setEmpNum1(referrer[2]);
							break;

						case 4:
							rf.setEmpNum1(referrer[0]);
							rf.setEmpNum1(referrer[1]);
							rf.setEmpNum1(referrer[2]);
							rf.setEmpNum1(referrer[3]);
							break;
						}
					rf.setDocNum(holiNum);
					int result = hoService.insertReference(rf);
				}
				
				
				Attachment a = new Attachment();
				if(!file.getOriginalFilename().equals("")) { // 첨부파일이 넘어온 경우
				
				// 서버에 파일등록(폴더에 저장)
				// 내가 저장하고자 하는 파일 , request 전달하고 실제로 저장된 파일명 돌려주는 saveFile
				String renameFileName = saveFile(file,request);
				
				if(renameFileName != null) { // 파일이 잘 저장된 경우
					a.setAttOriginalName(file.getOriginalFilename());
					a.setAttRename(renameFileName);
					a.setDocNum(holiNum);
				}
				int result = hoService.insertFile(a);
			}
				
				
				if(!holiNum.equals("null")) {
					mv.addObject("holiNum", holiNum);
					mv.setViewName("redirect:holiDayDetail.wo");
				}else {
					mv.setViewName("redirect:holiDayWrite.wo");
				}
			
			return mv;
		}
		public String saveFile(MultipartFile file, HttpServletRequest request) {

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
			
			try {
				file.transferTo(new File(renamePath)); // 이때 서버에 업로드 됨
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			} 
				
			return renameFileName;
		}
		
		
		
	}

	
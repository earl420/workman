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
import com.wework.workman.approval.model.service.RequestService;
import com.wework.workman.approval.model.vo.Request;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.Conflrm;
import com.wework.workman.humanResource.model.service.HumanResourceService;
import com.wework.workman.humanResource.model.vo.Dept;
import com.wework.workman.humanResource.model.vo.Modal;
import com.wework.workman.mypage.model.vo.Mypage;

@Controller
public class RequestController {
	@Autowired
	private RequestService rService;
	
	@Resource(name="humanResourceService")
	private HumanResourceService hService;
	
	/** 품의서 작성
	 * @return
	 */
	@RequestMapping("requestWrite.wo")
	public ModelAndView requestWrite(@RequestParam(value = "empNum", required = false) String empNum,
			@RequestParam(value = "empName", required = false)String empName, ModelAndView mv) {
		
		ArrayList<Dept> dlist = hService.selectModaDeptlList();
		ArrayList<Modal> mlist = hService.selectModalEmpList();
		
		mv.addObject("mlist",mlist);
		mv.addObject("dlist",dlist);
		mv.addObject("empNum", empNum);
		mv.addObject("empName", empName);
		mv.setViewName("approval/requestWrite");
		return mv;
	}
	
	// 결제자 선택 리시트 
	@ResponseBody
	@RequestMapping(value= "submitEmpList3.wo", produces="application/json; charset=utf-8")
	public String submitEmpList1(HttpServletResponse response,@RequestParam(value="empList[]",required=false) String[] empList) throws JsonProcessingException{
		
			
		ArrayList<Modal> list = hService.selectModalList(empList);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr =  mapper.writeValueAsString(list);
		return jsonStr;
	}
	
	@ResponseBody
	@RequestMapping(value= "submitEmpList4.wo", produces="application/json; charset=utf-8")
	public String submitEmpList2(HttpServletResponse response,@RequestParam(value="empList2[]",required=false) String[] empList2) throws JsonProcessingException{
		
			
		ArrayList<Modal> list = hService.selectModalList(empList2);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr =  mapper.writeValueAsString(list);
		return jsonStr;
	}
	
	
	/** 품의서 디테일화면
	 * @return
	 */
	@RequestMapping("requestDetail.wo")
	public String requestDetail(String requestNum ) {
		
		Request r = rService.selectrequestDetail(requestNum);
		System.out.println(r);
		return "approval/requestDetail";
	}
	
	@RequestMapping("insertRequest.wo")
	
	public ModelAndView insertRequest(Request r, ModelAndView mv, HttpServletRequest request, HttpSession session,
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
				
				
				// 적성자 추가
				r.setDeptNum(((Mypage)session.getAttribute("loginMan")).getDeftNum());
				r.setEmpNum(((Mypage)session.getAttribute("loginMan")).getNum());
				
				String requestNum = rService.insertRequest(r,c);
				
				Attachment a = new Attachment();
				if(!file.getOriginalFilename().equals("")) { // 첨부파일이 넘어온 경우
				
				// 서버에 파일등록(폴더에 저장)
				// 내가 저장하고자 하는 파일 , request 전달하고 실제로 저장된 파일명 돌려주는 saveFile
				String renameFileName = saveFile(file,request);
				
				if(renameFileName != null) { // 파일이 잘 저장된 경우
					a.setAttOriginalName(file.getOriginalFilename());
					a.setAttRename(renameFileName);
					a.setDocNum(requestNum);
				}
				int result = rService.insertFile(a);
			}
				
				if(!requestNum.equals("null")) {
					mv.addObject("requestNum", requestNum);
					mv.setViewName("redirect:requestDetail.wo");
				}else {
					mv.setViewName("redirect:requestWrite.wo");
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


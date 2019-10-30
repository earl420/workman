package com.wework.workman.humanResource.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.wework.workman.common.Attachment;
import com.wework.workman.common.PageInfo;
import com.wework.workman.common.Pagination;
import com.wework.workman.humanResource.model.service.HumanResourceService;
import com.wework.workman.humanResource.model.vo.Department;
import com.wework.workman.humanResource.model.vo.Employee;
import com.wework.workman.humanResource.model.vo.Notice;

@Controller
public class HumanResourceController {
	@Resource(name = "humanResourceService")
	private HumanResourceService hService;

	// 전체 공지 리스트
	@RequestMapping("notice.wo")
	public ModelAndView selectTotal(ModelAndView mv,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		int listCount = hService.getnListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Notice> list = hService.selectnList(pi);

		for (int i = 0; i < list.size(); i++) {
			String noticeNum = list.get(i).getNoticeNum().toString().substring(6);
			list.get(i).setNoticeNum(noticeNum);
		}

		mv.addObject("pi", pi).addObject("list", list).setViewName("humanResource/notice");

		return mv;

	}
	
	// 전체 공지사항 상세보기 조회
	@RequestMapping("nDetail.wo")
	public ModelAndView nDetail(ModelAndView mv, String noticeNum) {

		Notice n = hService.getnDetail(noticeNum);

		if (n != null) {
			mv.addObject("n", n).setViewName("humanResource/noticeDetailView");
		} else {
			mv.setViewName("common/500error");
		}
		return mv;
	}
	
	// 공지글 수정 폼
	@RequestMapping("updateNoticeForm.wo")
	public ModelAndView updateNoticeForm(ModelAndView mv, String noticeNum) {
		
		
		String num = noticeNum.substring(6);
		
		Notice n = hService.getnDetail(num);
		
		if(n != null) {
			mv.addObject("n", n).setViewName("humanResource/updateNoticeForm");
		}else {
			mv.setViewName("common/500error");
		}
		return mv;
	}
	
	// 공지글 수정
	@RequestMapping("updateNotice.wo")
	public String updateNotice(Notice n, Attachment a, HttpServletRequest request,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {
		
		int result1 = hService.updateNotice(n);
		
//		System.out.println(result1); // 1 잘나옴
		
		if (file != null && !file.getOriginalFilename().equals("")) {
			
			deleteFile(n.getNoticeNum(), request);
			
			String renameFileName = saveFile(file, request, a);

			if (renameFileName != null) {

				a.setDocNum(n.getNoticeNum());
				a.setAttOriginalName(file.getOriginalFilename());
				a.setAttRename(renameFileName);

			}
		}
		
		if(file != null) {
			
			int result2 = hService.insertAtt(a);
			System.out.println(result2);
			
		}
		
		System.out.println(result1);
		
		if (result1 > 0) {
			return "redirect:notice.wo";
		} else {
			return "common/500error";
		}
	}
	
	public void deleteFile(String noticeNum, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resource");
		String savePath = root + "/upload";
		
		File f = new File(savePath + "/" + noticeNum);
		
		if(f.exists()) {
			f.delete();
		}
	}

	// 공지사항 / 공지글 작성 폼
	@RequestMapping("ninsertForm.wo")
	public ModelAndView ninsertForm(ModelAndView mv) {

		ArrayList<Department> dlist = hService.getDeptList();
		
		if (!dlist.isEmpty()) {
			mv.addObject("dlist", dlist).setViewName("humanResource/insertNotice");
		} else {
			mv.setViewName("common/500error");
		}

		return mv;
	}

	// 인사/공지사항 리스트
	@RequestMapping("hrNotice.wo")
	public ModelAndView selectList(ModelAndView mv,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {

		int listCount = hService.gethListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Notice> list = hService.selectHRnList(pi);

		for (int i = 0; i < list.size(); i++) {
			String noticeNum = list.get(i).getNoticeNum().toString().substring(6);
			list.get(i).setNoticeNum(noticeNum);
		}

		mv.addObject("pi", pi).addObject("list", list).setViewName("humanResource/humanNotice");

		return mv;

	}

	// 공지사항 / 글 작성
	@RequestMapping("ninsert.wo")
	public String insertNotice(Notice n, Attachment a, HttpServletRequest request,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {

		if (file != null && !file.getOriginalFilename().equals("")) {

			String renameFileName = saveFile(file, request, a);

			if (renameFileName != null) {

				a.setDocNum(n.getNoticeNum());
				a.setAttOriginalName(file.getOriginalFilename());
				a.setAttRename(renameFileName);

			}
		}

		int result1 = hService.insertNotice(n);

		if (file != null) {

			hService.insertAtt(a);
		}

		if (result1 > 0) {
			return "redirect:notice.wo";
		} else {
			return "common/500error";
		}
	}

	public String saveFile(MultipartFile file, HttpServletRequest request, Attachment a) {

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/upload";

		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdirs();
		}

		String originalFileName = file.getOriginalFilename();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
				+ originalFileName.substring(originalFileName.lastIndexOf("."));

		String renamePath = savePath + "/" + renameFileName;

		a.setAttPath(renamePath);

		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return renameFileName;
	}

	// 인사/공지사항 상세보기 조회
	@RequestMapping("hrnDetail.wo")
	public ModelAndView hrnDetail(ModelAndView mv, String noticeNum) {

		Notice n = hService.gethrnDetail(noticeNum);

		if (n != null) {
			mv.addObject("n", n).setViewName("humanResource/noticeDetailView");
		} else {
			mv.setViewName("common/500error");
		}
		return mv;
	}

	// 인사/인사정보/조직도
	@RequestMapping("empChart.wo")
	public ModelAndView empChartMain(ModelAndView mv) {

		ArrayList<Department> list = hService.getDeptList();

		ArrayList<Employee> count = hService.getEmpCount();
		ArrayList<Employee> eList = hService.getEmp();

		if (!list.isEmpty()) {
			mv.addObject("list", list).addObject("eList", eList).addObject("count", count)
					.setViewName("humanResource/empChart");
		} else {
			mv.setViewName("common/500error");
		}

		return mv;

	}

	// 인사/인사정보/직원목록
	@RequestMapping("empList.wo")
	public String empListMain() {

		return "humanResource/empList";
	}

	// 인사/휴가근태/휴가신청
//	@RequestMapping("addHoliday.wo")
//	public String addHoliday() {
//
//		return "humanResource/addHolidayForm";
//	}

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
	
	// 인사/인사 관리/조직도 관리 -> 조직 관리 버튼
	@RequestMapping("updateDeptForm.wo")
	public String updateDeptForm() {
		
		return "humanResource/updateDeptForm";
	}

	// 인사/인사 관리/ 조직도 관리 -> 구성원 관리 버튼
	@RequestMapping("updateEmpChart.wo")
	public String updateEmpChart() {

		return "humanResource/updateEmpChart";
	}

	// 직원등록화면
	@RequestMapping("addEmpForm.wo")
	public String addEmpForm() {

		return "humanResource/addEmpForm";
	}

	// 직원 등록
	@RequestMapping("addEmp.wo")
	public String addEmp(Employee e) {

//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
//		int sysYear = Integer.parseInt(sdf.format(new Date(System.currentTimeMillis())));
//
//		if(sysYear - Integer.parseInt(e.getEnrollDate().toString().substring(0, 4)) == 0) {
//			
//			SimpleDateFormat sdf1 = new SimpleDateFormat("MM");
//			sdf1.format(new Date(System.currentTimeMillis()));
//			int year = Integer.parseInt((e.getEnrollDate().toString().substring(4, 6)));
//			
//			
//		}

		return "humanResource/empList";
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

	// ----------------------------------------

}

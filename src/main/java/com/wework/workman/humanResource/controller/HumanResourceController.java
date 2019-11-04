package com.wework.workman.humanResource.controller;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.PageInfo;
import com.wework.workman.common.Pagination;
import com.wework.workman.humanResource.model.service.HumanResourceService;
import com.wework.workman.humanResource.model.vo.AllHoli;
import com.wework.workman.humanResource.model.vo.Att;
import com.wework.workman.humanResource.model.vo.Department;
import com.wework.workman.humanResource.model.vo.Dept;
import com.wework.workman.humanResource.model.vo.Employee;
import com.wework.workman.humanResource.model.vo.Grade;
import com.wework.workman.humanResource.model.vo.HoliCount;
import com.wework.workman.humanResource.model.vo.MyHoli;
import com.wework.workman.humanResource.model.vo.Notice;
import com.wework.workman.humanResource.model.vo.UseHoli;
import com.wework.workman.mypage.model.vo.Mypage;

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

		if (n != null) {
			mv.addObject("n", n).setViewName("humanResource/updateNoticeForm");
		} else {
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

		if (file != null) {

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
//		String savePath = root + "\\upload";

		File f = new File(savePath + "/" + noticeNum);
//		File f = new File(savePath + "\\" + noticeNum);

		if (f.exists()) {
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
//		String savePath = root + "\\upload";

		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdirs();
		}

		String originalFileName = file.getOriginalFilename();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
				+ originalFileName.substring(originalFileName.lastIndexOf("."));

		String renamePath = savePath + "/" + renameFileName;
//		String renamePath = savePath + "\" + renameFileName;

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
	public ModelAndView empListMain(ModelAndView mv) {
		
		ArrayList<Dept> dlist = hService.selectModaDeptlList();
		
		ArrayList<Employee> elist = hService.getEmp();

		if(!dlist.isEmpty()) {
			mv.addObject("dlist", dlist).addObject("elist", elist).setViewName("humanResource/empList");
		}else {
			mv.setViewName("common/500error");
		}
		return mv;
	}

	// 인사/휴가근태/휴가현황
	@RequestMapping("showHoliday.wo")
	public ModelAndView showMyHoliday(HttpSession session, ModelAndView mv) {
		
		HoliCount holiCount = hService.myHoliCount(((Mypage)session.getAttribute("loginMan")).getNum());
		
		System.out.println(holiCount);
		
		ArrayList<MyHoli> hlist = hService.showMyHoliday(((Mypage)session.getAttribute("loginMan")).getNum());
		
		mv.addObject("hlist", hlist).addObject("holiCount", holiCount).setViewName("humanResource/showHoliday");
		
		return mv;
		
	}

	// 인사/휴가근태/근태현황
	@RequestMapping("showAtt.wo")
	public ModelAndView showAtt(HttpSession session, ModelAndView mv) {
		
		Mypage m = ((Mypage)session.getAttribute("loginMan"));
		// 이번 달 지각 횟수 가져오기
		int late = hService.getThisLate(((Mypage)session.getAttribute("loginMan")).getNum());
		
		
		// 이번 달 비정상 출근 가져오기
		int noOn = hService.getnoOn(((Mypage)session.getAttribute("loginMan")).getNum());
		
		int noOff = hService.getnoOff(((Mypage)session.getAttribute("loginMan")).getNum());
		
		// 해당 달 클릭해서 일별로 출/퇴근 보기
		ArrayList<Att> att = hService.getMonthAtt(((Mypage)session.getAttribute("loginMan")).getNum());
		
		mv.addObject("m", m).addObject("late", late).addObject("noOn", noOn).addObject("noOff", noOff).addObject("att", att).setViewName("humanResource/showAtt");
		return mv;
		
	}
	
//	@RequestMapping("monthAtt.wo")
//	public ModelAndView monthAtt(HttpSession session, ModelAndView mv) {
//		
//		ArrayList<Att> att = hService.getMonthAtt(((Mypage)session.getAttribute("loginMan")).getNum());
//		
//		mv.addObject("att", att).setViewName("humanResource/showAtt");
//		
//		return mv;
//	}
	

	// 인사/인사 관리/조직도 관리
	@RequestMapping("mngEmpChart.wo")
	public ModelAndView mngEmpChart(ModelAndView mv) {

		ArrayList<Department> list = hService.getDeptList();

		ArrayList<Employee> count = hService.getEmpCount();
		ArrayList<Employee> eList = hService.getEmp();

		if (!list.isEmpty()) {
			mv.addObject("list", list).addObject("eList", eList).addObject("count", count)
					.setViewName("humanResource/mngEmpChart");
		} else {
			mv.setViewName("common/500error");
		}

		return mv;
	}

	// 인사/인사 관리/조직도 관리 -> 조직 추가
	@RequestMapping("addDeptForm.wo")
	public ModelAndView addDeptForm(ModelAndView mv) {

		ArrayList<Dept> list = hService.selectModaDeptlList();

		if (!list.isEmpty()) {
			mv.addObject("list", list).setViewName("humanResource/addDeptForm");
		} else {
			mv.setViewName("common/500error");
		}

		return mv;

	}

	// 부서 불러오기
	@RequestMapping("dlist.wo")
	public void dlist(HttpServletResponse response) throws JsonIOException, IOException {

		ArrayList<Dept> list = hService.selectModaDeptlList();

		response.setContentType("application/json; charset=utf-8");

		Gson gson = new Gson();
		gson.toJson(list, response.getWriter());

	}

	// 직원리스트 불러오기 with 부서이름
	@RequestMapping("elistByName.wo")
	public void elistByName(HttpServletResponse response, String deptName) throws JsonIOException, IOException {

		System.out.println(deptName);
		ArrayList<Employee> list = hService.elistByName(deptName);

		response.setContentType("application/json; charset=utf-8");

		Gson gson = new Gson();
		gson.toJson(list, response.getWriter());

	}

	// 인사 /인사 관리/ 조직도 관리 -> 부서 추가
	@ResponseBody
	@RequestMapping("addDept.wo")
	public String addDept(String deptName) {

		int result = hService.addDept(deptName);

		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}

	}

	// 인사/인사 관리/조직도 관리 -> 조직 수정 폼
	@RequestMapping("updateDeptForm.wo")
	public ModelAndView updateDeptForm(ModelAndView mv) {

		ArrayList<Dept> list = hService.selectModaDeptlList();

		if (!list.isEmpty()) {
			mv.addObject("list", list).setViewName("humanResource/updateDeptForm");
		} else {
			mv.setViewName("common/500error");
		}

		return mv;
	}

	// 인사/ 인사관리 / 조직도 관리 -> 부서 이름 수정
	@RequestMapping("updateDept.wo")
	public String updateDept(Dept d) {

		System.out.println(d);

		int result = hService.updateDept(d);

		if (result > 0) {
			return "redirect:empChart.wo";
		} else {
			return "commom/500error";
		}
	}

	// 인사/ 인사관리 / 조직도 관리 -> 부서 삭제 폼
	@RequestMapping("deleteDeptForm.wo")
	public ModelAndView deleteDeptForm(ModelAndView mv) {

		ArrayList<Dept> list = hService.selectModaDeptlList();

		if (!list.isEmpty()) {
			mv.addObject("list", list).setViewName("humanResource/deleteDeptForm");
		} else {
			mv.setViewName("common/500error");
		}

		return mv;
	}

	// 인사/ 인사관리 / 조직도 관리 -> 부서 삭제
	@RequestMapping("deleteDept.wo")
	public String deleteDept(HttpServletRequest request) {

		int deptNum = Integer.parseInt((request.getParameter("deptNum")));

		int result = hService.deleteDept(deptNum);

		if (result > 0) {
			return "redirect:empChart.wo";
		} else {
			return "common/500error";
		}

	}

	// 인사/인사 관리/ 조직도 관리 -> 구성원 관리 버튼
	@RequestMapping("updateEmpChart.wo")
	public String updateEmpChart() {

		return "humanResource/updateEmpChart";
	}

	// 직원등록화면
	@RequestMapping("addEmpForm.wo")
	public ModelAndView addEmpForm(ModelAndView mv) {

		ArrayList<Dept> dlist = hService.selectModaDeptlList();

		ArrayList<Grade> glist = hService.selectModalGradeList();

		if (!dlist.isEmpty() && !glist.isEmpty()) {
			mv.addObject("dlist", dlist).addObject("glist", glist).setViewName("humanResource/addEmpForm");
		} else {
			mv.setViewName("common/500error");
		}

		return mv;
	}

	// 직원 등록
	@RequestMapping("insertEmp.wo")
	public String insertEmp(Employee e, Dept d, ModelAndView mv, @RequestParam("address1") String address1,
			@RequestParam("address2") String address2, @RequestParam("deptName") String deptName,
			@RequestParam("birth") String birth, @RequestParam("gradeName") String gradeName,
			@RequestParam("empSalary") String empSalary) {

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
		System.out.println(e);

		if (!address1.equals("")) {
			e.setEmpAddress(address1 + "," + address2);
		}
		java.sql.Date empBirth = java.sql.Date.valueOf(birth);
		e.setBirth(empBirth);

		// 부서 이름으로 부서 번호 가져오기
		int deptNum = hService.getDeptNum(deptName);
		System.out.println(deptNum);

		// 직급 이름으로 직급 번호 가져오기
		int gradeNum = hService.getGradeNum(gradeName);
		System.out.println(gradeNum);

		e.setDeptNum(deptNum);
		e.setGradeNum(gradeNum);
		e.setEmpSalary(Integer.parseInt(empSalary));

		int result1 = hService.insertEmp(e);
		
		int result2 = hService.setHoliday();

		if (result1 > 0 && result2 > 0) {

			return "redirect:empChart.wo";

		} else {
			return "common/500error";
		}
	}

	// 인사/인사 관리/사용자 관리
	@RequestMapping("mngUser.wo")
	public ModelAndView mngEmp(ModelAndView mv, HttpServletResponse response) throws JsonIOException, IOException {

		ArrayList<Dept> dlist = hService.selectModaDeptlList();
		
		ArrayList<Dept> list = hService.selectModaDeptlList();

		response.setContentType("application/json; charset=utf-8");

		Gson gson = new Gson();
		gson.toJson(list, response.getWriter());
		
		ArrayList<Grade> glist = hService.selectModalGradeList();

		response.setContentType("application/json; charset=utf-8");

		Gson gson1 = new Gson();
		gson1.toJson(glist, response.getWriter());

		if (!dlist.isEmpty()) {
			mv.addObject("dlist", dlist).setViewName("humanResource/mngUser");
		} else {
			mv.setViewName("common/500error");
		}
		return mv;
	}

	// 직원정보 수정 화면
	@RequestMapping("updateEmpForm.wo")
	public String updateEmpForm() {

		return "humanResource/updateEmpForm";
	}

	// 인사/인사관리/ 사용자 관리 -> 수정하기 버튼 클릭 시(직급, 부서 수정)
	@ResponseBody
	@RequestMapping("updateEmp.wo")
	public String updateEmp(Employee e) {

		e.setDeptNum(hService.getDeptNum(e.getDeptName()));
		e.setGradeNum(hService.getGradeNum(e.getGradeName()));

		int result = hService.updateEmp(e);

		if (result > 0) {
			return "success";
		} else {
			return "error";
		}

	}

	// 인사/휴가근태 관리/휴가관리
	@RequestMapping("mngHoliday.wo")
	public ModelAndView mngHoliday(ModelAndView mv) {

		ArrayList<Dept> dlist = hService.selectModaDeptlList();
		

		if(!dlist.isEmpty()) {
			mv.addObject("dlist", dlist).setViewName("humanResource/mngHoliday");
		}else {
			mv.setViewName("common/500error");
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("allHoliday.wo")
	public void allHoliday(HttpServletRequest request, HttpServletResponse response) throws JsonIOException, IOException {
		
		String deptName = request.getParameter("deptName");
				
		ArrayList<AllHoli> allHoli = hService.allHoliday(deptName);
		
		response.setContentType("application/json; charset=utf-8");

		Gson gson = new Gson();
		gson.toJson(allHoli, response.getWriter());
		
	}
	
	@RequestMapping("mngHoliDetail.wo")
	public ModelAndView mngHoliDetail(HttpServletRequest request, ModelAndView mv) {
		
		String deptName = request.getParameter("deptName");
		System.out.println(deptName);
		ArrayList<AllHoli> allHoli = hService.allHoliday(deptName);
		
		ArrayList<UseHoli> useHoli = hService.useHolidayList(deptName);
		System.out.println("1"+useHoli);
		if(!allHoli.isEmpty()) {
			mv.addObject("allHoli", allHoli).addObject("useHoli",useHoli).addObject("deptName", deptName).setViewName("humanResource/mngHolidayDetail");
		}else {
			mv.setViewName("common/500error");
		}
		return mv;
		
	}

	// 인사/휴가근태 관리/근태관리
	@RequestMapping("mngAtt.wo")
	public ModelAndView mngAtt(ModelAndView mv) {
		
		ArrayList<Dept> dlist = hService.selectModaDeptlList();

		if(!dlist.isEmpty()) {
			mv.addObject("dlist", dlist).setViewName("humanResource/mngAtt");
		}else {
			mv.setViewName("common/500error");
		}
		return mv;
	}

	// ----------------------------------------

}

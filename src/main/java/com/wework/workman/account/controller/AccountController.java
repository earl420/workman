package com.wework.workman.account.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.wework.workman.account.model.service.AccountService;
import com.wework.workman.account.model.vo.AcNotice;
import com.wework.workman.account.model.vo.AccountStatus;
import com.wework.workman.account.model.vo.Attendance2;
import com.wework.workman.account.model.vo.AvgSalary;
import com.wework.workman.account.model.vo.Fixture;
import com.wework.workman.account.model.vo.IncomeStatement;
import com.wework.workman.account.model.vo.IsState;
import com.wework.workman.account.model.vo.NoticeFile;
import com.wework.workman.account.model.vo.OsManage;
import com.wework.workman.account.model.vo.Partner;
import com.wework.workman.account.model.vo.Product;
import com.wework.workman.account.model.vo.SalaryManage;
import com.wework.workman.account.model.vo.SaleManage;
import com.wework.workman.common.PageInfo;
import com.wework.workman.common.Pagination;
import com.wework.workman.mypage.model.vo.Mypage;

@Controller
public class AccountController {
	@Resource(name="accountService")
	private AccountService aService;
	
	@RequestMapping("acnoticeList.wo")
	public String accountList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage, Model model) {
		
		
		int listCount = aService.getNoticeListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<AcNotice> list = aService.noticeList(pi);
		for (int i = 0; i < list.size(); i++) {
			String nNo=list.get(i).getNoticeNum().substring(6);
			list.get(i).setNoticeNum(nNo);
		}
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		return "account/aNotice";
	}
	@RequestMapping("aninsertpage.wo")
	public String anInsertPage() {
		return "account/insertNotice";
	}
	@RequestMapping("aninsert.wo")
	public String aNoticeInsert(@RequestParam("noticeTitle") String noticeTitle,
			@RequestParam(value="noticeContent", required = false) String noticeContent,
			@RequestParam(value="noticeType", required =false) int noticeAccType,
			@RequestParam(value="insertDate", required = false) String insertDate,
			@RequestParam(value="ir1", required=false) String ir1,
			@RequestParam(value="file", required = false) MultipartFile file,
			HttpSession session, HttpServletRequest request) {
		Mypage mp=(Mypage)session.getAttribute("loginMan");
		
		
		
		String empNum=mp.getNum();
		int deptNum=mp.getDeftNum();
		int result =1;
		AcNotice notice = new AcNotice(null, deptNum, noticeTitle, noticeContent, empNum, null, null, null, "Y", noticeAccType);
		if(noticeAccType ==1) {
			notice.setNoticeContent(ir1);
			int result2=aService.aNoticeInsert(notice);
			if(result2<1) {
				result=0;
			}
		}else {
			
			String[] date = noticeContent.split(" ");
			String startDate = noticeContent.split(" ")[1].substring(2);
			String endDate = date[1].substring(2);
			if(noticeAccType==3) {
				if(date[0].equals("분기")) {
						
						switch (date[2]) {
						case "1/4":
							startDate +="/01/01";
							endDate +="/03/31";
							break;
						case "2/4":
							startDate +="/04/01";
							endDate +="/06/30";
							break;
						case "3/4":
							startDate +="/07/01";
							endDate +="/09/30";
							break;
						case "4/4":
							startDate +="/10/01";
							endDate +="/12/31";
							break;

						default:
							break;
						}
						IsState iss = new IsState(startDate, endDate);
						result =aService.insertIncome(iss);
					}
					
				}
			int result2=aService.aNoticeInsert(notice);
			if(result<1||result2<1) {
				result=0;
			}
			
		}
		String renameFileName = null;
		NoticeFile nf = new NoticeFile();
		if (!file.getOriginalFilename().equals("")) {//첨부파일이 넘어온경우
			//서버에 파일등록(폴더에 저장)
			//내가 저장하고자하는 파일, request 전달하고 실제로 저장된 파일명 돌려주는 saveFile
			renameFileName=saveFile(file,request);
			if(renameFileName !=null) {//파일이 잘저장된경우				
				nf.setOriginalName(file.getOriginalFilename());
				nf.setRename(renameFileName);
				nf.setPath("nupload");
				int a = aService.insertFile(nf);
			}
		}
		
		
		if(result<1) {
			return "common/errorPage";
		}
		return "redirect:acnoticeList.wo";
	}
	@RequestMapping("acDetail.wo")
	public String aNoticeDetail(@RequestParam(name = "noticeNum", required = false, defaultValue = "") String acDetail, Model model) {
		AcNotice notice = aService.noticeDetail(acDetail);
		NoticeFile file = aService.noticeFile(acDetail);
		model.addAttribute("notice", notice);
		model.addAttribute("file",file);
		//파일도 넣는처리할것 
		return "account/detailNotice";
	}
	@RequestMapping("salelist.wo")
	public String saleList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			Model model) {
		
//		
		int listCount = aService.getSaleListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<SaleManage> list = aService.saleList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "account/saleList";
	}
	@RequestMapping("insertsale.wo")
	public String insertSale(@RequestParam("product") String productCode,
			@RequestParam("partner") String partnerNum,
			@RequestParam(value = "saleCount", required = false, defaultValue = "1") int salesAmount,
			@RequestParam(value="empNum", required = false) String empNum) {
		
		SaleManage sm = new SaleManage();
		sm.setEmpNum(empNum);
		sm.setProductCode(productCode);
		sm.setPartnerNum(partnerNum);
		sm.setSalesAmount(salesAmount);
		int result = aService.insertSale(sm);
		if(result>0) {
			return "redirect:salelist.wo"; 
		}else {
			return "common/500error";
		}
		
	}
	@RequestMapping("oslist.wo")
	public String osList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			Model model) {
		

		int listCount = aService.getOSListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<OsManage> list = aService.osList(pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "account/osList";
	}
	@RequestMapping("fixturelist.wo")
	public String fixtureList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			Model model) throws ParseException {
		
		int listCount = aService.getFixtureListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Fixture> list = aService.fixtureList(pi);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		Date todayParse = sdf.parse(today);
		for (int i = 0; i < list.size(); i++) {
			String listDay = sdf.format(list.get(i).getFixtureBuy());
			Date listDayParse = sdf.parse(listDay);
			int diff = (int)(todayParse.getTime()-listDayParse.getTime())/(24*60*60*1000*365);
			int val = (list.get(i).getFixturePrice()/list.get(i).getEndurance())*(list.get(i).getEndurance()-diff);
			list.get(i).setResidualValue(val);
		}
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "account/fixtureList";
	}
	@RequestMapping("salarylist.wo")
	public String salaryList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			Model model) {
		int check2 = aService.checkYearSal();
		if(check2<1) {
			int insertYearSal = aService.insertYearSalary();
			
		}
		int listCount = aService.getSalaryListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<SalaryManage> list = aService.salaryList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "account/salaryList";
	}
	@RequestMapping("salarydetail.wo")
	public String salaryDetail(@RequestParam(value = "empNum", required = false) String empNum,
			Model model) {
		ArrayList<SalaryManage> salary = aService.salaryDetail(empNum);
		AvgSalary avg =null;
		if (salary.size()>0) {
			avg =aService.avgSalary(salary.get(0));
		}	
		model.addAttribute("list", salary);
		model.addAttribute("avg", avg);
		return "account/salaryDetail";
	}
	
	//intercepter로 못뺴네?
	public void accountSalary() {
		//이번달에 월급지급이 처리되었나 확인
//		int checkSalary=aService.checkSalary();
//		if(checkSalary<0) {
//			//연봉 총합에 12나누고 그값으로 분개 처리
//			int result = aService.insertSalary();
//		}
	}
	
	//거래처 불러오기
	@ResponseBody
	@RequestMapping(value="getpartner.wo", produces="application/json; charset=utf-8")
	public void getPartner(@RequestParam("bId") String partnerNum, HttpServletResponse response) throws JsonIOException, IOException {
//		ArrayList<Partner> list = aService.getPartner(partnerNum);
//		response.setContentType("application/json;charset=utf-8");
//		
//		Gson gson = new GsonBuilder().setDateFormat("yyyy/MM/dd").create();
//		gson.toJson(list,response.getWriter());
		
	}
	//제품 가져오기
	@ResponseBody
	@RequestMapping(value="getproduct.wo", produces="application/json; charset=utf-8")
	public void getProduct(@RequestParam("bId") String productCode, HttpServletResponse response) throws JsonIOException, IOException {
//		ArrayList<Product> list = aService.getProduct(productCode);
//		response.setContentType("application/json;charset=utf-8");
//		
//		Gson gson = new GsonBuilder().setDateFormat("yyyy/MM/dd").create();
//		gson.toJson(list,response.getWriter());
		
	}
	@ResponseBody
	@RequestMapping(value="accountlist.wo", produces="application/json; charset=utf-8")
	public void accountList(@RequestParam("content") String content, HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<AccountStatus> list = aService.accountStatus(content.substring(2));
		int sum1=0;
		int sum2 = 0;
		for (int i = 0; i < list.size(); i++) {
			sum1+=list.get(i).getAccount1();
			sum2+=list.get(i).getAccount2();
		}
		AccountStatus as = new AccountStatus("차변합계  ", sum1, "대변 합계  ", sum2);
		list.add(as);
		Gson gson = new GsonBuilder().setDateFormat("yyyy/mm/dd").create();
		gson.toJson(list,response.getWriter());
	}
	@ResponseBody
	@RequestMapping(value="incomelist.wo", produces="application/json; charset=utf-8")
	public void incomeList(@RequestParam(value = "content", required = false) String content,
			HttpServletResponse response) throws JsonIOException, IOException {
		String[] date=content.split(" ");
		String startDate =new String();
		String endDate =new String();
		if(date[0].equals("년")) {
			startDate=date[1].substring(2)+"/01/01";
			endDate=date[1].substring(2)+"/12/31";
		}else {
			startDate = date[1].substring(2);
			endDate = date[1].substring(2);
			switch (date[2]) {
			case "1/4":
				startDate +="/01/01";
				endDate +="/03/31";
				break;
			case "2/4":
				startDate +="/04/01";
				endDate +="/06/30";
				break;
			case "3/4":
				startDate +="/07/01";
				endDate +="/09/30";
				break;
			case "4/4":
				startDate +="/10/01";
				endDate +="/12/31";
				break;

			default:
				break;
			}
		}
		IsState iss = new IsState(startDate, endDate);
//		int validCheck = aService.validCheck(noticeTitle);
//		if(validCheck<1) {
//			int result =aService.insertIncome(iss);
//			System.out.println("결과...."+result);
//		}
		ArrayList<IncomeStatement> list = aService.incomeStatus(iss);
		//비용합계
		int sum =0;
		for (int i = 1; i < list.size(); i++) {
			sum+= list.get(i).getAccount();
		}
		int EBIT=list.get(0).getAccount()-sum;
		IncomeStatement is1 = new IncomeStatement();
		is1.setAccountSubject("매출");
		is1.setAccount(list.get(0).getAccount());
		IncomeStatement is2 = new IncomeStatement();
		is2.setAccountSubject("비용");
		is2.setAccount(sum);
		IncomeStatement is3 = new IncomeStatement("EBIT", EBIT);
		
		
		list.add(0, is1); //매출총계
		list.add(2, is2);//비용총계
		list.add(is3);//EBIT
		
		list.add(new IncomeStatement("세금", (int)Math.round(EBIT*0.15) ));
		list.add(new IncomeStatement("총수익", (int)Math.round(EBIT*0.85)));
		Gson gson = new GsonBuilder().setDateFormat("yyyy/mm/dd").create();
		gson.toJson(list,response.getWriter());
		
	}
	
	@ResponseBody
	@RequestMapping("check.wo")
	public void checkTitle(@RequestParam("content") String noticeTitle, HttpServletResponse response) throws JsonIOException, IOException {
		int check = aService.checkNotice(noticeTitle);
		Gson gson = new GsonBuilder().setDateFormat("yyyy/mm/dd").create();
		gson.toJson(check,response.getWriter());
	}
	@ResponseBody
	@RequestMapping("productinfo.wo")
	public void productInfo( HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Product> list = aService.productList();
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy/mm/dd").create();
		gson.toJson(list,response.getWriter());
	}
	@ResponseBody
	@RequestMapping("partnerInfo.wo")
	public void partnerInfo( HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Partner> list = aService.partnerList();
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy/mm/dd").create();
		gson.toJson(list,response.getWriter());
	}
	@RequestMapping("downexcel.wo")
	public String downExcel(@RequestParam("noticeContent") String noticeContent,
			@RequestParam("noticeAccType") int noticeAccType,
			@RequestParam("title") String title,Model model) {
		
		if(noticeAccType==2) {
			ArrayList<AccountStatus> list = aService.accountStatus(noticeContent.substring(2));
			int sum1=0;
			int sum2 = 0;
			for (int i = 0; i < list.size(); i++) {
				sum1+=list.get(i).getAccount1();
				sum2+=list.get(i).getAccount2();
			}
			AccountStatus as = new AccountStatus("차변합계  ", sum1, "대변 합계  ", sum2);
			list.add(as);
			model.addAttribute("list", list);
		}else if(noticeAccType==3) {
			String[] date=noticeContent.split(" ");
			String startDate =new String();
			String endDate =new String();
			if(date[0].equals("년")) {
				startDate=date[1].substring(2)+"/01/01";
				endDate=date[1].substring(2)+"/12/31";
			}else {
				startDate = date[1].substring(2);
				endDate = date[1].substring(2);
				switch (date[2]) {
				case "1/4":
					startDate +="/01/01";
					endDate +="/03/31";
					break;
				case "2/4":
					startDate +="/04/01";
					endDate +="/06/30";
					break;
				case "3/4":
					startDate +="/07/01";
					endDate +="/09/30";
					break;
				case "4/4":
					startDate +="/10/01";
					endDate +="/12/31";
					break;

				default:
					break;
				}
			}
			IsState iss = new IsState(startDate, endDate);
			ArrayList<IncomeStatement> list = aService.incomeStatus(iss);
			//비용합계
			int sum =0;
			for (int i = 1; i < list.size(); i++) {
				sum+= list.get(i).getAccount();
			}
			int EBIT=list.get(0).getAccount()-sum;
			IncomeStatement is1 = new IncomeStatement();
			is1.setAccountSubject("매출");
			is1.setAccount(list.get(0).getAccount());
			IncomeStatement is2 = new IncomeStatement();
			is2.setAccountSubject("비용");
			is2.setAccount(sum);
			IncomeStatement is3 = new IncomeStatement("EBIT", EBIT);
			
			
			list.add(0, is1); //매출총계
			list.add(2, is2);//비용총계
			list.add(is3);//EBIT
			
			list.add(new IncomeStatement("세금", (int)Math.round(EBIT*0.15) ));
			list.add(new IncomeStatement("총수익", (int)Math.round(EBIT*0.85)));
			model.addAttribute("list",list);
		}
		model.addAttribute("accType", noticeAccType);
		model.addAttribute("title", title);
		return "account/downExcel";
	}
	
	
	
	
	public void deleteFile(String renameFileName, HttpServletRequest request) {
		String root =request.getSession().getServletContext().getRealPath("resources")+"\\nupload\\"+renameFileName;
		File file = new File(root);
		if(file.exists()) {
			file.delete();
		}
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		//파일이 저장될 경로 설정
		String root= request.getSession().getServletContext().getRealPath("resources");
		String savePath = root+"\\nupload";
		
		File folder = new File(savePath);// 저장될 폴더
		if (!folder.exists()) {
			folder.mkdir();// 폴더가 없으면 폴더 생성해라
		}
		String originalFileName= file.getOriginalFilename();//원본명
		//파일명 수정작업 --> 년월일 시분초.확장자
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
				+ originalFileName.substring(originalFileName.lastIndexOf("."));
		
		//실제 저장될 경로 savePAth + 저장하고자 하는 파일명 renameFileName
		String renamePath = savePath + "\\"+renameFileName; //resources\bupload\20191004
		try {
			
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return renameFileName;
	}
	
	
	@RequestMapping("updateyearsalary.wo")
	public String updateYearSalary(@RequestParam("empNum") String empNum,
			@RequestParam(value = "salary", required = false) int salary,
			@RequestParam(value="empName") String empName,
			Model model) {
		SalaryManage sm = new SalaryManage();
		sm.setEmpNum(empNum);
		if(salary==0) {
			salary = 20000000;
		}
		sm.setYearSalary(salary);
		
		int result =aService.updateYearSalary(sm);
		if(result<1) {
			model.addAttribute("empNum", empNum);
			return "redirect:salarydetail.wo";
		}else {
			model.addAttribute("empNum",empNum);
			model.addAttribute("empName",empName);
			model.addAttribute("salary", salary);
			return "redirect:draftWrite.wo";
		}
	}
	
	
	@ResponseBody
	@RequestMapping("checkAttendance.wo")
	public void checkAttendance(HttpSession session, HttpServletResponse response) throws JsonIOException, IOException {
		String empId = ((Mypage)session.getAttribute("loginMan")).getNum();
		Attendance2 a = new Attendance2();
		a.setEmpNum(empId);
		Date d  = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YY/MM/dd");
		a.setToday(sdf.format(d));
		int result = aService.checkAtten(a);
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		Gson gson = new Gson();
		gson.toJson(obj, response.getWriter());
		
	}
	@RequestMapping("gowork.wo")
	public String goWork(HttpSession session) {
		
		Date d = new Date();
		String empId = ((Mypage)session.getAttribute("loginMan")).getNum();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		SimpleDateFormat sdf2 = new SimpleDateFormat("YY/MM/dd");
		Attendance2 a = new Attendance2(empId, sdf2.format(d), sdf.format(d));
		int result = aService.goWork(a);
		
		return "redirect:home.wo";
	}
	@RequestMapping("outwork.wo")
	public String outWork(HttpSession session) {
		Date d = new Date();
		String empId = ((Mypage)session.getAttribute("loginMan")).getNum();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		SimpleDateFormat sdf2 = new SimpleDateFormat("YY/MM/dd");
		Attendance2 a = new Attendance2(empId, sdf2.format(d), sdf.format(d));
		int result = aService.outWork(a);
		
		return "redirect:home.wo";
	}
}



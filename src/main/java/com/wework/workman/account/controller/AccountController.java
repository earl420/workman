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
import com.wework.workman.account.model.service.AccountService;
import com.wework.workman.account.model.vo.AcNotice;
import com.wework.workman.account.model.vo.AccountStatus;
import com.wework.workman.account.model.vo.Attendance2;
import com.wework.workman.account.model.vo.AvgSalary;
import com.wework.workman.account.model.vo.Fixture;
import com.wework.workman.account.model.vo.ForGraph;
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
	
	/**
	 * 회계공지 사항으로 가는 페이지
	 * 회계공지 리스트와 분기별 매출/비용을 배열에 담아 화면에 보내줌
	 * @param currentPage
	 * @return 공지사항목록
	 */
	@RequestMapping("acnoticeList.wo")
	public String accountList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,  Model model) {
		
		
		int listCount = aService.getNoticeListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<AcNotice> list = aService.noticeList(pi);
		for (int i = 0; i < list.size(); i++) {
			String nNo=list.get(i).getNoticeNum().substring(6);
			list.get(i).setNoticeNum(nNo);
		}
		
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy MM");
		String d = sdf.format(today);
		String[] spl = d.split(" ");
		int year = Integer.parseInt(spl[0]);
		int month = Integer.parseInt(spl[1]);
		int quarter =1;
		switch (month) {
		case 1:
		case 2:
		case 3:quarter=1;  break;
		case 4:
		case 5:
		case 6:quarter=2;break;
		case 7:
		case 8:
		case 9:quarter=3;break;
		case 10:
		case 11:
		case 12:quarter=4;break;
			
			

		default:
			break;
		}
		ForGraph grap = new ForGraph(year, quarter);
		ArrayList<ForGraph> graphList = new ArrayList<ForGraph>();
		for (int i = 0; i < 4; i++) {
			ForGraph fg =aService.getGraph(grap);
			graphList.add(fg);
			if (quarter==1) {
				quarter=4;
				year-=1;
				grap.setQuarter(quarter);
				grap.setYear(year);
			}else {
				quarter-=1;
				grap.setQuarter(quarter);
			}
		}
		
		
		
		
		model.addAttribute("graphList", graphList);
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		return "account/aNotice";
	}
	/**
	 * @return 공지작성페이지로 이동
	 */
	@RequestMapping("aninsertpage.wo")
	public String anInsertPage() {
		return "account/insertNotice";
	}
	/**
	 * 공지작성 컨트롤러
	 * 공지 타입이 3일 때 손익계산서 입력
	 * 그때 분기인 경우 회계처리를 해서 입력해야하기 떄문에 회계처리하는 insert추가
	 * 
	 * @param noticeTitle
	 * @param noticeContent
	 * @param noticeAccType
	 * @param insertDate
	 * @param ir1
	 * @param file
	 * @param session
	 * @param request
	 * @return 공지작성
	 */
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
		if (!file.getOriginalFilename().equals("")) {
			renameFileName=saveFile(file,request);
			if(renameFileName !=null) {				
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
	/**
	 * 
	 * 공지사항 상세보기 페이지
	 * @param acDetail
	 * @param model
	 * @return 상세보기페이지
	 */
	@RequestMapping("acDetail.wo")
	public String aNoticeDetail(@RequestParam(name = "noticeNum", required = false, defaultValue = "") String acDetail, Model model) {
		AcNotice notice = aService.noticeDetail(acDetail);
		NoticeFile file = aService.noticeFile(acDetail);
		model.addAttribute("notice", notice);
		model.addAttribute("file",file);
		//파일도 넣는처리할것 
		return "account/detailNotice";
	}
	/**
	 * 판매목록으로 이동
	 * @param currentPage
	 * @param model
	 * @return 판매목록
	 */
	@RequestMapping("salelist.wo")
	public String saleList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			Model model) {		
		int listCount = aService.getSaleListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<SaleManage> list = aService.saleList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "account/saleList";
	}
	/**
	 * 판매정보들을 받아 판매 등록하는 페이지
	 * @param productCode
	 * @param partnerNum
	 * @param salesAmount
	 * @param empNum
	 * @return 판매등록 페이지
	 */
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
	/**
	 * os 목록으로 이동하는 페이지
	 * @param currentPage
	 * @param model
	 * @return os목록으로이동
	 */
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
	/**
	 * 비품리슽트로 가는 페이지
	 * 비품의 잔존가치계산까지 해서 객체에 담아서 보내줌
	 * @param currentPage
	 * @param model
	 * @return 비품리스트
	 * @throws ParseException
	 */
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
			int diff = Math.abs((int)(todayParse.getTime()-listDayParse.getTime())/(24*60*60*1000*365));
			int val = (list.get(i).getFixturePrice()/list.get(i).getEndurance())*(list.get(i).getEndurance()-diff);
			list.get(i).setResidualValue(val);
		}
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "account/fixtureList";
	}
	/**
	 * 월급 관리페이지로이동
	 * @param currentPage
	 * @param model
	 * @return 월급 관리 페이지
	 */
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
	/**
	 * 월급 상세보기페이지
	 * 지정한 사원의 연별 연봉을 받아가고 전체,부서별,직급별 평균연봉값을 받아 같이 넘겨줌
	 * @param empNum
	 * @param model
	 * @return 월급 상세보기페이지
	 */
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
	
	
	/**
	 * 재무상태표 불러오는 곳
	 * 차변,대변 합계 처리를해서 붙여줌
	 * @param content
	 * @param response
	 * @throws JsonIOException
	 * @throws IOException
	 */
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
	/**
	 * 손익계산서 데이터를 받아서 반환
	 * @param content
	 * @param response
	 * @throws JsonIOException
	 * @throws IOException
	 */
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

		ArrayList<IncomeStatement> list = aService.incomeStatus(iss);
		//비용합계
		int sum =0;
		for (int i = 1; i < list.size(); i++) {
			sum+= list.get(i).getAccount();
		}
		long EBIT=list.get(0).getAccount()-sum;
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
	
	/**
	 * 분기별 손익계산서로 공지사항 작성시 회계처리가 됨으로 
	 * 공지사항 제목이 중복되는 가 체크
	 * @param noticeTitle
	 * @param response
	 * @throws JsonIOException
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping("check.wo")
	public void checkTitle(@RequestParam("content") String noticeTitle, HttpServletResponse response) throws JsonIOException, IOException {
		int check = aService.checkNotice(noticeTitle);
		Gson gson = new GsonBuilder().setDateFormat("yyyy/mm/dd").create();
		gson.toJson(check,response.getWriter());
	}
	/**
	 * 제품 정보를 받아옴
	 * @param response
	 * @throws JsonIOException
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping("productinfo.wo")
	public void productInfo( HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Product> list = aService.productList();
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy/mm/dd").create();
		gson.toJson(list,response.getWriter());
	}
	/**
	 * 
	 * 거래처 정보받아옴
	 * @param response
	 * @throws JsonIOException
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping("partnerInfo.wo")
	public void partnerInfo( HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Partner> list = aService.partnerList();
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy/mm/dd").create();
		gson.toJson(list,response.getWriter());
	}
	/**
	 * 손익계산서나 재무상태표를 엑셀로 다운로드 시키는 컨트롤러
	 * @param noticeContent
	 * @param noticeAccType
	 * @param title
	 * @param model
	 * @return 회계다운로드 페이지
	 */
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
			long EBIT=list.get(0).getAccount()-sum;
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
	
	
	
	

	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		//파일이 저장될 경로 설정
		String root= request.getSession().getServletContext().getRealPath("resources");
		String savePath = root+"\\nupload";
		
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdir();
		}
		String originalFileName= file.getOriginalFilename();//원본명
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
	
	
	/**
	 * 연봉 정보업데이트
	 * @param empNum
	 * @param salary
	 * @param empName
	 * @param model
	 * @return 기안서작성페이지
	 */
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
	
	
	/**
	 * 오늘 출근했는지 유무롤 확인
	 * @param session
	 * @param response
	 * @throws JsonIOException
	 * @throws IOException
	 */
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
	/**
	 * 출근
	 * @param session
	 * @return
	 */
	@RequestMapping("gowork.wo")
	public String goWork(HttpSession session) {
		
		Date d = new Date();
		String empId = ((Mypage)session.getAttribute("loginMan")).getNum();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		SimpleDateFormat sdf2 = new SimpleDateFormat("YY/MM/dd");
		Attendance2 a = new Attendance2(empId, sdf2.format(d), sdf.format(d));
		int result = aService.goWork(a);
		
		return "home";
	}
	/**
	 * @param session
	 * @return 퇴근
	 */
	@RequestMapping("outwork.wo")
	public String outWork(HttpSession session) {
		Date d = new Date();
		String empId = ((Mypage)session.getAttribute("loginMan")).getNum();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		SimpleDateFormat sdf2 = new SimpleDateFormat("YY/MM/dd");
		Attendance2 a = new Attendance2(empId, sdf2.format(d), sdf.format(d));
		int result = aService.outWork(a);
		
		return "home";
	}
	@ResponseBody
	@RequestMapping("deptFixInfo.wo")
	public void deptFixInfo(HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Fixture> list = aService.deptFixInfo();
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy/mm/dd").create();
		gson.toJson(list,response.getWriter());
	}
	@ResponseBody
	@RequestMapping("deptEmpInfo.wo")
	public void deptEmpInfo(@RequestParam(value = "deptNum", required = false) int deptNum,
			HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<AcNotice> list = aService.deptEmpInfo(deptNum);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy/mm/dd").create();
		gson.toJson(list,response.getWriter());
	}
	
	@RequestMapping("insertFixture.wo")
	public String insertFixture(
			@RequestParam(value = "product", required=false) String product,
			@RequestParam(value = "productType", required=false) String productType,
			@RequestParam(value = "partner", required=false) String partner,
			@RequestParam(value = "deptNum", required=false) int deptNum,
			@RequestParam(value = "saleCount", required=false) int saleCount,
			@RequestParam(value = "salePrice", required=false) int salePrice,
			@RequestParam(value = "endurance", required=false) int endurance,
			@RequestParam(value = "empNum", required=false) String empNum,
			Model model) {
			
		Fixture f = new Fixture();
		f.setFixtureType(productType);
		f.setFixtureName(product);
		f.setDeptNum(deptNum);
		f.setSaleCount(saleCount);
		f.setFixturePrice(salePrice);
		f.setEndurance(endurance);
		f.setEmpNum(empNum);
		//거래처 번호 deptName에 받아넘김
		f.setDeptName(partner);
		int result = aService.insertFixture(f);
		if (result>0) {
			
			String msg = product+"를 " +salePrice +"에 구매하였음";
			model.addAttribute("msg", msg);
			model.addAttribute("partnerNum", partner);
			return "redirect:expenseWrite.wo";
		}else {
			return "common/500error";
		}
	}
	
	
	@RequestMapping("insertOs.wo")
	public String insertOs(
			@RequestParam(value = "product", required = false) String product,
			@RequestParam(value = "productCode", required = false) String productCode,
			@RequestParam(value = "partner", required = false) String partner,
			@RequestParam(value = "saleCount", required = false) int saleCount,
			@RequestParam(value = "salePrice", required = false) int salePrice,
			@RequestParam(value = "endurance", required = false) int endurance,
			@RequestParam(value = "empNum", required = false) String empNum,
			Model model) {
		
		OsManage o = new OsManage();
		o.setProductName(product);
		o.setLicenseNum(productCode);
		o.setPartnerNum(partner);
		o.setSaleCount(saleCount);
		o.setSalePrice(salePrice);
		o.setEndurance(endurance);
		o.setEmpNum(empNum);
		
		int result = aService.insertOs(o);
		
		if (result>0) {
			String msg = product+"를 " +salePrice +"에 구매하였음";
			model.addAttribute("msg", msg);
			model.addAttribute("partnerNum", partner);
			return "redirect:expenseWrite.wo";
		}else {
			return "common/500error";
		}
		
	}
	@RequestMapping("deleteemp.wo")
	public String deleteEmp(@RequestParam(value = "empNum") String empNum) {
		int result = aService.deleteEmp(empNum);
		if(result>0) {
			
			return "redirect:mngUser.wo";
		}
		return "redirect:mngUser.wo";
	}
}



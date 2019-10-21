package com.wework.workman.account.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.wework.workman.account.model.service.AccountService;
import com.wework.workman.account.model.vo.AcNotice;
import com.wework.workman.account.model.vo.Fixture;
import com.wework.workman.account.model.vo.OsManage;
import com.wework.workman.account.model.vo.Partner;
import com.wework.workman.account.model.vo.Product;
import com.wework.workman.account.model.vo.SalaryManage;
import com.wework.workman.account.model.vo.SaleManage;
import com.wework.workman.common.PageInfo;
import com.wework.workman.common.Pagination;

@Controller
public class AccountController {
	@Resource(name="accountService")
	private AccountService aService;
	
	@RequestMapping("acnoticeList.wo")
	public String accountList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value="search", required = false, defaultValue = "") String search1) {
//		
//		String[] search= search1.split(" ");
//		
//		int listCount = aService.getNoticeListCount(search);
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
//		ArrayList<AcNotice> list = aService.noticeList(search,pi);
		
		
		return "account/aNotice";
	}
	@RequestMapping("aninsertpage.wo")
	public String anInsertPage() {
		return "account/insertNotice";
	}
	@RequestMapping("aninsert.wo")
	public String aNoticeInsert(@RequestParam("noticeTitle") String noticeTitle,
			@RequestParam(value="noticeContent", required = false) String noticeContent,
			@RequestParam("noticeType") int noticeAccType,
			@RequestParam(value="insertDate", required = false) String insertDate,
			@RequestParam(value="type", required=false) String type,
			@RequestParam(value="term", required=false) String term,
			HttpSession session) {
		
//		String empNum=(Member)session.getAttribute("loginUser").getEmpNum();
//		String deptNum=(Member)session.getAttribute("loginUser").getdeptNum();
//		AcNotice notice = new AcNotice(deptNum, noticeTitle, null, empNum, noticeAccType);
//		if(noticeAccType==1) {
			//일반공지
//			notice.setNoticeContent(noticeContent);
			
//		}else if (noticeAccType==2) {
			//재무상태표
			//기존에 같은 날짜의 재무상태표가있는지 체크
//			int check = aService.checkNotice(noticeTitle);
//			if(check>0) {
//				return "redirect:"
//			}
//			notice.setNoticeContent(insertDate);
//		}else if(noticeAccType==3) {
			//손익계산서
//			int check = aService.checkNotice(noticeTitle);
//			if(check>0) {
//				return "redirect:"
//			}
//			notice.setNoticeContent(type+" " + term);
//		}
		
//		int result = aService.aNoticeInsert(notice);
//		if(result<1) {
//			return "common/errorPage";
//		}
		return "redirect:acnoticeList.wo";
	}
	@RequestMapping("acDetail.wo")
	public String aNoticeDetail(@RequestParam(name = "aNo", defaultValue = "1") String aNo , Model model) {
//		AcNotice notice = aService.noticeDetail(aNo);
//		model.addAttribute("notice", notice);
//		if(notice.getNoticeAccType()==2) {
//			
//		ajax로 나중에 처리 재무상태표
//			ArrayList<AccountStatus> as = aService.accountStatus(notice.getNoticeContent());
//		}else if(notice.getNoticeAccType()==3) {
//			ajax로 나중에 처리 손익계산서
//			String[] date = notice.getNoticeContent().split(" ");
//			IsState iss = new IsState(date[0], date[1]);
//			ArrayList<IncomeStatement> is = aService.incomeStatus(iss);
//			연간으로 할 떄는 안해도되게 처리  매출과 비용은 그냥 차변에서대변 빼는 것과 같은 작업 하지않고 가지고 올것
//			int income = is.get(is.length-1).getAccount();
//			int result = aService.insertIncome(income);
//			세금도 몇번째 위친지 확인해서 넣는 작업해줘야함
//			다른거 검색하는 항목있을시 null값 처리해주는 작업해줘야
//			arrayList로 변환 하는 작업도 해줘야된다...
//		}
		return "account/detailNotice";
	}
	@RequestMapping("salelist.wo")
	public String saleList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value="type", required = false, defaultValue = "") String type,
			@RequestParam(value="search", required = false, defaultValue = "") String search1) {
		
//		String[] search= search1.split(" ");
//		
//		int listCount = aService.getSaleListCount(search);
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
//		ArrayList<SaleManage> list = aService.saleList(search,pi);
		return "account/saleList";
	}
	@RequestMapping("insertsale.wo")
	public String insertSale(@RequestParam("productCode") String productCode,
			@RequestParam("partnerNum") String partnerNum,
			@RequestParam("salesAmount") int salesAmount,
			@RequestParam("productPrice") int productPrice) {
//		SaleManage sm = new SaleManage();
//		sm.setProductCode(productCode);
//		sm.setPartnerNum(partnerNum);
//		sm.setSalesAmount(salesAmount);
//		sm.setProductPrice(productPrice);
//		int result = aService.insertSale(sm);
		return "redirect:salelist.wo"; 
	}
	@RequestMapping("oslist.wo")
	public String osList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value="type", required = false, defaultValue = "") String type,
			@RequestParam(value="search", required = false, defaultValue = "") String search1) {
		
//		String[] search= search1.split(" ");
//		
//		int listCount = aService.getOSListCount(search);
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
//		ArrayList<OsManage> list = aService.osList(search,pi);
		return "account/osList";
	}
	@RequestMapping("fixturelist.wo")
	public String fixtureList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value="type", required = false, defaultValue = "") String type,
			@RequestParam(value="search", required = false, defaultValue = "") String search1) {
		
//		String[] search= search1.split(" ");
//		
//		int listCount = aService.getFixtureListCount(search);
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
//		ArrayList<Fixture> list = aService.fixtureList(search,pi);
		return "account/fixtureList";
	}
	@RequestMapping("salarylist.wo")
	public String salaryList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value="type", required = false, defaultValue = "") String type,
			@RequestParam(value="search", required = false, defaultValue = "") String search1) {
		
//		String[] search= search1.split(" ");
//		
//		int listCount = aService.getSalaryListCount(search);
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
//		ArrayList<SalaryManage> list = aService.salaryList(search,pi);
		return "account/salaryList";
	}
	@RequestMapping("salarydetail.wo")
	public String salaryDetail(@RequestParam(value = "empNum") String empNum) {
//		SalaryManage salary = aService.salaryDetail(empNum);
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
}

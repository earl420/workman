package com.wework.workman.account.model.service;

import java.util.ArrayList;
import java.util.List;

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

public interface AccountService {
	//회계공지 갯수
	int getNoticeListCount();
	//회계 공지 리스트 가져오기
	ArrayList<AcNotice> noticeList(PageInfo pi);
	//회계공지 상세보기
	AcNotice noticeDetail(String aNo);
	//회계공지 작성
	int aNoticeInsert(AcNotice acNotice);
	//공지를 같은 제목으로는 작성 못하게 하기위해 체크
	int checkNotice(String noticeTitle);
	//재무상태표 불러오기
	ArrayList<AccountStatus> accountStatus(String noticeContent);
	//손익계산서불러오기
	ArrayList<IncomeStatement> incomeStatus(IsState iss);
	//분기별로 손익계산시 값대입
	int insertIncome(IsState iss);
	//판매 목록 갯수 가져오기
	int getSaleListCount();
	//판매목록가져오기
	ArrayList<SaleManage> saleList(PageInfo pi);
	//판매 등록
	int insertSale(SaleManage sm);
	//os리스트갯수 가져오기
	int getOSListCount();
	//os 리스트 가져오기
	ArrayList<OsManage> osList(PageInfo pi);
	//비품 리스트 갯수 가져오기
	int getFixtureListCount();
	//비품목록 가져오기
	ArrayList<Fixture> fixtureList(PageInfo pi);
	//연봉리스트 갯수 가져오기
	int getSalaryListCount();
	//연봉 리스트 가져오기
	ArrayList<SalaryManage> salaryList(PageInfo pi);
	//연봉 상세보기 페이지
	ArrayList<SalaryManage> salaryDetail(String empNum);
	//올해 연봉이 입력되어있나 체크
	int checkSalary();
	//거래처 정보 가져오기
	ArrayList<Partner> getPartner(String partnerNum);
	//상품 정보가져오기
	ArrayList<Product> getProduct(String productCode);
	//공지를 같은 제목으로는 작성 못하게 하기위해 체크
	int validCheck(String noticeTitle);
	//제품 리스트 가져오기
	ArrayList<Product> productList();
	//거래처 정보 가져오기
	ArrayList<Partner> partnerList();
	//평균연봉 가져오기
	AvgSalary avgSalary(SalaryManage salaryManage);
	//이번달 임금이 지급되었는지 확인
	int checkSal();
	//이번달 임금이 지급 안되었다면 입력
	int insertSal();
	//올해 연봉이 입력되어있는지확인
	int checkYearSal();
	//올해 연봉 입력
	int insertYearSalary();
	//공지 파일 작성
	int insertFile(NoticeFile nf);
	//공지 파일 가져오기
	NoticeFile noticeFile(String acDetail);
	//연봉 업데이트
	int updateYearSalary(SalaryManage sm);
	//오늘 출석체크 했나 확인
	int checkAtten(Attendance2 a);
	//출근 
	int goWork(Attendance2 a);
	//퇴근
	int outWork(Attendance2 a);
	//그래프 자료값 가져오기
	ForGraph getGraph(ForGraph grap);
	
	Partner selectPartner(String partnerNum);

	
}

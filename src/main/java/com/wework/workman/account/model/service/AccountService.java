package com.wework.workman.account.model.service;

import java.util.ArrayList;
import java.util.List;

import com.wework.workman.account.model.vo.AcNotice;
import com.wework.workman.account.model.vo.AccountStatus;
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

public interface AccountService {

	int getNoticeListCount();

	ArrayList<AcNotice> noticeList(PageInfo pi);

	AcNotice noticeDetail(String aNo);

	int aNoticeInsert(AcNotice acNotice);

	int checkNotice(String noticeTitle);

	ArrayList<AccountStatus> accountStatus(String noticeContent);

	ArrayList<IncomeStatement> incomeStatus(IsState iss);

	int insertIncome(IsState iss);

	int getSaleListCount();

	ArrayList<SaleManage> saleList(PageInfo pi);

	int insertSale(SaleManage sm);

	int getOSListCount();

	ArrayList<OsManage> osList(PageInfo pi);

	int getFixtureListCount();

	ArrayList<Fixture> fixtureList(PageInfo pi);

	int getSalaryListCount();

	ArrayList<SalaryManage> salaryList(PageInfo pi);

	ArrayList<SalaryManage> salaryDetail(String empNum);

	int checkSalary();

	ArrayList<Partner> getPartner(String partnerNum);

	ArrayList<Product> getProduct(String productCode);

	int validCheck(String noticeTitle);

	ArrayList<Product> productList();

	ArrayList<Partner> partnerList();

	AvgSalary avgSalary(SalaryManage salaryManage);

	int checkSal();

	int insertSal();

	int checkYearSal();

	int insertYearSalary();

	int insertFile(NoticeFile nf);

	NoticeFile noticeFile(String acDetail);

	
}

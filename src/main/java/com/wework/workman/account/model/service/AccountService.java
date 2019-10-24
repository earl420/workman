package com.wework.workman.account.model.service;

import java.util.ArrayList;
import java.util.List;

import com.wework.workman.account.model.vo.AcNotice;
import com.wework.workman.account.model.vo.AccountStatus;
import com.wework.workman.account.model.vo.Fixture;
import com.wework.workman.account.model.vo.IncomeStatement;
import com.wework.workman.account.model.vo.IsState;
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

	int insertIncome(int income);

	int getSaleListCount(ArrayList<String> search);

	ArrayList<SaleManage> saleList(ArrayList<String> search, PageInfo pi);

	int insertSale(SaleManage sm);

	int getOSListCount(ArrayList<String> search);

	ArrayList<OsManage> osList(ArrayList<String> search, PageInfo pi);

	int getFixtureListCount(ArrayList<String> search);

	ArrayList<Fixture> fixtureList(ArrayList<String> search, PageInfo pi);

	int getSalaryListCount(ArrayList<String> search);

	ArrayList<SalaryManage> salaryList(ArrayList<String> search, PageInfo pi);

	SalaryManage salaryDetail(String empNum);

	int checkSalary();

	int insertSalary();

	ArrayList<Partner> getPartner(String partnerNum);

	ArrayList<Product> getProduct(String productCode);

	
}

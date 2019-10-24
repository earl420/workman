package com.wework.workman.account.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wework.workman.account.model.dao.AccountDao;
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

@Service("accountService")
public class AccountServiceImpl implements AccountService{
	@Resource(name="accountDao")
	private AccountDao aDao;

	@Override
	public int getNoticeListCount() {
		return aDao.getNoticeListCount();
	}

	@Override
	public ArrayList<AcNotice> noticeList( PageInfo pi) {
		return aDao.noticeList(pi);
	}

	@Override
	public AcNotice noticeDetail(String aNo) {
		return aDao.noticeDetail(aNo);
	}

	@Override
	public int aNoticeInsert(AcNotice acNotice) {
		return aDao.aNoticeInsert(acNotice);
	}

	@Override
	public int checkNotice(String noticeTitle) {
		return aDao.checkNotice(noticeTitle);
	}

	@Override
	public ArrayList<AccountStatus> accountStatus(String noticeContent) {
		return aDao.accountStatus(noticeContent);
	}

	@Override
	public ArrayList<IncomeStatement> incomeStatus(IsState iss) {
		//notice insert 할때 처리하자
//		//연단위 소모품 감가상각할 총비용
//		int sumFixtureDiscount = aDao.sumFixtureDiscount(iss);
//		//감가상각한 거 비용처리해서 update
//		int result1= aDao.updateFixture(sumFixtureDiscount);
//		//연단위 소프트웨어 감가상각할 총비용
//		int sumOsDiscount = aDao.sumOsDiscount(iss);
//		//감가상각한거 비용처리해서 update
//		int result2= aDao.updateOs(sumOsDiscount);
		
		return aDao.incomeStatus(iss);
	}

	@Override
	public int insertIncome(int income) {
		return aDao.insertIncome(income);
	}

	@Override
	public int getSaleListCount(ArrayList<String> search) {
		return aDao.getSaleListCount(search);
	}

	@Override
	public ArrayList<SaleManage> saleList(ArrayList<String> search, PageInfo pi) {
		return aDao.saleList(search,pi);
	}

	@Override
	public int insertSale(SaleManage sm) {
		return aDao.insertSale(sm);
	}

	@Override
	public int getOSListCount(ArrayList<String> search) {
		return aDao.OSListCount(search);
	}

	@Override
	public ArrayList<OsManage> osList(ArrayList<String> search, PageInfo pi) {
		return aDao.osList(search,pi);
	}

	@Override
	public int getFixtureListCount(ArrayList<String> search) {
		return aDao.getFixtureListCount(search);
	}

	@Override
	public ArrayList<Fixture> fixtureList(ArrayList<String> search, PageInfo pi) {
		return aDao.fixtureList(search,pi);
	}

	@Override
	public int getSalaryListCount(ArrayList<String> search) {
		return aDao.getSalaryListCount(search);
	}

	@Override
	public ArrayList<SalaryManage> salaryList(ArrayList<String> search, PageInfo pi) {
		return aDao.salaryList(search,pi);
	}

	@Override
	public SalaryManage salaryDetail(String empNum) {
		return aDao.salaryDetail(empNum);
	}

	@Override
	public int checkSalary() {
		return aDao.checkSalary();
	}

	@Override
	public int insertSalary() {
		return aDao.insertSalary();
	}

	@Override
	public ArrayList<Partner> getPartner(String partnerNum) {
		return aDao.getPartner(partnerNum);
	}

	@Override
	public ArrayList<Product> getProduct(String productCode) {
		return aDao.getProduct(productCode);
	}

	
}

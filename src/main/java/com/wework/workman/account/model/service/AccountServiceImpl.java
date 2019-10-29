package com.wework.workman.account.model.service;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.wework.workman.account.model.dao.AccountDao;
import com.wework.workman.account.model.vo.AcNotice;
import com.wework.workman.account.model.vo.AccountStatus;
import com.wework.workman.account.model.vo.AvgSalary;
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
	@Autowired
	private DataSourceTransactionManager transactionManager; 
	@Autowired
	private SqlSessionTemplate sqlSession;
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
	public int getSaleListCount() {
		return aDao.getSaleListCount();
	}

	@Override
	public ArrayList<SaleManage> saleList( PageInfo pi) {
		return aDao.saleList(pi);
	}

	@Override
	public int insertSale(SaleManage sm) {
		int result1 =aDao.insertSaleAccount(sm);
		int result2=aDao.insertSale(sm);
		if (result1>0&&result2>0) {
			result1=1;
		}else {
			result1=0;
		}
		return result1;
	}

	@Override
	public int getOSListCount() {
		return aDao.OSListCount();
	}

	@Override
	public ArrayList<OsManage> osList( PageInfo pi) {
		return aDao.osList(pi);
	}

	@Override
	public int getFixtureListCount() {
		return aDao.getFixtureListCount();
	}

	@Override
	public ArrayList<Fixture> fixtureList( PageInfo pi) {
		return aDao.fixtureList(pi);
	}

	@Override
	public int getSalaryListCount() {
		return aDao.getSalaryListCount();
	}

	@Override
	public ArrayList<SalaryManage> salaryList(PageInfo pi) {
		return aDao.salaryList(pi);
	}

	@Override
	public ArrayList<SalaryManage> salaryDetail(String empNum) {
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

	@Override
	public int validCheck(String noticeTitle) {
		return aDao.validCheck(noticeTitle);
	}

	@Override
	public int insertIncome(IsState iss) {
		// 트랜잭션 에 대한 기본 세팅을 위한 객체
//		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
//		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
////		TransactionDefinition.PROPAGATION_REQUIRED;
//		//이미 하나의 트랜잭션이 존재한다면 같이 하나의 트랜잭션으로 묶고
//		//없다면 새로운 트랜잭션을 시작한다.
//		TransactionStatus status = transactionManager.getTransaction(def);
//		try {
//			sqlSession.getConnection().setAutoCommit(false);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		//트랜잭션 상태 관리하는 객체
		
		//회원가입되면서 바로 게시판 테이블에 회원이 가입되었다는 게시글 추가
		int r1 = aDao.insertIncome1(iss);
		int r2= aDao.insertIncome2(iss);
		int r3= aDao.insertIncome3(iss);
		int r4= aDao.insertIncome4(iss);
		int r5= aDao.insertIncome5(iss);
		int r6= aDao.insertIncome6(iss);
		int r7= aDao.insertIncome7(iss);
		int r8= aDao.insertIncome8(iss);
		int r9= aDao.insertIncome9(iss);
		int result=0;
		if (r1>0&&r2>0&&r3>0&&r4>0&&r5>0&&r6>0&&r7>0&&r8>0&&r9>0) {
			result=1;
//			transactionManager.commit(status);
		}
//		else {
//			transactionManager.rollback(status);
//		}
		System.out.println(result);
		return result;
		
		
	}

	@Override
	public ArrayList<Product> productList() {
		return aDao.productList();
	}

	@Override
	public ArrayList<Partner> partnerList() {
		return aDao.partnerList();
	}

	@Override
	public AvgSalary avgSalary(SalaryManage salaryManage) {
		return aDao.avgSalary(salaryManage);
	}

	
}

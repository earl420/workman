package com.wework.workman.account.model.dao;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository("accountDao")
public class AccountDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getNoticeListCount() {
		return sqlSession.selectOne("accountMapper.getNoticeListCount");
	}

	public ArrayList<AcNotice> noticeList(PageInfo pi) {
		int offset =(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("accountMapper.noticeList",null,rb);
	}

	public AcNotice noticeDetail(String aNo) {
		return sqlSession.selectOne("accountMapper.noticeDetail", aNo);
	}

	public int aNoticeInsert(AcNotice acNotice) {
		return sqlSession.insert("accountMapper.aNoticeInsert", acNotice);
	}

	public int checkNotice(String noticeTitle) {
		return sqlSession.selectOne("accountMapper.validCheck",noticeTitle);
	}

	public ArrayList<AccountStatus> accountStatus(String noticeContent) {
		return (ArrayList)sqlSession.selectList("accountMapper.accountStatus", noticeContent);
	}

	public int sumFixtureDiscount(IsState iss) {
		return sqlSession.selectOne("accountMapper.sumFixtureDiscount", iss);
	}
	
	public int updateFixture(int sumFixtureDiscount) {
		return sqlSession.insert("accountMapper.updateFixture", sumFixtureDiscount);
	}
	public int sumOsDiscount(IsState iss) {
		return sqlSession.selectOne("accountMapper.sumOsDiscount", iss);
	}

	public int updateOs(int sumOsDiscount) {
		return sqlSession.insert("accountMapper.updateOs",sumOsDiscount);
	}
	public ArrayList<IncomeStatement> incomeStatus(IsState iss) {
		return (ArrayList)sqlSession.selectList("accountMapper.incomeStatus", iss);
	}



	public int getSaleListCount() {
		return sqlSession.selectOne("accountMapper.getSaleListCount");
	}

	public ArrayList<SaleManage> saleList(PageInfo pi) {
		
		int offset =(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("accountMapper.saleList",null,rb);
	}

	public int insertSale(SaleManage sm) {
		//판매관리에도 추가되는작업 서비스단에 해줄것
		return sqlSession.insert("accountMapper.insertSale", sm);
	}

	public int OSListCount() {
		return sqlSession.selectOne("accountMapper.osListCount");
	}

	public ArrayList<OsManage> osList(PageInfo pi) {
		int offset =(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("accountMapper.osList",null,rb);
	}

	public int getFixtureListCount() {
		return sqlSession.selectOne("accountMapper.getFixtureListCount");
	}

	public ArrayList<Fixture> fixtureList(PageInfo pi) {
		int offset =(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("accountMapper.fixtureList",null,rb);
	}

	public int getSalaryListCount() {
		return sqlSession.selectOne("accountMapper.getSalaryListCount");
	}

	public ArrayList<SalaryManage> salaryList(PageInfo pi) {
		int offset =(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("accountMapper.salaryList",null,rb);
	}

	public ArrayList<SalaryManage> salaryDetail(String empNum) {
		return (ArrayList)sqlSession.selectList("accountMapper.salaryDetail", empNum);
	}
	//이번달에 월급입금확인
	public int checkSalary() {
		return sqlSession.selectOne("accountMapper.checkSalary");
	}

	
	//Num -> Name으로 해줄것
	public ArrayList<Partner> getPartner(String partnerNum) {
		return (ArrayList)sqlSession.selectList("accountMapper.getPartner",partnerNum);
	}
	//Num -> Name으로 해줄것
	public ArrayList<Product> getProduct(String productCode) {
		return (ArrayList)sqlSession.selectList("accountMapper.getProduct", productCode);
	}

	public int validCheck(String noticeTitle) {
		return sqlSession.selectOne("accountMapper.validCheck", noticeTitle);
	}

	public int insertIncome1(IsState iss) {
		
		int r1=sqlSession.insert("accountMapper.insertIncome1",iss);
		return r1;
	}

	public int insertIncome2(IsState iss) {
		return sqlSession.insert("accountMapper.insertIncome2",iss);
	}

	public int insertIncome3(IsState iss) {
		return sqlSession.insert("accountMapper.insertIncome3",iss);
	}

	public int insertIncome4(IsState iss) {
		return sqlSession.insert("accountMapper.insertIncome4",iss);
	}

	public int insertIncome5(IsState iss) {
		return sqlSession.insert("accountMapper.insertIncome5",iss);
	}

	public int insertIncome6(IsState iss) {
		return sqlSession.insert("accountMapper.insertIncome6",iss);
	}

	public int insertIncome7(IsState iss) {
		return sqlSession.insert("accountMapper.insertIncome7",iss);
	}

	public int insertIncome8(IsState iss) {
		return sqlSession.insert("accountMapper.insertIncome8",iss);
	}

	public int insertIncome9(IsState iss) {
		return sqlSession.insert("accountMapper.insertIncome9",iss);
	}

	public ArrayList<Product> productList() {
		return (ArrayList)sqlSession.selectList("accountMapper.productList");
	}

	public ArrayList<Partner> partnerList() {
		return (ArrayList)sqlSession.selectList("accountMapper.partnerList");
	}

	public int insertSaleAccount(SaleManage sm) {
		return sqlSession.insert("accountMapper.insertSaleAccount", sm);
	}

	public AvgSalary avgSalary(SalaryManage salaryManage) {
		return sqlSession.selectOne("accountMapper.avgSalary", salaryManage);
	}

	public int checkSal() {
		return sqlSession.selectOne("accountMapper.checkSal");
	}

	public int insertSal() {
		return sqlSession.insert("accountMapper.insertSal");
	}

	public int checkYearSal() {
		return sqlSession.selectOne("accountMapper.checkYearSal");
	}

	public int insertYearSalary() {
		return sqlSession.insert("accountMapper.insertYearSalary");
	}

	public int insertFile(NoticeFile nf) {
		return sqlSession.insert("accountMapper.insertFile", nf);
	}

	public NoticeFile noticeFile(String acDetail) {
		return sqlSession.selectOne("accountMapper.noticeFile",acDetail);
	}

	public Partner selectPartner(String partnerNum) {
		return sqlSession.selectOne("accountMapper.selectPartner",partnerNum);
	}

	public int getIncreaseRate(String li) {
		return sqlSession.selectOne("accountMapper.getIncreaseRate", li);
	}

	public int checkHolidayCount() {
		return sqlSession.selectOne("accountMapper.checkHolidayCount");
	}

	public int updateHolidayCount() {
		return sqlSession.insert("accountMapper.updateHolidayCount");
	}

	public int updateYearSalary(SalaryManage sm) {
		return sqlSession.update("accountMapper.updateYearSalary", sm);
	}

	public int updateEmpSalary(SalaryManage sm) {
		return sqlSession.update("accountMapper.updateEmpSalary", sm);
	}

	public int checkAtten(Attendance2 a) {
		return sqlSession.selectOne("accountMapper.checkAtten", a);
	}

	public int goWork(Attendance2 a) {
		return sqlSession.insert("accountMapper.goWork", a);
	}

	public int outWork(Attendance2 a) {
		return sqlSession.update("accountMapper.outWork", a);
	}

	public ForGraph getGraph(ForGraph grap) {
		return sqlSession.selectOne("accountMapper.getGraph", grap);
	}

	public ArrayList<Fixture> deptFixInfo() {
		return (ArrayList)sqlSession.selectList("accountMapper.deptFixInfo");
	}

	public ArrayList<AcNotice> deptEmpInfo(int deptNum) {
		return (ArrayList)sqlSession.selectList("accountMapper.deptEmpInfo",deptNum);
	}

	
	/**
	 * payment에 비품구매내역 insert
	 * @param f
	 * @return
	 */
	public int insertFixture1(Fixture f) {
		return sqlSession.insert("accountMapper.insertFixture1", f);
	}

	/**
	 * fixture에 비품구매내역 insert
	 * @param f
	 * @return
	 */
	public int insertFixture2(Fixture f) {
		// TODO Auto-generated method stub
		return sqlSession.insert("accountMapper.insertFixture2", f);
	}

	/**
	 * 분개장에 대입
	 * @param f
	 * @return
	 */
	public int insertFixture3(Fixture f) {
		return sqlSession.insert("accountMapper.insertFixture3", f);
	}

	public int insertOs1(OsManage o) {
		return sqlSession.insert("accountMapper.insertOs1", o);
	}

	public int insertOs2(OsManage o) {
		return sqlSession.insert("accountMapper.insertOs2", o);
	}

	public int insertOs3(OsManage o) {
		return sqlSession.insert("accountMapper.insertOs3", o);
	}
	
	


	
}

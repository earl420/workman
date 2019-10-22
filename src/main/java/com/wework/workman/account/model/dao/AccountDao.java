package com.wework.workman.account.model.dao;

import java.lang.reflect.Array;
import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository("accountDao")
public class AccountDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getNoticeListCount(ArrayList<String> search) {
		return sqlSession.selectOne("accountMapper.getNoticeListCount", search);
	}

	public ArrayList<AcNotice> noticeList(ArrayList<String> search, PageInfo pi) {
		int offset =(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("accountMapper.noticeList",search,rb);
	}

	public AcNotice noticeDetail(String aNo) {
		return sqlSession.selectOne("accountMapper.noticeDetail", aNo);
	}

	public int aNoticeInsert(AcNotice acNotice) {
		return sqlSession.insert("accountMapper.aNoticeInsert", acNotice);
	}

	public int checkNotice(String noticeTitle) {
		return sqlSession.selectOne("accountMapper.checkNotice",noticeTitle);
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

	public int insertIncome(int income) {
		//소모품비, OS비용, 인건비, 매출 다 0으로 만드는 작업해줘야함
		return sqlSession.insert("accountMapper.insertIncome", income);
	}

	public int getSaleListCount(ArrayList<String> search) {
		return sqlSession.selectOne("accountMapper.getSaleListCount", search);
	}

	public ArrayList<SaleManage> saleList(ArrayList<String> search, PageInfo pi) {
		
		int offset =(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("accountMapper.saleList",search,rb);
	}

	public int insertSale(SaleManage sm) {
		//판매관리에도 추가되는작업 서비스단에 해줄것
		return sqlSession.insert("accountMapper.insertSale", sm);
	}

	public int OSListCount(ArrayList<String> search) {
		return sqlSession.selectOne("accountMapper.osListCount",search);
	}

	public ArrayList<OsManage> osList(ArrayList<String> search, PageInfo pi) {
		int offset =(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("accountMapper.osList",search,rb);
	}

	public int getFixtureListCount(ArrayList<String> search) {
		return sqlSession.selectOne("accountMapper.getFixtureListCount", search);
	}

	public ArrayList<Fixture> fixtureList(ArrayList<String> search, PageInfo pi) {
		int offset =(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("accountMapper.fixtureList",search,rb);
	}

	public int getSalaryListCount(ArrayList<String> search) {
		return sqlSession.selectOne("accountMapper.getSalaryListCount", search);
	}

	public ArrayList<SalaryManage> salaryList(ArrayList<String> search, PageInfo pi) {
		int offset =(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("accountMapper.salaryList",search,rb);
	}

	public SalaryManage salaryDetail(String empNum) {
		return sqlSession.selectOne("accountMapper.salaryDetail", empNum);
	}
	//이번달에 월급입금확인
	public int checkSalary() {
		return sqlSession.selectOne("accountMapper.checkSalary");
	}

	public int insertSalary() {
		return sqlSession.insert("accountMapper.insertIncome");
	}
	//Num -> Name으로 해줄것
	public ArrayList<Partner> getPartner(String partnerNum) {
		return (ArrayList)sqlSession.selectList("accountMapper.getPartner",partnerNum);
	}
	//Num -> Name으로 해줄것
	public ArrayList<Product> getProduct(String productCode) {
		return (ArrayList)sqlSession.selectList("accountMapper.getProduct", productCode);
	}



	
}

package com.wework.workman.account.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.account.model.vo.AcNotice;
import com.wework.workman.common.PageInfo;

@Repository("accountDao")
public class AccountDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getNoticeListCount(String[] search) {
		return sqlSession.selectOne("accountMapper.getNoticeListCount", search);
	}

	public ArrayList<AcNotice> noticeList(String[] search, PageInfo pi) {
		int offset =(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("accountMapper.noticeList",search,rb);
	}

	public AcNotice noticeDetail(String aNo) {
		return sqlSession.selectOne("accountMapper.noticeDetail", aNo);
	}
	
}

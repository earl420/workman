package com.wework.workman.humanResource.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.common.PageInfo;
import com.wework.workman.humanResource.model.vo.Notice;

@Repository("humanResourceDao")
public class HumanResourceDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int gethListCount() {
		
		return sqlSession.selectOne("humanMapper.gethListCount");
	}
	
	public ArrayList<Notice> selectHRnList(PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("humanMapper.selectHRnList", null, rowBounds);
		
	}
	
	public Notice gethrnDetail(String noticeNum) {
		
		return sqlSession.selectOne("humanMapper.selectNotice", noticeNum);
	}
}

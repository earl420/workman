package com.wework.workman.approval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.approval.model.vo.Doc;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.PageInfo;

@Repository("listDao")
public class ListDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getallListCount(String userNum) {
		return sqlSession.selectOne("approvalMapper.getallListCount", userNum);
	}

	public ArrayList<Doc> docList(PageInfo pi, String userNum) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.docList",userNum,rowBounds);
	}

	public int selectCount(HashMap select) {
		return sqlSession.selectOne("approvalMapper.selectCount", select);
	}

	public ArrayList<Doc> docselectList(PageInfo pi, HashMap select) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.docselectList",select,rowBounds);
	}

	public int approvalListCount(String userNum) {
		return sqlSession.selectOne("approvalMapper.approvalListCount", userNum);
	}

	public ArrayList<Doc> approvalList(PageInfo pi, String userNum) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.approvalList",userNum,rowBounds);
	}

	public int allRequestListCount(String userNum) {
		return sqlSession.selectOne("approvalMapper.allRequestListCount", userNum);
	}

	public ArrayList<Doc> docRequestList(PageInfo pi, String userNum) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.docRequestList",userNum,rowBounds);
	}

	public int selectRequestListCount(HashMap select) {
		return sqlSession.selectOne("approvalMapper.selectRequestListCount", select);
	}

	public ArrayList<Doc> docsselectRequestList(PageInfo pi, HashMap select) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.docsselectRequestList",select,rowBounds);
	}



}

package com.wework.workman.approval.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.approval.model.vo.Draft;
import com.wework.workman.approval.model.vo.DraftSort;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.ConflrmSort;

@Repository("draftDao")
public class DraftDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ConflrmSort insertConflrm(Conflrm c) {
		
		int result = sqlSession.insert("approvalMapper.insertConflrm", c);
		ConflrmSort cs = sqlSession.selectOne("approvalMapper.conflrmSort");
		return cs; 
	}

	public DraftSort insertDraft(Draft d) {
		
		int result = sqlSession.insert("approvalMapper.insertDraft", d);
		DraftSort ds = sqlSession.selectOne("approvalMapper.draftSort");
		
		return ds;
	}

	public int insertAttachment(Attachment a) {
		
		return sqlSession.insert("approvalMapper.insertAttachment", a);
	}

	public Draft selectdraftDetail(String draftNum) {
		
		return sqlSession.selectOne("approvalMapper.selectdraftDetail", draftNum);
		
	}
}

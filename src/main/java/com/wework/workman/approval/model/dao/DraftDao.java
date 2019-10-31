package com.wework.workman.approval.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.approval.model.vo.Draft;
import com.wework.workman.approval.model.vo.DraftSort;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.ConflrmSort;
import com.wework.workman.common.Reference;

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

	public int insertReference(Reference r) {
		return sqlSession.insert("approvalMapper.insertReference" , r);
	}
	
	// 디테일 불러오기
	public Draft selectDraft(String draftNum) {
		return sqlSession.selectOne("approvalMapper.selectDraft", draftNum);
	}

	public Conflrm selectConflrm(String confirmNum) {
		return sqlSession.selectOne("approvalMapper.selectConflrm",confirmNum);
	}

	public Reference selectReference(String draftNum) {
		return sqlSession.selectOne("approvalMapper.selectReference", draftNum);
	}

	public Attachment selectAttachment(String draftNum) {
		return sqlSession.selectOne("approvalMapper.selectAttachment", draftNum);
	}
	
}

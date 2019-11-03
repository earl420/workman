package com.wework.workman.approval.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.approval.model.vo.ApprovalSort;
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

	public int insertReference(Reference rf) {
		return sqlSession.insert("approvalMapper.insertReference" , rf);
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

	public int updateConflrm1(String confirmNum, String docNum) {
		int result1 = sqlSession.update("approvalMapper.updateConflrm1",confirmNum );
		int result2 = sqlSession.update("approvalMapper.progressDraft", docNum);
		return result1;
	}

	public int updateConflrm2(String confirmNum) {
		return sqlSession.update("approvalMapper.updateConflrm2",confirmNum );
	}

	public int updateConflrm3(String confirmNum) {
		return sqlSession.update("approvalMapper.updateConflrm3",confirmNum );
	}
	public int updateConflrm4(String confirmNum) {
		return sqlSession.update("approvalMapper.updateConflrm4",confirmNum );
	}

	public int insertApproval(String draftNum) {
		int result = sqlSession.insert("approvalMapper.insertApproval", draftNum);
		ApprovalSort as = sqlSession.selectOne("approvalMapper.approvalSort");
		
		HashMap<String, String> select = new HashMap<>();
		
		System.out.println(as.getApprovalNum());
		
		
		select.put("draftNum", draftNum);
		select.put("approvalNum", as.getApprovalNum());
		
		for(String i:select.keySet()) {
			String key =i;
			String value = select.get(key);
			 System.out.println(value);
		}
		
		int result2 = sqlSession.update("approvalMapper.completeDraft",select);
		
		
		return result2;
	}
	
}

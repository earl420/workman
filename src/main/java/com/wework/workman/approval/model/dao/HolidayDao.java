package com.wework.workman.approval.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.approval.model.vo.ApprovalSort;
import com.wework.workman.approval.model.vo.Holiday;
import com.wework.workman.approval.model.vo.HolidaySort;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.ConflrmSort;
import com.wework.workman.common.Reference;

@Repository("holidayDao")
public class HolidayDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ConflrmSort insertConflrm(Conflrm c) {
		int result = sqlSession.insert("approvalMapper.insertConflrm", c);
		ConflrmSort cs = sqlSession.selectOne("approvalMapper.conflrmSort");
		return cs;
	}

	public HolidaySort insertHoliday(Holiday h) {
		int result = sqlSession.insert("approvalMapper.insertHoliday", h);
		HolidaySort hs = sqlSession.selectOne("approvalMapper.holidaySort"); 
		return hs;
	}

	public int insertAttachment(Attachment a) {
		return sqlSession.insert("approvalMapper.insertAttachment", a);
	}

	public int insertReference(Reference rf) {
		return sqlSession.insert("approvalMapper.insertReference", rf);
	}

	public Holiday selectHoliday(String holiNum) {
		return sqlSession.selectOne("approvalMapper.selectHoliday", holiNum);
	}

	public Conflrm selectConflrm(String confirmNum) {
		return sqlSession.selectOne("approvalMapper.selectConflrm",confirmNum);
	}

	public Reference selectReference(String holiNum) {
		return sqlSession.selectOne("approvalMapper.selectReference", holiNum);
	}

	public Attachment selectAttachment(String holiNum) {
		return sqlSession.selectOne("approvalMapper.selectAttachment", holiNum);
	}
	public int updateConflrm1(String confirmNum, String docNum) {
		int result1 = sqlSession.update("approvalMapper.updateConflrm1",confirmNum );
		int result2 = sqlSession.update("approvalMapper.progressHoliday", docNum);
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

	public int insertApproval(String holiNum) {
		int result = sqlSession.insert("approvalMapper.insertApproval", holiNum);	//최종 승인번호 insert
		ApprovalSort as = sqlSession.selectOne("approvalMapper.approvalSort");
		
		HashMap<String, String> select = new HashMap<>();
		
		select.put("holiNum", holiNum);
		select.put("approvalNum", as.getApprovalNum());
		
		int result2 = sqlSession.update("approvalMapper.completeHoliday",select); // 승인번호를 가져와서 문서 업데이트 (문서 상태 상태 C로 변경) 
		return result2;
	}
	
}

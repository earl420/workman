package com.wework.workman.approval.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}

package com.wework.workman.approval.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.approval.model.vo.Request;
import com.wework.workman.approval.model.vo.RequestSort;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.ConflrmSort;

@Repository("requestDao")
public class RequestDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ConflrmSort insertConflrm(Conflrm c) {
		int result = sqlSession.insert("approvalMapper.insertConflrm", c);
		ConflrmSort cs = sqlSession.selectOne("approvalMapper.conflrmSort");
		return cs; 
	}

	public RequestSort insertRequest(Request r) {
		
		int result = sqlSession.insert("approvalMapper.insertRequest", r);
		RequestSort rc = sqlSession.selectOne("approvalMapper.requestSort");
		return rc;
	}

	public int insertAttachment(Attachment a) {
		return sqlSession.insert("approvalMapper.insertAttachment", a);
	}

	public Request selectrequestDetail(String requestNum) {
		return sqlSession.selectOne("approvalMapper.selectrequestDetail", requestNum);
	}
}

package com.wework.workman.approval.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.approval.model.vo.ApprovalSort;
import com.wework.workman.approval.model.vo.Expense;
import com.wework.workman.approval.model.vo.ExpenseSort;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.ConflrmSort;
import com.wework.workman.common.Reference;

@Repository("expenseDao")
public class ExpenseDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ConflrmSort insertConflrm(Conflrm c) {
		int result = sqlSession.insert("approvalMapper.insertConflrm", c);
		ConflrmSort cs = sqlSession.selectOne("approvalMapper.conflrmSort");
		return cs; 
	}

	public ExpenseSort insertExpense(Expense e) {
		
		int result = sqlSession.insert("approvalMapper.insertExpense", e);
		ExpenseSort es = sqlSession.selectOne("approvalMapper.expenseSort");

		return es;
	}

	public int insertReference(Reference rf) {
		return sqlSession.insert("approvalMapper.insertReference" , rf);
	}

	public int insertAttachment(Attachment a) {
		return sqlSession.insert("approvalMapper.insertAttachment", a);
	}

	public Expense selectExpense(String expenseNum) {
		return sqlSession.selectOne("approvalMapper.selectExpense", expenseNum);
	}

	public Conflrm selectConflrm(String confirmNum) {
		return sqlSession.selectOne("approvalMapper.selectConflrm",confirmNum);
	}

	public Reference selectReference(String expenseNum) {
		return sqlSession.selectOne("approvalMapper.selectReference", expenseNum);
	}

	public Attachment selectAttachment(String expenseNum) {
		return sqlSession.selectOne("approvalMapper.selectAttachment", expenseNum);
	}
	
	public int updateConflrm1(String confirmNum, String docNum) {
		int result1 = sqlSession.update("approvalMapper.updateConflrm1",confirmNum );
		int result2 = sqlSession.update("approvalMapper.progressExpense", docNum);
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

	public int insertApproval(String expenseNum) {
		int result = sqlSession.insert("approvalMapper.insertApproval", expenseNum);
		ApprovalSort as = sqlSession.selectOne("approvalMapper.approvalSort");
		
		HashMap<String, String> select = new HashMap<>();
		
		select.put("expenseNum", expenseNum);
		select.put("approvalNum", as.getApprovalNum());
		
		int result2 = sqlSession.update("approvalMapper.completeExpense",select);
		
		return result2;
	}
}

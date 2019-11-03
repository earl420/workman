package com.wework.workman.approval.model.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wework.workman.approval.model.dao.ExpenseDao;
import com.wework.workman.approval.model.vo.Expense;
import com.wework.workman.approval.model.vo.ExpenseSort;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.ConflrmSort;
import com.wework.workman.common.Reference;

@Service("expenseService")
public class ExpenseServiceImpl implements ExpenseService{
	
	@Autowired
	private ExpenseDao eDao;

	@Override
	public String insertExpense(Expense e, Conflrm c) {

		ConflrmSort cs = eDao.insertConflrm(c);
		e.setConfirmNum(cs.getConfirmNum());
		ExpenseSort ec = eDao.insertExpense(e);
		return ec.getExpenseNum();
	}

	@Override
	public int insertReference(Reference rf) {
		return eDao.insertReference(rf);
	}

	@Override
	public int insertFile(Attachment a) {
		// TODO Auto-generated method stub
		return eDao.insertAttachment(a);
	}

	@Override
	public Expense selectExpense(String expenseNum) {
		// TODO Auto-generated method stub
		return eDao.selectExpense(expenseNum);
	}

	@Override
	public Conflrm selectConflrm(String confirmNum) {
		return eDao.selectConflrm(confirmNum);
	}

	@Override
	public Reference selectReference(String expenseNum) {
		return eDao.selectReference(expenseNum);
	}

	@Override
	public Attachment selectAttachment(String expenseNum) {
		return eDao.selectAttachment(expenseNum);
	}
	@Override
	public int updateConflrm1(String confirmNum, String docNum) {
		return eDao.updateConflrm1(confirmNum,docNum);
	}

	@Override
	public int updateConflrm2(String confirmNum) {
		return eDao.updateConflrm2(confirmNum);
	}

	@Override
	public int updateConflrm3(String confirmNum) {
		return eDao.updateConflrm3(confirmNum);
	}

	@Override
	public int updateConflrm4(String confirmNum) {
		return eDao.updateConflrm4(confirmNum);
	}

	@Override
	public int insertApproval(String expenseNum) {
		return eDao.insertApproval(expenseNum);
	}
}

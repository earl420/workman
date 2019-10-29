package com.wework.workman.humanResource.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wework.workman.common.Attachment;
import com.wework.workman.common.PageInfo;
import com.wework.workman.humanResource.model.dao.HumanResourceDao;
import com.wework.workman.humanResource.model.vo.Department;
import com.wework.workman.humanResource.model.vo.Employee;
import com.wework.workman.humanResource.model.vo.Notice;

@Service("humanResourceService")
public class HumanResourceServiceImpl implements HumanResourceService{
	@Resource(name="humanResourceDao")
	private HumanResourceDao hDao;

	@Override
	public int gethListCount() {
		
		return hDao.gethListCount();
	}

	@Override
	public ArrayList<Notice> selectHRnList(PageInfo pi) {

		return hDao.selectHRnList(pi);
	}

	@Override
	public Notice gethrnDetail(String noticeNum) {

		return hDao.gethrnDetail(noticeNum);
	}

	@Override
	public int insertNotice(Notice n) {
		
		return hDao.insertNotice(n);
	}

	@Override
	public int insertAtt(Attachment a) {

		return hDao.insertAtt(a);
	}

	@Override
	public ArrayList<Department> getDeptList() {

		return hDao.selectDeptList();
	}

	@Override
	public ArrayList<Employee> getEmp() {

		return hDao.selectEmp();
	}

	@Override
	public ArrayList<Employee> getEmpCount() {

		return hDao.getEmpCount();
	}

	
}
	

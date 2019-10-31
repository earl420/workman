package com.wework.workman.approval.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wework.workman.approval.model.dao.HolidayDao;
import com.wework.workman.approval.model.vo.Holiday;
import com.wework.workman.approval.model.vo.HolidaySort;
import com.wework.workman.common.Attachment;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.ConflrmSort;
import com.wework.workman.common.Reference;

@Service("holidayService")
public class HolidayServiceImpl implements HolidayService{
	
	@Autowired
	private HolidayDao hDao;

	@Override
	public String insertHoliday(Holiday h, Conflrm c) {
		
		ConflrmSort cs = hDao.insertConflrm(c);
		System.out.println(cs.getConfirmNum());
		h.setConfirmNum(cs.getConfirmNum());
		HolidaySort hc = hDao.insertHoliday(h);
		return hc.getHoliNum();
	}
	
	@Override
	public int insertFile(Attachment a) {
		return hDao.insertAttachment(a);
	}

	@Override
	public int insertReference(Reference rf) {
		return hDao.insertReference(rf);
	}


	@Override
	public Holiday selectHoliday(String holiNum) {
		return hDao.selectHoliday(holiNum);
	}

	@Override
	public Conflrm selectConflrm(String confirmNum) {
		return hDao.selectConflrm(confirmNum);
	}

	@Override
	public Reference selectReference(String holiNum) {
		return hDao.selectReference(holiNum);
	}

	@Override
	public Attachment selectAttachment(String holiNum) {
		return hDao.selectAttachment(holiNum);
	}
}

package com.wework.workman.approval.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wework.workman.approval.model.dao.HolidayDao;

@Service("holidayService")
public class HolidayServiceImpl implements HolidayService{
	@Resource(name = "holidayDao")
	private HolidayDao hDao;
}

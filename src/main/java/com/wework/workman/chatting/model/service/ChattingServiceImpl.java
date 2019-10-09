package com.wework.workman.chatting.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wework.workman.chatting.model.dao.ChattingDao;

@Service("chattingService")
public class ChattingServiceImpl implements ChattingService{
	@Resource(name="chattingDao")
	private ChattingDao cDao;
}

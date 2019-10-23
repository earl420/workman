package com.wework.workman.chatting.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wework.workman.chatting.model.dao.ChattingDao;
import com.wework.workman.chatting.model.vo.Message;
import com.wework.workman.chatting.model.vo.Room;

@Service("chattingService")
public class ChattingServiceImpl implements ChattingService{
	@Resource(name="chattingDao")
	private ChattingDao cDao;

	@Override
	public  ArrayList<Room> getRoomList(String userId) {
		// TODO Auto-generated method stub
		return cDao.getRoomList(userId);
	}

	@Override
	public void sendMessage(String userName, String roomId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<Message> roomChange(String roomId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void roomCreate(String[] userIdList) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void roomExit(String userId, String roomId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addUser(String[] userIdList) {
		// TODO Auto-generated method stub
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

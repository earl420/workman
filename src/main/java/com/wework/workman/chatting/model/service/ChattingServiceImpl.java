package com.wework.workman.chatting.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wework.workman.chatting.model.dao.ChattingDao;
import com.wework.workman.chatting.model.vo.Message;
import com.wework.workman.chatting.model.vo.Room;

@Service("cService")
public class ChattingServiceImpl implements ChattingService{
	
//	@Resource(name="cDao")
//	private ChattingDao cDao;
	@Autowired
	private ChattingDao cDao;
	
	@Override
	public String sysId() {
		// TODO Auto-generated method stub
		return cDao.sysId();
	}


	@Override
	public  ArrayList<Room>getRoomList(String userId) {
		// TODO Auto-generated method stub
		return cDao.getRoomList(userId);
	}
	@Override
	public Room getRoom(String roomId) {
		// TODO Auto-generated method stub
		return cDao.getRoom(roomId);
	}
	
	@Override
	public ArrayList<Message> msgHistory(String roomId) {
		// TODO Auto-generated method stub
		return cDao.msgHistory(roomId);
	}

	@Override
	public ArrayList<Message> roomChange(String roomId) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int roomExit(String userId, String roomId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addUser(String roomId, String userId) {
		// TODO Auto-generated method stub
		return cDao.addUser(roomId, userId);
	}
	@Override
	public int msgDb(Message msg) {
		return cDao.msgDb(msg);
	}
	@Override
	public String newChat(String userId) {
		
		return cDao.newChat(userId);
	}


	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
}

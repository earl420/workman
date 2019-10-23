package com.wework.workman.chatting.model.service;

import java.util.ArrayList;

import com.wework.workman.chatting.model.vo.Message;
import com.wework.workman.chatting.model.vo.Room;

public interface ChattingService {
	public ArrayList<Room> getRoomList(String userId);
	public void sendMessage(String userName,String roomId);
	public ArrayList<Message> roomChange(String roomId);
	public void roomCreate(String[] userIdList);
	public void roomExit(String userId,String roomId);
	public void addUser(String[] userIdList);
}

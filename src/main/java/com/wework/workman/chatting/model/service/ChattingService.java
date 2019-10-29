package com.wework.workman.chatting.model.service;

import java.util.ArrayList;

import com.wework.workman.chatting.model.vo.Message;
import com.wework.workman.chatting.model.vo.Room;

public interface ChattingService {
	ArrayList<Room> getRoomList(String userId);
	ArrayList<Message> roomChange(String roomId);
	int roomCreate(String[] userIdList);
	int roomExit(String userId,String roomId);
	int addUser(String[] userIdList);
	ArrayList<Message>msgHistory(String roomId);
	int msgDb(Message msg);
}

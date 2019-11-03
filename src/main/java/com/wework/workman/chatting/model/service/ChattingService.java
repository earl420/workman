package com.wework.workman.chatting.model.service;

import java.util.ArrayList;

import com.wework.workman.chatting.model.vo.Message;
import com.wework.workman.chatting.model.vo.Room;

public interface ChattingService {
	String sysId();
	String getName(String userId);
	Room getRoom(String roomId);
	ArrayList<Room> getRoomList(String userId);
	ArrayList<Message> roomChange(String roomId);
	String newChat(String userId);
	int roomExit(String userId,String roomId);
	int addUser(String roomId, String userId);
	ArrayList<Message>msgHistory(String roomId);
	int msgDb(Message msg);
}

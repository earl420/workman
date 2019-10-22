package com.wework.workman.chatting.model.service;

import java.util.ArrayList;

import com.wework.workman.chatting.model.vo.Room;

public interface ChattingService {
	public ArrayList<Room> getRoomList(String userId);
	
}

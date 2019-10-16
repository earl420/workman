package com.wework.workman.chatting.model.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import com.wework.workman.chatting.model.vo.ChatRoom;

public class ChatRoomRepository {
	private Map<String,ChatRoom> chatRoomMap;
	
	@PostConstruct
	private void init() {
		chatRoomMap = new LinkedHashMap<>();
	}
	public List<ChatRoom> findAllRoom(){
		//채팅방순서를 최근순으로.
		List chatRooms = new ArrayList<>(chatRoomMap.values());
		Collections.reverse(chatRooms);
		return chatRooms;
		
	}
	public ChatRoom findRoomById(String id) {
		return chatRoomMap.get(id);
	}
	public ChatRoom createChatRoom(String name) {
		ChatRoom chatRoom = ChatRoom.create(name);
		chatRoomMap.put(chatRoom.getRoomId(),chatRoom);
		return chatRoom;
	}
	
	
	
}

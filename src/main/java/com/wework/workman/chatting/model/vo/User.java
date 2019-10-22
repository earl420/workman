package com.wework.workman.chatting.model.vo;

import java.util.List;

public class User {
	private List<String> roomId;
	
	public User() {
		
	}
	public User(List<String> roomId) {
		super();
		this.roomId = roomId;
	}

	public List<String> getRoomId() {
		return roomId;
	}

	public void setRoomId(List<String> roomId) {
		this.roomId = roomId;
	}
	@Override
	public String toString() {
		return "RoomId [roomId=" + roomId + "]";
	}
	
	
}

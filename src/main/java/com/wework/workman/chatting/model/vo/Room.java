package com.wework.workman.chatting.model.vo;

import java.sql.Date;

public class Room {
	private String roomId;
	private Date lastComm;
	
	public Room() {
		
	}

	public Room(String roomId, Date lastComm) {
		super();
		this.roomId = roomId;
		this.lastComm = lastComm;
	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public Date getLastComm() {
		return lastComm;
	}

	public void setLastComm(Date lastComm) {
		this.lastComm = lastComm;
	}

	@Override
	public String toString() {
		return "Room [roomId=" + roomId + ", lastComm=" + lastComm + "]";
	}
	
}

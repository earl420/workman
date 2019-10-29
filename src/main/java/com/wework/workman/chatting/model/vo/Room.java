package com.wework.workman.chatting.model.vo;

import java.sql.Date;

public class Room {
	private String roomId;
	private String roomName;
	private String lastWord;
	private String lastMan;
	private Date lastComm;
	
	
	public Room() {
		
	}

	public Room(String roomId, String roomName, String lastWord, String lastMan, Date lastComm) {
		super();
		this.roomId = roomId;
		this.roomName = roomName;
		this.lastWord = lastWord;
		this.lastMan = lastMan;
		this.lastComm = lastComm;
	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getLastWord() {
		return lastWord;
	}

	public void setLastWord(String lastWord) {
		this.lastWord = lastWord;
	}

	public String getLastMan() {
		return lastMan;
	}

	public void setLastMan(String lastMan) {
		this.lastMan = lastMan;
	}

	public Date getLastComm() {
		return lastComm;
	}

	public void setLastComm(Date lastComm) {
		this.lastComm = lastComm;
	}

	@Override
	public String toString() {
		return "Room [roomId=" + roomId + ", roomName=" + roomName + ", lastWord=" + lastWord + ", lastMan=" + lastMan
				+ ", lastComm=" + lastComm + "]";
	}




	
}
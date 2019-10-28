package com.wework.workman.chatting.model.vo;

import java.sql.Date;

public class Room {
	private String roomId;
	private String lastWord;
	private String lastman;
	private Date lastComm;
	
	
	public Room() {
		
	}


	public Room(String roomId, String lastWord, String lastman, Date lastComm) {
		super();
		this.roomId = roomId;
		this.lastWord = lastWord;
		this.lastman = lastman;
		this.lastComm = lastComm;
	}


	public String getRoomId() {
		return roomId;
	}


	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}


	public String getLastWord() {
		return lastWord;
	}


	public void setLastWord(String lastWord) {
		this.lastWord = lastWord;
	}


	public String getLastman() {
		return lastman;
	}


	public void setLastman(String lastman) {
		this.lastman = lastman;
	}


	public Date getLastComm() {
		return lastComm;
	}


	public void setLastComm(Date lastComm) {
		this.lastComm = lastComm;
	}


	@Override
	public String toString() {
		return "Room [roomId=" + roomId + ", lastWord=" + lastWord + ", lastman=" + lastman + ", lastComm=" + lastComm
				+ "]";
	}


	
}

package com.wework.workman.chatting.model.vo;

import java.sql.Date;

import com.google.cloud.Timestamp;

public class Message {
	private String msgNum;
	private String roomId;
	private String sender;
	private String msgCont;
	private Date msgTime;
	private String status;
	public Message() {
		
	}
	public Message(String msgNum, String roomId, String sender, String msgCont, Date msgTime, String status) {
		super();
		this.msgNum = msgNum;
		this.roomId = roomId;
		this.sender = sender;
		this.msgCont = msgCont;
		this.msgTime = msgTime;
		this.status = status;
	}
	public String getMsgNum() {
		return msgNum;
	}
	public void setMsgNum(String msgNum) {
		this.msgNum = msgNum;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getMsgCont() {
		return msgCont;
	}
	public void setMsgCont(String msgCont) {
		this.msgCont = msgCont;
	}
	public Date getMsgTime() {
		return msgTime;
	}
	public void setMsgTime(Date msgTime) {
		this.msgTime = msgTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Message [msgNum=" + msgNum + ", roomId=" + roomId + ", sender=" + sender + ", msgCont=" + msgCont
				+ ", msgTime=" + msgTime + ", status=" + status + "]";
	}
	
}

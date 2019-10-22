package com.wework.workman.chatting.model.vo;

import com.google.cloud.Timestamp;

public class Message {
	private String from;
	private String msg;
	private Timestamp cDate;
	private String status;
	public Message() {
		
	}
	public Message(String from, String msg, Timestamp cDate, String status) {
		super();
		this.from = from;
		this.msg = msg;
		this.cDate = cDate;
		this.status = status;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Timestamp getcDate() {
		return cDate;
	}
	public void setcDate(Timestamp cDate) {
		this.cDate = cDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Message [from=" + from + ", msg=" + msg + ", cDate=" + cDate + ", status=" + status + "]";
	}
	
}

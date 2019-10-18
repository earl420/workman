package com.wework.workman.chatting.controller;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocketHandler extends TextWebSocketHandler{
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		users.put(session.getId(),session);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		users.remove(session.getId());
	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException {
		System.out.println("message : "+message);
		System.out.println("messageToString : "+message.toString());
		for(WebSocketSession s: users.values()) {
			s.sendMessage(message);
		}
	}
	@Override
	public void handleTransportError(WebSocketSession  session, Throwable  exception) {
		System.out.println("exception! : ");
	}

}

package com.wework.workman.chatting.controller;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocketHandler extends TextWebSocketHandler {
	private Map<String, WebSocketSession> allUsers = new ConcurrentHashMap<String, WebSocketSession>();
//	private Map<String, Integer[]> rooms = new ConcurrentHashMap<String, Integer[]>();
	
	
	
	// onOpen
	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws IOException, InterruptedException, ExecutionException {
		allUsers.put(session.getId(), session);
		getRoomList("nullTest");
		
	}

	// onClose
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		allUsers.remove(session.getId());
	}

	// handler
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException, InterruptedException, ExecutionException {
		msgSend(session,message);
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) {
		System.out.println("exception! : " + exception);
	}

	public void msgSend(WebSocketSession session, TextMessage message) throws IOException {
		for (WebSocketSession s : allUsers.values()) {

			s.sendMessage(message);
		}
	}
	
	
	
	public void getRoomList(String userId) throws InterruptedException, ExecutionException {
	}

	public void sendMessage(String userName, WebSocketSession session) {

	}

	public void roomChange() {

	}

	public void roomCreate() {

	}

	public void roomExit() {

	}


}

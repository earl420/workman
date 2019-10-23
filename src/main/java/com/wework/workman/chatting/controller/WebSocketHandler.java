package com.wework.workman.chatting.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;

import javax.annotation.Resource;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.wework.workman.chatting.model.service.ChattingServiceImpl;
import com.wework.workman.chatting.model.vo.Message;
import com.wework.workman.chatting.model.vo.Room;

public class WebSocketHandler extends TextWebSocketHandler {
	@Resource(name="ChattingServiceImpl")
	private ChattingServiceImpl chattingService;
	
	//sessionId, session
	private Map<String, WebSocketSession> allUsers = new ConcurrentHashMap<>();
	//userId,sessionId
	private Map<String,String> userSessionId = new ConcurrentHashMap<>();
	
//	private Map<String, Integer[]> rooms = new ConcurrentHashMap<String, Integer[]>();
	String userId;
	String roomId;
	
	// onOpen
	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws IOException, InterruptedException, ExecutionException {
		allUsers.put(session.getId(), session);
	}

	// onClose
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		allUsers.remove(session.getId());
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) {
		System.out.println("exception! : " + exception);
	}
	
	//방에있는 사람들에게 메세지 전송(실시간)
	public void msgSend(WebSocketSession session, TextMessage message) throws IOException{
		for (WebSocketSession s : allUsers.values()) {

			s.sendMessage(message);
		}
	}
	//user 1명에게 메세지전송(값세팅)
	public void msgSendOne(WebSocketSession session, TextMessage message) throws IOException {
		WebSocketSession s = allUsers.get(userSessionId.get(userId));
		s.sendMessage(message);
		
	}

	// handler
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException, InterruptedException, ExecutionException {
		String[] spMsg=message.getPayload().split(":");
		String preMsg=spMsg[0];
		
		if(preMsg=="onOpen") {//소켓연결되자마자 초기세팅.
			//onOpen:userId
			userSessionId.put(userId,session.getId());//id랑 session을 sessionId로 매칭
			userId=spMsg[1];//userId 세팅.
			getRoomList(session);//룸리스트 전달
			msgHistory(session);//마지막 룸의 메세지 리스트들 전송
			
		}else if(preMsg=="rCng"){//룸 변경
			//rCng:roomId;
			//룸변경 등 상관없이 보낸메세지는 무조건 jsp단에서 active class 에append
			roomId=spMsg[1];
			msgHistory(session);
		}else if(preMsg=="newRoom"){//룸생성
			//newRoom:[userId....]
			String newRoomId= roomCreate(userId);
			//add 유저를 jsp단에서 요청할지 java단에서 요청할지 생각해볼것.
			
		}else if(preMsg=="exitRoom") {//룸나가기
			//exitRoom:roomId
			
			
		}else if(preMsg=="addUser") {//유저 추가
			addUser(roomId);
		}else {
			msgSend(session,message);
		}
		
	}


	
	
	/*-------------------------------------------------------------------------------*/
	
	//초기세팅 : 룸리스트 전달하기.
	public void getRoomList(WebSocketSession session) throws IOException {
		
		ArrayList<Room> roomList= chattingService.getRoomList(userId);
		for(Room i : roomList) {
			String roomId=i.getRoomId();
			String lastWord=i.getLastWord();
			String lastMan=i.getLastman();
			String lastComm=i.getLastComm().toString();
			String roomSetList=roomId +":"+ lastWord+":"+lastMan+":"+lastComm;
			System.out.println(roomSetList);
			TextMessage tx = new TextMessage(roomSetList);
			msgSendOne(session,tx);
		}
	}
	//초기세팅 : 마지막 룸 지난메세지 전송
	//룸변경시 : 룸아이디로 지난 메세지 전송
	public void msgHistory(WebSocketSession session) {
		ArrayList<Message> msg = chattingService.getMessage(roomId);
		for(Message i:msg) {
			String sender = i.getSender();
			String content= i.getMsgCont();
			String time = i.getMsgTime().toString();
			String status;
			if(i.getStatus()=="Y") {
				status=i.getStatus();
			}else {
				status="삭제된메세지입니다.";
			}
			String msgHistory = sender+":"+content+":"+time+":"+status;
			TextMessage tx = new TextMessage(msgHistory);
			msgSendOne(session,tx);
		}
	}

	public String roomCreate(String userId) {
		return null;//생성된roomId반환
	}

	public void exitRoom() {

	}
	
	public void addUser(String roomId) {
		
	}


}

package com.wework.workman.chatting.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.wework.workman.chatting.model.service.ChattingService;
import com.wework.workman.chatting.model.service.ChattingServiceImpl;
import com.wework.workman.chatting.model.vo.Message;
import com.wework.workman.chatting.model.vo.Room;

public class WebSocketHandler extends TextWebSocketHandler {
	
	@Autowired
	private ChattingService cService;
	
//	@Resource(name="ChattingService")
//	private ChattingService cService;
	
	//sessionId, session
	private Map<String, WebSocketSession> allUsers = new ConcurrentHashMap<>();
	//userId,sessionId
	private Map<String,String> userSessionId = new ConcurrentHashMap<>();
	//룸 다시생각.
	//세션에있는사람들을 맨마지막 룸으로 넣고.. 체인지발생시 룸변경 userId:roomId
	//
//	private Map<String, Integer[]> rooms = new ConcurrentHashMap<String, Integer[]>();
	String userId;
	
	
<<<<<<< HEAD
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) {
		System.out.println("exception! : " + exception);
		String preMsg=spMsg[0];
		
		if(preMsg.equals("onOpen")) {//소켓연결되자마자 초기세팅.
			//onOpen:userId
			userId=spMsg[1];//userId 세팅.
			userSessionId.put(userId,session.getId());//id랑 session을 sessionId로 매칭
<<<<<<< HEAD
			getRoomList(session);//룸리스트 전달
			msgHistory(session);//마지막 룸의 메세지 리스트들 전송
=======
			String roomId=getRoomList(session,userId);//룸리스트 전달
			msgHistory(session,roomId);//마지막 룸의 메세지 리스트들 전송
>>>>>>> add48a1a61ea9567ce6209b4467a4996648e174b
			
		}else if(preMsg.equals("rCng")){//룸 변경
			//rCng:roomId;
			//룸변경 등 상관없이 보낸메세지는 무조건 jsp단에서 active class 에append
<<<<<<< HEAD
			roomId=spMsg[1];
			msgHistory(session);
=======
			String roomId=spMsg[1];
			msgHistory(session,roomId);
>>>>>>> add48a1a61ea9567ce6209b4467a4996648e174b
			
		}else if(preMsg.equals("newRoom")){//룸생성
			//newRoom.:[userId....]
			String newRoomId= roomCreate(userId);
			//add 유저를 jsp단에서 요청할지 java단에서 요청할지 생각해볼것.//자바단 조지자
			addUsers(newRoomId);
			
		}else if(preMsg.equals("exitRoom")) {//룸나가기
			//exitRoom:roomId
		}else if(preMsg.equals("addUsers")) {//유저 추가
//			addUsers(roomId);
		}else if(preMsg.equals("msg")){
			msgDb(message);
			msgSend(session,message);
		}else {
		}
	}
	
	
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

	/*-------------------------------------------------------------------------------*/
	
	//초기세팅 : 룸리스트 전달하기.
<<<<<<< HEAD
	public void getRoomList(WebSocketSession session) throws IOException  {
		
=======
	public String getRoomList(WebSocketSession session,String userId) throws IOException  {
		String roomId="";
>>>>>>> add48a1a61ea9567ce6209b4467a4996648e174b
		ArrayList<Room> roomList= cService.getRoomList(userId);
//		ArrayList<Room> roomList = new ChattingServiceImpl().getRoomList(userId);
		for(Room i : roomList) {
			String rId=i.getRoomId();
			String lastWord=i.getLastWord();
			String lastMan=i.getLastman();
			String lastComm=i.getLastComm().toString();
			String roomSetList="roomListSet:"+roomId +":"+ lastWord+":"+lastMan+":"+lastComm;
			System.out.println(roomSetList);
			TextMessage tx = new TextMessage(roomSetList);
			msgSendOne(session,tx);
			roomId = i.getRoomId();
		}
		return roomId;
	}
	//초기세팅 : 마지막 룸 지난메세지 전송
	//룸변경시 : 룸아이디로 지난 메세지 전송
	public void msgHistory(WebSocketSession session,String roomId) throws IOException {
		ArrayList<Message> msg = cService.msgHistory(roomId);
		
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
			String msgHistory = "msgHistory:"+sender+":"+content+":"+time+":"+status;
			TextMessage tx = new TextMessage(msgHistory);
<<<<<<< HEAD
=======
			
>>>>>>> add48a1a61ea9567ce6209b4467a4996648e174b
			msgSendOne(session,tx);
		}
	}

	public String roomCreate(String userId) {
		
		return null;//생성된roomId반환
	}

	public void exitRoom() {

	}
	
	public void addUsers(String roomId) {
		
	}
	public void msgDb(TextMessage message) {
		Message msg = new Message();
<<<<<<< HEAD
		
		String[] msgArr = message.getPayload().split(":",1);
		String msgCont = msgArr[1];
		msg.setMsgCont(msgCont);
		msg.setSender(userId);
		msg.setRoomId(roomId);
=======
		String[] msgArr = message.getPayload().split(":");
		String msgCont = msgArr[3];
		userId = msgArr[1];
		String roomId = msgArr[2];
		msg.setSender(userId);
		msg.setRoomId(roomId);
		msg.setMsgCont(msgCont);
>>>>>>> add48a1a61ea9567ce6209b4467a4996648e174b
		int result = cService.msgDb(msg);
	};


}

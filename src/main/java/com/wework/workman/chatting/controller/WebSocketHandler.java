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
import com.wework.workman.chatting.model.vo.Message;
import com.wework.workman.chatting.model.vo.Room;

public class WebSocketHandler extends TextWebSocketHandler {
	
	@Autowired
	private ChattingService cService;
	
	//sessionId, session
	private Map<String, WebSocketSession> allUsers = new ConcurrentHashMap<>();
	//userId,sessionId
	private Map<String,String> userSessionId = new ConcurrentHashMap<>();
	//userId,roomId - 접속중인user:actiRoomId
	private Map<String,String> userRoom = new ConcurrentHashMap<>();
	//userId, userName : 접속중인  user들의 이름
	private Map<String,String> userName = new ConcurrentHashMap<>();
	
	String userId;
	String systemId;

	// msgHandler
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException, InterruptedException, ExecutionException {
		String[] spMsg=message.getPayload().split(":");
		String preMsg=spMsg[0];
		System.out.println("handlerMessage - "+message.getPayload());
		if(preMsg.equals("onOpen")) {//소켓연결되자마자 초기세팅.
			//onOpen:userId
			userId=spMsg[1];//userId 세팅.
			userSessionId.put(userId,session.getId());//id랑 session을 sessionId로 매칭
			String roomId=getRoomList(session,userId);//룸리스트 전달
			msgHistory(session,roomId,userId);//마지막 룸의 메세지 리스트들 전송
			String uName =cService.getName(userId);
			userName.put(userId,uName);//userId로 이름받아와서 넣기
		}else if(preMsg.equals("rCng")){//룸 변경
			//rCng:userId:roomId;
			//룸변경 등 상관없이 보낸메세지는 무조건 jsp단에서 active class 에append
			userId = spMsg[1];
			String roomId=spMsg[2];
			userRoom.put(userId,roomId);
			msgHistory(session,roomId,userId);
			
		}else if(preMsg.equals("newChat")){//룸생성
			//newChat:userId:empList
			userId = spMsg[1];
			String newRoomId= newChat(userId,spMsg[2]);
			Room r = cService.getRoom(newRoomId);
			String roomSetList = "roomSetList:"+r.getRoomId()+":"+r.getRoomName()+":"+ r.getLastWord()+":"+r.getLastMan()+":"+r.getLastComm();
			TextMessage tx = new TextMessage(roomSetList);
			msgSendRoom(tx,newRoomId);
		}else if(preMsg.equals("exitRoom")) {//룸나가기
			//exitRoom:roomId:userId
			String eRoomId = spMsg[1];
			String eUserId = spMsg[2];
			cService.roomExit(eRoomId, eUserId);
			userRoom.remove(eUserId);
			
		}else if(preMsg.equals("addUsers")) {//유저 추가
//			addUser(roomId);
		}else if(preMsg.equals("msg")){
//			msg:userId:RoomId:msgCont
			msgDb(message);
			msgSendHandler(message,userId);
		}else {
		}
	}
	
	
	// onOpen
	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws IOException, InterruptedException, ExecutionException {
		allUsers.put(session.getId(), session);
		systemId = cService.sysId();
		
	}

	// onClose
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		String sId=session.getId();
//		String u ="";
//		for(String i:allUsers.keySet()) {
//			if(i.equals(sId)) {
//				u=userSessionId.get(i);	
//			}
//		}
//		System.out.println(u);
		allUsers.remove(sId);
//		userSessionId.remove(u);
//		userRoom.remove(u);
//		userName.remove(u);
		
		
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) {
		System.out.println("exception! : " + exception);
	}
	
	//sendHandler
	public void msgSendHandler(TextMessage message,String uId) throws IOException{
//		msg:userId:RoomId:msgCont
		String[] spData = message.getPayload().split(":",4);
		String rId= spData[2];
		String uName = userName.get(spData[1]);

		TextMessage tx = new TextMessage("msg:"+spData[1]+":"+uName+":"+spData[3]);
//		msg:sender:sendName:content:time
		msgSendRoom(tx,rId);
	}
	//user 1명에게 메세지전송(값세팅)
	public void msgSend(WebSocketSession session, TextMessage message,String uId) throws IOException {
		WebSocketSession s = allUsers.get(userSessionId.get(uId));
		s.sendMessage(message);
		
	}
	//룸에 보내기
	public void msgSendRoom(TextMessage message, String roomId) throws IOException {
		
		for(String i:userRoom.keySet()) {
			if(roomId.equals(userRoom.get(i))) {
				WebSocketSession s=allUsers.get(userSessionId.get(i));
				s.sendMessage(message);
				System.out.println("msgSendRoom_i : "+i);
				System.out.println("msgSendRoom_i.room : "+userRoom.get(i));
			}
		}
	}
	//모든사용자에게 보내기
	public void msgSendAll(WebSocketSession session, TextMessage message) throws IOException {
		for (WebSocketSession s : allUsers.values()) {
			s.sendMessage(message);
		}
		
	}

	/*-------------------------------------------------------------------------------*/
	
	//초기세팅 : 룸리스트 전달하기.
	public String getRoomList(WebSocketSession session,String uId) throws IOException  {
		String roomId="";
		ArrayList<Room> roomList= cService.getRoomList(uId);
		
		if(!roomList.isEmpty() && !roomList.toString().equals("[null]")) {
			for(Room i : roomList) {
				String rId=i.getRoomId();
				String rName =i.getRoomName();
				String lastWord=i.getLastWord();
				String lastMan=i.getLastMan();
				String lastComm=i.getLastComm().toString();
				String roomSetList="roomSetList:"+rId +":"+rName+":"+ lastWord+":"+lastMan+":"+lastComm;
				TextMessage tx = new TextMessage(roomSetList);
				msgSend(session,tx,uId);
				roomId = i.getRoomId();
			}	
		}
		return roomId;
	}
	//초기세팅 : 마지막 룸 지난메세지 전송
	//룸변경시 : 룸아이디로 지난 메세지 전송
	public void msgHistory(WebSocketSession session,String roomId,String uId) throws IOException {
		ArrayList<Message> msg = cService.msgHistory(roomId);
		userRoom.put(uId, roomId);
		for(Message i:msg) {
			String sender = i.getSender();
			String sendName = i.getSendName();
			String content= i.getMsgCont();
			if(i.getStatus().equals("N")) {
				content="삭제된메세지입니다.";
			}
			String msgHistory = "msgHistory:"+sender+":"+sendName+":"+content;
			TextMessage tx = new TextMessage(msgHistory);
			msgSend(session,tx,uId);
		}
	}

	public String newChat(String uId,String users) {
		String[] usersArr =users.split(",");
		System.out.println("handler newChat - "+users);
		String usersName="";
		for(String i:usersArr) {
			String temp=cService.getName(i);
			usersName+=temp+",";
		}
		usersName = usersName.substring(0, usersName.length()-1);
		String newRoomId = cService.newChat(uId,usersName);
		addUsers(newRoomId,usersArr);
		String cont = userName.get(uId)+"님이 "+usersName+"님을 초대하였습니다.";
		TextMessage tx = new TextMessage("msg:"+systemId+":"+newRoomId+":"+cont);
		userRoom.put(uId,newRoomId);
		for(String i:userSessionId.keySet()) {
			String key = i;
			System.out.println("newChat_userSessionId_key : "+key);
			for(String j:usersArr) {
				System.out.println("newChat_usersArr_j : "+j);
				if(i.equals(j)) {
					userRoom.put(key,newRoomId);
					System.out.println("userRoom에 넣음"+key+" , "+newRoomId);
				}
			}
		}
		msgDb(tx);
		
		
		
		
		
		return newRoomId;//생성된roomId반환
	}

	public void exitRoom() {
	}
	
	public void addUsers(String roomId,String[] uIds) {
		for(int i=0; i<uIds.length;i++) {
			String uId =uIds[i];
			if(!userId.equals(uId)) {
				cService.addUser(roomId,uId);
			}
		}
		//메세지 추가하기.
	}
//	msg:userId:RoomId:msgCont
	public void msgDb(TextMessage message) {
		Message msg = new Message();
		String[] msgArr = message.getPayload().split(":");
		String uId = msgArr[1];
		String roomId = msgArr[2];
		String msgCont = msgArr[3];
		msg.setSender(uId);
		msg.setRoomId(roomId);
		msg.setMsgCont(msgCont);
		cService.msgDb(msg);
	};


}

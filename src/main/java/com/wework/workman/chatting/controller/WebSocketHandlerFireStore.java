package com.wework.workman.chatting.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.api.core.ApiFuture;
import com.google.api.core.ApiFutures;
import com.google.cloud.firestore.CollectionReference;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.cloud.FirestoreClient;
import com.wework.workman.chatting.model.vo.User;

public class WebSocketHandler extends TextWebSocketHandler {
	public Firestore db = FirestoreClient.getFirestore();
	private Map<String, WebSocketSession> allUsers = new ConcurrentHashMap<String, WebSocketSession>();
//	private Map<String, Integer[]> rooms = new ConcurrentHashMap<String, Integer[]>();
	String userId;
	String roomId;
	
	
	
	
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
		System.out.println("messageToString : " + message.getPayload());
		String msg = message.getPayload();
		String[] spMsg=	msg.split(":");
		String msgType = spMsg[0];
		System.out.println(msgType);
		
		if(msgType=="onOpen") {
			userId=spMsg[1];
			//룸리스트가져오기
			getRoomList(userId);
		}else if(msgType=="msg") {
			
		}
		
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
		userId="test";
		DocumentReference docRef = db.document("users/"+userId);
		ApiFuture<DocumentSnapshot> future = docRef.get();
		DocumentSnapshot document = future.get();
		String[] roomList;
		if (document.exists()) {
		  System.out.println("Document data: " + document.getData());
		  System.out.println( );
		  document.getData().values();
		} else {
		  System.out.println("No such document!");
		}
	}

	public void sendMessage(String userName, WebSocketSession session) {

	}

	public void roomChange() {

	}

	public void roomCreate() {

	}

	public void roomExit() {

	}

	public void dbConnectTest() throws InterruptedException, ExecutionException {

		DocumentReference docRef = db.collection("users").document("alovelace");

		// Add document data with id "alovelace" using a hashmap
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("first", "Ada");
		data.put("last", "Lovelace");
		data.put("born", 1815);
		// asynchronously write data
		ApiFuture<WriteResult> result = docRef.set(data);

		System.out.println("Update time : " + result.get().getUpdateTime());
		System.out.println(result.get().toString());
	}
	
	
	
	
	public void dbQueryTest() throws InterruptedException, ExecutionException {
	
	}
	
	public void dbTest2() throws InterruptedException, ExecutionException {
		
//		CollectionReference users = db.collection("users");
//		Query query = users.whereEqualTo("users","test");
//		
//		ApiFuture<QuerySnapshot> querySnapshot = query.get();
//
//		for (DocumentSnapshot document: querySnapshot.get().getDocuments()) {
//		  System.out.println(document.getId());
//		}
		
		DocumentReference docRef = db.document("users/test");
		ApiFuture<DocumentSnapshot> future = docRef.get();
		DocumentSnapshot document1 = future.get();
		if (document1.exists()) {
		  System.out.println("Document data: " + document1.getData());
		} else {
		  System.out.println("No such document!");
		}
	}
	
	public void dbTest3() throws InterruptedException, ExecutionException {
		CollectionReference users = db.collection("users");
		List<ApiFuture<WriteResult>> futures = new ArrayList<ApiFuture<WriteResult>>();
		String roomId ="test";
		String paticipant ="123";
//		private List<String> roomId;
		
		futures.add(users.document(roomId).set(new User(Arrays.asList("123", "1233"))));
	
		// (optional) block on operation
		ApiFutures.allAsList(futures).get();
		
	}

}

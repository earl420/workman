package com.wework.workman.chatting.controller;

import java.io.IOException;
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
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.cloud.FirestoreClient;

public class WebSocketHandler extends TextWebSocketHandler {
	private Map<String, WebSocketSession> allUsers = new ConcurrentHashMap<String, WebSocketSession>();
//	private Map<String, Integer[]> rooms = new ConcurrentHashMap<String, Integer[]>();
	private String roomIdOpen;
	public Firestore db = FirestoreClient.getFirestore();
	// onOpen
	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws IOException, InterruptedException, ExecutionException {
		allUsers.put(session.getId(), session);
		dbQueryTest();

	}

	// onClose
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		allUsers.remove(session.getId());
	}

	// handler
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException {
		System.out.println("message : " + message);
		System.out.println("messageToString : " + message.getPayload());
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) {
		System.out.println("exception! : " + exception);
	}

	public void msgSend(TextMessage message) throws IOException {
		for (WebSocketSession s : allUsers.values()) {

			s.sendMessage(message);
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
		// asynchronously retrieve all users
		ApiFuture<QuerySnapshot> query = db.collection("users").get();

		QuerySnapshot querySnapshot = query.get();
		
		List<QueryDocumentSnapshot> documents = querySnapshot.getDocuments();
		
		for (QueryDocumentSnapshot document : documents) {
		  System.out.println("User: " + document.getId());
		  System.out.println("First: " + document.getString("first"));
		  
		  if (document.contains("middle")) {
		    System.out.println("Middle: " + document.getString("middle"));
		  }
		  
		  System.out.println("Last: " + document.getString("last"));
		  System.out.println("Born: " + document.getLong("born"));
		}
		System.out.println("QueryTest");
		System.out.println(query.get());
		System.out.println(querySnapshot.toString());
		System.out.println(db.collection("").get());
		System.out.println(documents);
		System.out.println(documents.isEmpty());
	
	}

}

package com.wework.workman.chatting.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.ExecutionException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

@Controller("chattingController")
public class ChattingController {
//	@Resource(name="chattingService")
//	private ChattingService cService;

	public static int initialChattingDB = 0;

	@RequestMapping(value = "/chatting.wo", method = RequestMethod.GET)
	public String chattingMain() throws IOException, InterruptedException, ExecutionException {
		if(initialChattingDB ==0) {
			firebase();
		}else{
			System.out.println("already connected");
		};
		return "chatting/chatting";
	}

	public static void firebase() throws IOException, InterruptedException, ExecutionException {
		// powershell 환경변수추가

//		window
//		$env:GOOGLE_APPLICATION_CREDENTIALS="C:\final\workman\kh-final-chatting-firebase-adminsdk-lwfbc-635f8267c1.json"

//		linux or macOS
//		export GOOGLE_APPLICATION_CREDENTIALS="/home/user/Downloads/service-account-file.json"

		
		// FileInputStream serviceAccount =new
		// FileInputStream("C:\final\workman\kh-final-chatting-firebase-adminsdk-lwfbc-635f8267c1.json");

		InputStream serviceAccount = new FileInputStream(
				"C:\\final\\workman\\kh-final-chatting-firebase-adminsdk-lwfbc-635f8267c1.json");
		GoogleCredentials credentials = GoogleCredentials.fromStream(serviceAccount);
		FirebaseOptions options = new FirebaseOptions.Builder().setCredentials(credentials)
				.setProjectId("kh-final-chatting").build();

		FirebaseApp.initializeApp(options);
		initialChattingDB=1;
		System.out.println("FireStoreDBConnect");
	}

}

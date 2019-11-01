package com.wework.workman.chatting.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wework.workman.chatting.model.vo.LoginTemp;
import com.wework.workman.humanResource.model.service.HumanResourceService;
import com.wework.workman.humanResource.model.vo.Dept;
import com.wework.workman.humanResource.model.vo.Modal;
import com.wework.workman.mypage.model.vo.Mypage;


@Controller("chattingController")
public class ChattingController {
//	@Resource(name="chattingService")
//	private ChattingService cService;
	@Resource(name="humanResourceService")
	private HumanResourceService hService;
	
//	public static int initialChattingDB = 0;

//	@RequestMapping(value = "/chatting.wo", method = RequestMethod.GET)
//	public String chattingMain(Model m,HttpSession session) throws IOException, InterruptedException, ExecutionException {
////		if(initialChattingDB ==0) {
////		}else{
////			System.out.println("already connected");
////		};
//		
////		LoginTemp loginUser = new LoginTemp();
////		loginUser.setLoginId("empId");
////		loginUser.setLoginName("empName");
////		m.addAttribute("loginUser", loginUser);
//		
//		Mypage mp = (Mypage)session.getAttribute("loginMan");
//		m.addAttribute(mp);
//		
//		ArrayList<Dept> dlist = hService.selectModaDeptlList();
//		ArrayList<Modal> mlist = hService.selectModalEmpList();
//		
//		m.addAttribute("dlist",dlist);
//		m.addAttribute("mlist",mlist);
//		System.out.println(dlist);
//		System.out.println(mlist);
////		m.addObject("dlist",dlist);
////		m.addObject("mlist",mlist);
//		
//		
//		return "chatting/chatting";
//	}
	
	
	@RequestMapping("chatting.wo")
	public ModelAndView test(ModelAndView mv, HttpSession session) {
		ArrayList<Dept> dlist = hService.selectModaDeptlList();
		ArrayList<Modal> mlist = hService.selectModalEmpList();
		
		LoginTemp loginUser = new LoginTemp();
		Mypage mp = (Mypage)session.getAttribute("loginMan");
		
		
		
		loginUser.setLoginId(mp.getNum());
		loginUser.setLoginName(mp.getName());

		
		mv.addObject("loginUser", loginUser);
		
		mv.addObject("dlist",dlist);
		mv.addObject("mlist",mlist);
		System.out.println(mlist);
		System.out.println(dlist);
		mv.setViewName("chatting/chatting");
		return mv;
	}

	
	
	
	
	
	public static void firebase() throws IOException, InterruptedException, ExecutionException {
		// powershell환경변수

//		window
//		$env:GOOGLE_APPLICATION_CREDENTIALS="C:\final\workman\kh-final-chatting-firebase-adminsdk-lwfbc-635f8267c1.json"

//		linux or macOS
//		export GOOGLE_APPLICATION_CREDENTIALS="/home/user/Downloads/service-account-file.json"
		
		// FileInputStream serviceAccount =new
		// FileInputStream("C:\final\workman\kh-final-chatting-firebase-adminsdk-lwfbc-635f8267c1.json");

//		InputStream serviceAccount = new FileInputStream(
//				"C:\\final\\workman\\kh-final-chatting-firebase-adminsdk-lwfbc-635f8267c1.json");
//		GoogleCredentials credentials = GoogleCredentials.fromStream(serviceAccount);
//		FirebaseOptions options = new FirebaseOptions.Builder().setCredentials(credentials)
//				.setProjectId("kh-final-chatting").build();
//
//		FirebaseApp.initializeApp(options);
////		firebase.firestore().settings( { timestampsInSnapshots: true });
//
//		initialChattingDB=1;
//		System.out.println("FireStoreDBConnect");
	}
	
}

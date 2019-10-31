<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>workman</title>
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/icons/logo1.png">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<style>
.main-wrapper {
	height: 100%;
	background-color: red;
}

.card {
	/* height:100%; */
	height: 680px;
	/* position:absolute; */
}

.card-body {
	position: relative;
	height: 100%;
}

.slimScrollDiv {
	height: 80%;
	overflow-y: auto;
	overflow-x: hidden;
}

.msgInputDiv {
	position: absolute;
	bottom: -50px;
}

.newChattingDiv {
	width: 100%;
	position: absolute;
	bottom: 0px;
	left: 0px;
}

.newChattingDiv>button {
	width: 100%;
}
/* chattingBox */
.chatBox {
	display: block;
	color: #34495e;
	margin: 0;
	padding: 0;
}

.chatBox li {
	display: block;
	margin: 5px;
	padding: 0px;
	font-size: 20px;
	/*     background-color:red; */
	border-top-left-radius: 6px;
	border-top-right-radius: 6px;
	border-bottom-right-radius: 6px;
	border-bottom-left-radius: 6px;
}

.msgOther {
	background-color: #ecf0f1;
	max-width: 60%;
	height: auto;
	clear: both;
	float: left;
	margin-left: 10px;
	margin-right: 10px;
}

.msgMe {
	background-color: #C1E4EC;
	max-width: 60%;
	height: auto;
	clear: both;
	float: right;
	margin-left: 10px;
	margin-right: 100px;
}
.msgNotice{
	background-color: #ecf0f1;
	max-width: 100%;
	height: auto;
	clear: both;
	float: center;
	margin-left: 10px;
	margin-right: 10px;
}
/* UserList */
#newchat {
	width: 100%;
	height: 5%;
}

/*퍼온거*/
img {
	max-width: 100%;
}

.inbox_chat {
	height: 100%;
	overflow-y: scroll;
}

.active_chat {
	background: #ebebeb;
	border-top-left-radius: 6px;
	border-top-right-radius: 6px;
}

.chat_list {
	border-bottom: 1px solid #c4c4c4;
	margin: 0;
	padding: 18px 16px 10px;
	overflow: hidden;
	clear: both;
}

.chat_list:hover {
	background: #ebebeb;
}

.chat_list h5 {
	font-size: 15px;
	color: #464646;
	margin: 0 0 8px 0;
}

.chat_list h5 span {
	font-size: 13px;
	float: right;
}

.chat_list p {
	font-size: 14px;
	color: #989898;
	margin: auto;
	align: left;
}

.setSpan {
	float: left;
}
</style>
</head>

<body>
	<!-- style="overflow:hidden" -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<!-- 	<!--******************* -->
	<!--         Preloader start -->
	<!--     ********************-->
	<!-- 	<div id="preloader"> -->
	<!-- 		<div class="loader"> -->
	<%-- 			<svg class="circular" viewBox="25 25 50 50"> <circle --%>
	<%-- 					class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" --%>
	<%-- 					stroke-miterlimit="10" /> </svg> --%>
	<!-- 		</div> -->
	<!-- 	</div> -->
	<!-- 	<!--******************* -->
	<!--         Preloader end -->
	<!--     ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">
		<c:import url="../common/header.jsp"></c:import>
<%-- 		<input type="hidden" value=${loginMan.num } id="loginId"> --%>
<%-- 		<input type="hidden" value=${loginMan.name } id="loginName"> --%>
		<input type="hidden" value=${loginUser.loginId } id="loginId">
		<input type="hidden" value=${loginUser.loginName } id="loginName">
		<input type="hidden" value="" id="actiRoomId">

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="container-fluid" align="center">
				<div class="row">

					<div class="col col-lg-3">
						<div class="card">
							<div class="card-body">
								<div class="card-title">ChatList</div>
								<div class="slimScrollDiv" id="chatListScroll">
									
									<div class="chat_list active_chat" id="RoomId">
										<input type="hidden" value="test">
										<h5>
										
											<i class="fas fa-cog setSpan dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></i>
											<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item" href="#">채팅방이름변경</a> 
												<a class="dropdown-item" href="#">Another action</a> 
												<a class="dropdown-item" href="#">Something else here</a>
											</div>
											Sunil Rajput 
											<span class="chat_date">Dec 25</span>
											
										</h5>
										<p>Test, which is a one roof.</p>
									</div>

									<!-- dataToggleDiv -->

									<div class="dropdown">
										<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown
											button
										</button>
										<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
											<a class="dropdown-item" href="#">Action</a> 
											<a class="dropdown-item" href="#">Another action</a> 
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
									
									
									
									
								</div>

								<div class="newChattingDiv">
									<button onclick="newChat();" class="btn btn-light">
										<i class="fas fa-comment-dots"></i>
									</button>
									

								</div>
							</div>
						</div>
					</div>
					<div class="col col-lg-6">
						<div class="card">
							<div class="card-body">
								<div class="card-title">Chatting</div>

								<div class="slimScrollDiv" id="msgContent">
									<ul class="chatBox" id="chatBox"></ul>
								</div>

								<div class="col-lg-14">
									<div class="input-group mb-3 msgInputDiv">
										<input type="text" id="msgInput" onkeyDown="onKeyDown();"
											class="form-control" placeholder="Type for..."
											aria-label="msgInput" aria-describedby="sendBtn" disabled>
										
										<div class="input-group-append">
											<button class="btn btn-outline-dark" id="sendBtn"
												type="button">@Send</button>
										</div>
									</div>
									<!-- /input-group -->
								</div>


							</div>
						</div>
					</div>
					<div class="col col-lg-3">
						<div class="card">
							<div class="card-body">
								<div class="card-title">memo..etc?</div>
								<div class="slimScrollDiv"></div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- row -->
			<div class="content-fluid"></div>
			<!-- /.container -->

			<!-- #/ container -->
		</div>
		<!--**********************************
            Content body end
        ***********************************-->
		<c:import url="../common/footer.jsp"></c:import>
	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->
	<script>
		var wbSocket;
		var userId = $("#loginId").val();
		var userName = $("#loginName").val();//!!!!!!!!!!!!!!!1확인
		var actiRoomId = $("#actiRoomId").val();//!!!!!!!!!!!!!확인
		var writer;

		$(function() {
			connect();
		});
		
		//webSocket 초기설정
		function connect() {
			wbSocket = new WebSocket("ws://localhost:8888/workman/chatting.ch");
			wbSocket.onopen = onOpen;
			wbSocket.onclose = onClose;
			wbSocket.onmessage = onMessage;
		}

		function onOpen(evt) {
			writer ="msgNotice";
			appendMessage("연결성공");
			
			var openString = "onOpen:" + userId;
			wbSocket.send(openString);//오픈시 룸리스트, 메세지 히스토리 받아오기.
		}

		function onClose(evt) {
			appendMessage("연결종료");
		}

		function send() {
			var msg = $("#msgInput").val();
			if(msg!=""){
				wbSocket.send("msg:"+userId+":"+actiRoomId+":"+msg);
			}
			$("#msgInput").val("");
		}
		function onKeyDown() {
			if (event.keyCode == '13') {
				send();
				event.stopPropagation;
			}
		}
		$('#sendBtn').click(function() {//버튼클릭.
			send();
		});
		
		function appendMessage(msg) {
			if (userId == writer) {
				$("#chatBox").append("<li class='msgMe'>" + msg + "</li>");
			} else if(writer == "notice"){
				$("#chatBox").append("<li class='msgNotice'>" + msg + "</li>");
			}else{
				$("#chatBox").append("<li class='msgOther'>" + msg + "</li>");
			}
			$("#msgContent").scrollTop($("#msgContent")[0].scrollHeight);

			
			;
			// 		$("#testTa").append(msg);
		}
		
		//handler
		function onMessage(evt) {
			var data = evt.data;
			var spData = data.split(":");
			var preMsg = spData[0];
			//onOpen:userId
			//	<= roomSetList:roomId:lastMan:lastWord:lastComm;
			//	<=msgHistory:sender:content:time:status

			//rCng:roomId;
			//	<=msgHistory:sender:content:time:status
			//newRoom:[userid..]
			//exitRoom:roomId
			//addUser:roomId:[userId]
			//msg:userId:msgContent

			if (preMsg == "roomSetList") {
				roomSetList(spData);
			} else if (preMsg == "msgHistory") {
				msgHistory(spData);
			} else if (preMsg == "msg"){
				appendMessage(spData[3]);
			}else{
				console.log("??????");
			}

				
		}

		//--------초기설정----------
		
		//onOpen:userId
		//	<= roomSetList:roomId:lastMan:lastWord:lastComm;
		//	<=msgHistory:sender:content:time:status
		function roomSetList(spData) {
			var setRoomId   = spData[1];
			var setRoomName = spData[2];
			var setLastMan  = spData[3];
			var setLastWord = spData[4];
			var setLastComm = spData[5];

			var $divSc =$('#chatListScroll');
			

// 			<div class="chat_list active_chat" id="RoomId">
// 				<input type="hidden" value="test">
// 				<h5>
// 					<i class="fas fa-cog setSpan"></i> Sunil Rajput <span
// 						class="chat_date">Dec 25</span>
// 				</h5>
// 				<p>Test, which is a one roof.</p>
// 			</div>
			
			var $div_chatList = $("<div class='chat_list' id='"+setRoomId+"'>");
			var $hrId =$("<input type='hidden' value='"+setRoomId+"'>");
			var $h5 = $("<h5>"+setRoomName+"<span class='chat_date'>"+setLastComm+"</span></h5>");
			var $iSpan =$("<i class='fas fa-cog setSpan'></i>");
			var $p = $("<p>"+setLastWord+"<p>");
			
			$divSc.append($div_chatList);
			$div_chatList.append($hrId);
			$div_chatList.append($h5);
			$h5.append($iSpan);
			$div_chatList.append($p);
			
			$("#actiRoomId").val(setRoomId);
			actiRoomId= setRoomId;
			// active_chat 맨위에꺼에 지정하고 룸번호날려..주나?
		}
		function msgHistory(spData){
			writer = spData[1];
			appendMessage(spData[2]);
			$('#msgInput').removeAttr('disabled');
		}
//		------------초기설정 끝

		function newChat(){
	
		}
		
		//roomSetBtn
		$("#chatListScroll").on("click", ".setSpan", function(){
// 			alert("i");
			var hrId = $(this).parent().parent().children().eq(0).val();
			console.log(hrId);
			
		});
		
		//roomChange
		$("#chatListScroll").on("click",".chat_list",function(){
			var rCng =$(this).children().eq(0).val();
// 			rCng:roomId
			
			
			
			$('#'+actiRoomId).removeClass('active_chat');
			actiRoomId= rCng;
			$('#actiRoomId').val(rCng);
			$('#'+actiRoomId).addClass('active_chat');
			wbSocket.send("rCng:"+actiRoomId);
			$('#chatBox').empty();
		});

	</script>
</body>
</html>
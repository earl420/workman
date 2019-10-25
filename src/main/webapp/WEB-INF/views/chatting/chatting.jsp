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
	clear: both;
	float: left;
}

.msgMe {
	background-color: #C1E4EC;
	max-width: 60%;
	height: auto;
	clear: both;
	float: right;
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
}

.chat_people {
	overflow: hidden;
	clear: both;
}

.chat_ib h5 {
	font-size: 15px;
	color: #464646;
	margin: 0 0 8px 0;
}

.chat_ib h5 span {
	font-size: 13px;
	float: right;
}

.chat_ib p {
	font-size: 14px;
	color: #989898;
	margin: auto
}

.chat_img {
	float: left;
	width: 11%;
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
		<input type="hidden" value=${loginUser.loginId } id="loginId">
		<input type="hidden" value=${loginUser.loginName } id="loginName">
		<input type="hidden" value="null" id="roomId">

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
								
										<div class="chat_list active_chat">
											<div class="chat_people">
												<div class="chat_ib">
													<h5>
														Sunil Rajput <span class="chat_date">Dec 25</span>
													</h5>
													<p>Test, which is a one roof.</p>
												</div>
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
											aria-label="msgInput" aria-describedby="sendBtn">
										<div class="input-group-append">
											<button class="btn btn-outline-dark" id="sendBtn"
												type="button">@Send</button>
										</div>
									</div>
									<!-- /input-group -->
								</div>
								<!-- col-lg-6 -->
								<!-- <div class="input-group mb-3"> -->
								<!--   <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2"> -->
								<!--   <div class="input-group-append"> -->
								<!--     <button class="btn btn-outline-secondary" type="button" id="button-addon2">Button</button> -->
								<!--   </div> -->
								<!-- </div> -->


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
		var roomId = $("#roomId").val();//!!!!!!!!!!!!!확인
		var writer;

		//onOpen:userId
		//rCng:roomId;
		//newRoom:[userid..]
		//exitRoom:roomId
		//addUser:roomId:[userId]
		//msg:userId:msgContent

		$(function() {
			connect();
			$('#sendBtn').click(function() {//엔터키 입력시 전송.
				send();
			});
		});

		function connect() {//초기설정
			wbSocket = new WebSocket("ws://localhost:8888/workman/chatting.ch");
			wbSocket.onopen = onOpen;
			wbSocket.onclose = onClose;
			wbSocket.onmessage = onMessage;
		}

		function onOpen(evt) {
			appendMessage("연결성공");
			
			var openString = "onOpen:" + userId;
			wbSocket.send(openString);//오픈시 룸리스트, 메세지 히스토리 받아오기.
		}

		function onClose(evt) {
			appendMessage("연결종료");
		}

		function send() {
			var msg = $("#msgInput").val();
			writer = userName;
			wbSocket.send(roomId + ":" + userName + ":" + msg);

			$("#msgInput").val("");
		}
		function onMessage(evt) {
			var data = evt.data;
			var spData = data.split(":");
			var preMsg = spData[0];
			console.log(spData);

			//onOpen:userId
			//	<=roomListSet:roomId:lastWord:lastMan:lastComm;
			//	<=msgHistory:sender:content:time:status

			//rCng:roomId;
			//	<=msgHistory:sender:content:time:status
			//newRoom:[userid..]
			//exitRoom:roomId
			//addUser:roomId:[userId]
			//msg:userId:msgContent

			if (preMsg == "roomListSet") {
				roomListSet(spData);
			} else if (preMsg == "msgHistory") {
				msgHistory(spData);
			} else if (preMsg == "")

				appendMessage();
		}

		function appendMessage(msg) {
			if (userName == writer) {
				$("#chatBox").append("<li class='msgMe'>liMe" + msg + "</li>");
			} else {
				$("#chatBox").append(
						"<li class='msgOhter'>liOther" + msg + "</li>");
			}
			;
			// 		$("#testTa").append(msg);
		}
		function onKeyDown() {
			console.log("bam" + event.keyCode);
			if (event.keyCode == '13') {
				send();
				event.stopPropagation;
			}
		}
		//onOpen:userId
		//	<=roomListSet:roomId:lastWord:lastMan:lastComm;
		//	<=msgHistory:sender:content:time:status
		function roomListSet(spData) {

// 						<div class="chat_list active_chat">
// 						<div class="chat_people">
// 							<div class="chat_ib">
// 								<h5>
// 									Sunil Rajput <span class="chat_date">Dec 25</span>
// 								</h5>
// 								<p>Test, which is a new approach to have all solutions
// 									astrology under one roof.</p>
// 							</div>
// 						</div>
// 					</div>

			var $div =$('#chatListScroll');
			var $div_chatList = $('<div class="chat_list active_chat">');
			var $div_chat_people =$('<div class="chat_people">');
			var $div_chat_ib =$('<div class="chat_ib">');
			var $h5 = $('<h5>'+roomId+'<span class="chat_date">'+lastComm+'</span></h5>');
			var $p = $('<p>'+lastWord+'<p>');
			var $div_close =$('</div></div></div></div></div></div>');
			
			$div.append($div_chatList);
			$div.append($div_chat_people);
			$div.append($div_chat_ib);
			$div.append($h5);
			$div.append($p);
			$div.append($div_close);
		}
	</script>
</body>
</html>
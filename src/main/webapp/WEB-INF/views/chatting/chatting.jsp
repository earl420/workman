<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/icons/logo1.png">
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
<link
	href="resources/plugins/tables/css/datatable/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>  -->
<meta charset="UTF-8">
<title>workman</title>

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

.msgNotice {
	background-color: #8C8C8C;
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

/* Modal */
.tab-content div ul li {
	display: inline-table;
}

.box_from ul li {
	display: inline-table;
	padding: 0px;
}

.box_from ul li button {
	padding: 7px 15px;
}
</style>
</head>

<body>
	<!-- style="overflow:hidden" -->

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

											<i class="fas fa-cog setSpan " id="dropdownMenuButton"
												data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false"></i>
											<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item" onclick="rNameChange();">채팅방이름변경</a>
												<a class="dropdown-item" onclick="addUser();">대화상대 초대</a> <a
													class="dropdown-item" onclick="exitRoom();">채팅방 나가기</a>
											</div>
											Sunil Rajput <span class="chat_date">Dec 25</span>

										</h5>
										<p>Test, which is a one roof.</p>
									</div>

									<!-- dataToggleDiv -->

									<div class="dropdown">
										<button class="btn btn-secondary dropdown-toggle"
											type="button" id="dropdownMenuButton" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">Dropdown
											button</button>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuButton">
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a> <a
												class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>




								</div>

								<div class="newChattingDiv bootstrap-modal1">
									<button class="btn btn-light"
										data-toggle="modal" data-target="#exampleModalCenter1"
										id="select">
										<i class="fas fa-comment-dots"></i>
									</button>
									
									<div class="modal fade" id="exampleModalCenter1"
										style="display: none;" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered"
											role="document">
											<div class="modal-content" style="width: 500px;">
												<div class="modal-header">
													<h5 class="modal-title">직원선택</h5>
													<button type="button" class="close" data-dismiss="modal">
														<span>×</span>
													</button>
												</div>
												<div class="col-md-12">
													<div class="modal-body">
														<div class="row">
															<ul class="nav nav-pills mb-3">
																<c:forEach items="${ dlist }" var="d">
																	<li class="nav-item"><a class="nav-link"
																		data-toggle="tab" aria-expanded="true"
																		href="#${d.deptName}">${d.deptName}</a></li>
																</c:forEach>
															</ul>
														</div>
														<div class="tab-content br-n pn">
															<c:forEach items="${ dlist }" var="d">
																<div class='tab-pane' id="${d.deptName}">
																	<ul class="nav nav-pills mb-3">
																		<c:forEach items="${ mlist }" var="m">
																			<c:if test="${d.deptName eq m.deptName }">
																				<li class="applicantSelect">
																					<button type='button'
																						class='btn mb-1 btn-rounded btn-outline-primary'
																						value="${m.empNum}">${m.empName}${m.gradeName}</button>
																				</li>
																			</c:if>
																			<c:if test="${d.deptName eq '전체부서' }">
																				<li class="applicantSelect">
																					<button type='button'
																						class='btn mb-1 btn-rounded btn-outline-primary'
																						value="${m.empNum}">${m.empName}${m.gradeName}</button>
																				</li>
																			</c:if>
																		</c:forEach>
																	</ul>
																</div>
															</c:forEach>
														</div>
														<div class="applicantMember box_from">
															<ul>
															</ul>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal" onclick="modalReset();">취소</button>
															<button type="button" class="btn btn-primary"
																onclick="newChat();" data-dismiss="modal">완료</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="applicant box_from">
										<ul>
										</ul>
									</div>

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
		var empList = new Array();//모달
		
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
			writer = "notice";
// 			appendMessage("연결성공");

			var openString = "onOpen:" + userId;
			wbSocket.send(openString);//오픈시 룸리스트, 메세지 히스토리 받아오기.
		}

		function onClose(evt) {
			appendMessage("연결종료");
		}

		function send() {
			var msg = $("#msgInput").val();
			if (msg != "") {
				wbSocket.send("msg:" + userId + ":" + actiRoomId + ":" + msg);
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


		function newChat(){
			wbSocket.send("newChat:"+empList);
			empList = new Array();
		}

		//handler
		function onMessage(evt) {
			var data = evt.data;
			var spData = data.split(":");
			
			var preMsg = spData[0];
			//onOpen:userId
			//	<= roomSetList:roomId:lastMan:lastWord:lastComm;
			//	<=msgHistory:sender:content:time:status
			//msg:userId:msgContent
			//rCng:roomId;
			//	<=msgHistory:sender:content:time:status
			//newRoom:[userid..]
			//exitRoom:roomId
			//addUser:roomId:[userId]
			
			
			console.log("onMessage - "+data);
			if (preMsg == "roomSetList") {
				roomSetList(spData);
			} else if (preMsg == "msgHistory") {
				writer = spData[1];
				msgHistory(spData[2]);
			} else if (preMsg == "msg") {
				writer = spData[1];
				var mCont = data.spilt(":",2);
				appendMessage(mCont[2]);
			} else {
				console.log(data);
			}
		}

		function appendMessage(msg) {
			if (userId == writer) {
				$("#chatBox").append("<li class='msgMe'>" + msg + "</li>");
			} else if (writer == "20190003") {
				$("#chatBox").append("<li class='msgNotice'>" + msg + "</li>");
			} else {
				console.log("otherTest");
				$("#chatBox").append("<li class='msgOther'>" + msg + "</li>");
			}
			$("#msgContent").scrollTop($("#msgContent")[0].scrollHeight);
			// 		$("#testTa").append(msg);
		}
		
		//--------초기설정----------

		//onOpen:userId
		//	<= roomSetList:roomId:lastMan:lastWord:lastComm;
		//	<=msgHistory:sender:content:time:status
		function roomSetList(spData) {
			var setRoomId = spData[1];
			var setRoomName = spData[2];
			var setLastMan = spData[3];
			var setLastWord = spData[4];
			var setLastComm = spData[5];

			var $divSc = $('#chatListScroll');

			// 			<div class="chat_list active_chat" id="RoomId">
			// 				<input type="hidden" value="test">
			// 				<h5>
			// 					<i class="fas fa-cog setSpan " id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></i>

			// 					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			// 						<a class="dropdown-item" onclick="rNameChange();">채팅방이름변경</a> 
			// 						<a class="dropdown-item" onclick="addUser();">대화상대 초대</a> 
			// 						<a class="dropdown-item" onclick="exitRoom();">채팅방 나가기</a>
			// 					</div>

			// 						Sunil Rajput 
			// 					<span class="chat_date">Dec 25</span>
			// 				</h5>
			// 				<p>Test, which is a one roof.</p>
			// 			</div>

			var $div_chatList = $("<div class='chat_list' id='"+setRoomId+"'>");
			var $hrId = $("<input type='hidden' value='"+setRoomId+"'>");
			var $h5 = $("<h5>" + setRoomName + "<span class='chat_date'>"
					+ setLastComm + "</span></h5>");
			var $iSpan = $("<i class='fas fa-cog setSpan'></i>");
			var $p = $("<p>" + setLastWord + "<p>");

			$divSc.append($div_chatList);
			$div_chatList.append($hrId);
			$div_chatList.append($h5);
			$h5.append($iSpan);

			$div_chatList.append($p);

			$("#actiRoomId").val(setRoomId);
			actiRoomId = setRoomId;
			// active_chat 맨위에꺼에 지정하고 룸번호날려..주나?
		}
		function msgHistory(data) {
			appendMessage(data);
			$('#msgInput').removeAttr('disabled');
		}

		//		------------초기설정 끝


		//roomSetBtn
		$("#chatListScroll").on("click", ".setSpan", function() {
			// 			alert("i");
			var hrId = $(this).parent().parent().children().eq(0).val();
			console.log(hrId);

		});

		//roomChange
		$("#chatListScroll").on("click", ".chat_list", function() {
			var rCng = $(this).children().eq(0).val();
			// 			rCng:roomId
			$('#' + actiRoomId).removeClass('active_chat');
			actiRoomId = rCng;
			$('#actiRoomId').val(rCng);
			$('#' + actiRoomId).addClass('active_chat');
			wbSocket.send("rCng:" + actiRoomId);
			$('#chatBox').empty();
		});
		
		
		
		////////////////////////Modal//////////////////////////
		  
	$(".applicantSelect").find("button").on("click" ,function() {
		var emp1 = $(this);
		if(empList.length >= 0){
			 empList.push(emp1.val());
			 emp1.attr("disabled",true);
				 var $ul = $(".applicantMember ul");
				var $li = $("<li class='applicantList alert'>");
				var $button= $("<button type='button' class='btn mb-1 btn-rounded btn-primary'>").text(emp1.text()).val(emp1.val());
				
					$li.append($button);
					$ul.append($li);
			 
		}
		else {
			alert("더이상 추가할수 없습니다.");
			
		}
			$(".applicantList").find("button").on("click" ,function() {
				var emp2 = $(this).val();
				 
				 for(i=0; i<empList.length; i++){
					 if(empList[i] == emp2){
						 empList.splice(i,1);
						 emp1.attr("disabled",false);
						 $(this).attr("data-dismiss",'alert'); 
					 }
				 }
			});
		});
	function modalReset(){
		empList = new Array();
	}

</script>
</body>
</html>
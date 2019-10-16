<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>workman</title>
<link rel="icon" type="image/png" sizes="16x16" href="resources/icons/logo1.png">
<!-- Custom Stylesheet -->
<style>
.card{
height:30%;
}
.card-body{
position:relative;
height:100%;
}
.slimScrollDiv{
height:80%;
overflow-y:auto;
overflow-x:hidden;
}
.msgInputDiv{
position:absolute;
bottom:0px;
}
</style>
</head>

<body style="overflow:hidden">
 <script src="resources/js/stomp.js"></script>
 <script src="resources/js/sockjs.js"></script>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50"> <circle
					class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3"
					stroke-miterlimit="10" /> </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">
		<c:import url="../common/header.jsp"></c:import>
		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="container-fluid" style="height:100px;" align="center">
				<div class="row">
				
					<div class="col col-lg-3" >
						<div class="card">
							<div class="card-body">
								<div class="card-title">UserList</div>
								<div class="slimScrollDiv">
								<p>
								start
								<br><br><br><br><br><br><br><br>1
								<br><br><br><br><br><br><br><br>2
								<br><br><br><br><br><br><br><br>3
								<br><br><br><br><br><br><br><br>4
								<br><br><br><br><br><br><br><br>5
								<br><br><br><br><br><br><br><br>6
								<br><br><br><br><br><br><br><br>7
								end
								<br><br><br><br><br><br><br><br>8
								</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col col-lg-6">
						<div class="card">
							<div class="card-body">
								<div class="card-title">Chatting</div>
								<div class="slimScrollDiv" id="msgContent"
									data-room-id="{{room.id}}" data-member="{{member}}">
									<ul class="chatBox"></ul>
								</div>
								<div class="col-lg-14">
								<div class="input-group msgInputDiv">
									<input type="text" id="msgInput" class="form-control"
										placeholder="Type for..."> <span
										class="input-group-btn">
										<button class="btn btn-default" id="sendBtn" type="button">@Send</button>
									</span>
								</div>
								<!-- /input-group -->
								</div><!-- col-lg-6 -->

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
$(function(){
	var chatBox=$('.chatBox');
	var messageInput =$('#msgInput');
	var sendBtn =$('#sendBtn');
	var roomId=$('#msgContent').data('room-id');
	var member=$('#msgContent').data('member');
	
	
	var sock = new SockJS("/stomp-chatting");
	var client = Stomp.over(sock);
	//1. sockJS내부에 들고있는 client
	
	//2. connection맺어지면 실행
	client.connect({},function(){
		//3. send(path,header,message)로 메세지 보낼수 있음
		client.send('/publish/chat/join',{},JSON.stringify({chatRoomID:roomId,writer:member}));	
		
		//4. subscribe(path,callback)로 메세지를 받을 수 있다. callback첫번째파라미터의 body로 내용이들어온다
		client.subscribe('/subscribe/chat/room'+roomId,function(chat){
			var content =JSON.parse(chat.body);
			chatBox.append('<li>'+content.message+'('+content.writer+')<li>')
		});
	});
	
	sendBtn.click(function(){
		var message = messageInput.val();
		client.send('/publish/chat/message',{},JSON.stringify({chatRoomId: roomId, message:message,writer:member}));
		messgeInput.val('');
	
	});
});



</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>workman</title>
<link rel="icon" type="image/png" sizes="16x16" href="resources/icons/logo1.png">
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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
								</div>
							</div>
						</div>
					</div>
					<div class="col col-lg-6">
						<div class="card">
						<input type="hidden" value="userName_1st">
							<div class="card-body">

								<div class="card-title">Chatting</div>

								<div class="slimScrollDiv" id="msgContent">
									<ul class="chatBox"></ul>
									<textarea id="chatMessageArea"></textarea>
								</div>

								<div class="col-lg-14">

									<div class="input-group msgInputDiv">
										<input type="text" id="msgInput" class="form-control"
											placeholder="Type for..."> 
										<span class="input-group-btn">
											<button class="btn btn-default" id="sendBtn" type="button">@Send</button>
										</span>
									</div>
									<!-- /input-group -->
								</div>
								<!-- col-lg-6 -->

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
	connect();
	
	if(keycode=='13'){
		send();
		event.stopPropagation;
	}
	$('#sendBtn').click(function(){
		send();
	});
	
});
	var wbSocket;
	
	function connect(){
		wbSocket = new WebSocket("ws://localhost:8888/workman/chatting");
		wbSocket.onopen = onOpen;
		wbSocket.onclose = onClose;
		wbSocket.onmessage = onMessage;
	
	}
	function disconnect(){
		wbSocket.close();
	}
	function onOpen(evt){
		appendMessage("연결");
	}
	function onMessage(evt){
		var data = evt.data;
		if(data.substring(0,4) =="msg:"){
			appendMessage(data.substring(4));
		}
	}
	function onClose(evt){
		appendMessage("연결종료");
	}
	function send(){
		var userName = $("#userName").val()
		var msg=$("#msgInput").val();
		wbSocket.send("msg:"+userName+" : "+msg);
		$("#msgInput").val("");
	}
	
	function appendMessage(msg){
		$("#chatMessageArea").append(msg + "<br>");
	}
	
</script>
</body>
</html>
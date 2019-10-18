<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>workman</title>
<link rel="icon" type="image/png" sizes="16x16" href="resources/icons/logo1.png">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
.main-wrapper{
height:100%;
background-color:red;
}
.card{
/* height:100%; */
height:680px;
/* position:absolute; */
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
bottom:-50px;
}

/* chattingBox */

.chatBox {
    display: block;
    color: #34495e;
    margin:0;
    padding:0;
}
 
.chatBox li {
    display: block;
    margin:5px;
    padding: 0px;
    font-size: 20px;
    background-color:red;
    border-top-left-radius: 6px;
    border-top-right-radius: 6px;
    border-bottom-right-radius: 6px;
    border-bottom-left-radius: 6px;
}

</style>
</head>

<body style="overflow:hidden">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50"> <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" /> </svg>
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
		
		<input type="hidden" value="me!" id="userName">
		
		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="container-fluid" align="center">
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
						
							<div class="card-body">

								<div class="card-title">Chatting</div>

								<div class="slimScrollDiv" id="msgContent">
									<ul class="chatBox" id="chatBox"></ul>
								</div>

								<div class="col-lg-14">
									<div class="input-group mb-3 msgInputDiv">
										<input type="text" id="msgInput" class="form-control" placeholder="Type for..." aria-label="msgInput" aria-describedby="sendBtn"> 
										<div class="input-group-append">
												<button class="btn btn-outline-dark" id="sendBtn" type="button">@Send</button>
										</div>
									</div><!-- /input-group -->
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
	var userName = $("#userName").val();
	var writer;
	
$(function(){
	connect();
// 	if(keycode=='13'){
// 		send();
// 		event.stopPropagation;
// 	}
	$('#sendBtn').click(function(){
		send();
	});
	
});
	var wbSocket;
	
	function connect(){
		wbSocket = new WebSocket("ws://localhost:8888/workman/chatting.ch");
		wbSocket.onopen = onOpen;
		wbSocket.onclose = onClose;
		wbSocket.onmessage = onMessage;
	
	}
	function disconnect(){
		wbSocket.close();
	}
	function onOpen(evt){
		appendMessage("연결성공");
	}
	function onMessage(evt){
		var data = evt.data;
		if(data.substring(0,4) =="msg:"){
			appendMessage(data.substring(4));
		}
		var spData=data.split(":");
		writer = spData[1];
		console.log("writerOnMessage : "+writer);
	}
	function onClose(evt){
		appendMessage("연결종료");
	}
	function send(){
		var msg=$("#msgInput").val();
		
		wbSocket.send("msg:"+userName+" : "+msg);
		
		$("#msgInput").val("");
	}
	
	function appendMessage(msg){
		console.log("writer1 : "+writer);
		if(userName==writer){
			console.log("me!");
		$("#chatBox").append("<li class='me'>liMe"+msg+"</li>");
		}else{
		$("#chatBox").append("<li class='ohter'>liOther"+msg+"</li>");
			
		}
		
		


// 		$("#testTa").append(msg);
	}
	
</script>
</body>
</html>
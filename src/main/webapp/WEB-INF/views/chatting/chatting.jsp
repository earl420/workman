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
/*     background-color:red; */
    border-top-left-radius: 6px;
    border-top-right-radius: 6px;
    border-bottom-right-radius: 6px;
    border-bottom-left-radius: 6px;
}
.msgOther{
 	background-color: #ecf0f1;
    max-width: 60%;
    clear: both;
    float: left;
}
.msgMe{
	background-color: #C1E4EC;
    max-width: 60%;
    height: auto;
    clear: both;
    float: right;

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
		<input type="hidden" value="room!" id="roomId">
		
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
										<input type="text" id="msgInput" onkeyDown="onKeyDown();" class="form-control" placeholder="Type for..." aria-label="msgInput" aria-describedby="sendBtn"> 
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
	var userName = $("#userName").val();//!!!!!!!!!!!!!!!1확인
	var roomId= $("#roomId").val();//!!!!!!!!!!!!!확인
	var writer;
	var wbSocket;
	
$(function(){
	connect();
	
	$('#sendBtn').click(function(){
		send();
	});
	
});
	
	function onKeyDown(){
		console.log("bam"+event.keyCode);
		if(event.keyCode=='13'){
			send();
			event.stopPropagation;
		}
	}
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
		var spData=data.split(":");
		console.log(spData);
		writer = spData[1];//!!!!!!!!!!!!!!!!!!!!!!!!!!!확인
		var spMsg="";
		for(i=2;i<spData.length;i++){
			spMsg+=spData[i];
		}
		appendMessage(spMsg);
	}
	
	function onClose(evt){
		appendMessage("연결종료");
	}
	function send(){
		var msg=$("#msgInput").val();
		writer = userName;
		wbSocket.send(roomId+":"+userName+":"+msg);
		
		$("#msgInput").val("");
	}
	
	function appendMessage(msg){
		if(userName==writer){
		$("#chatBox").append("<li class='msgMe'>liMe"+msg+"</li>");
		}else{
		$("#chatBox").append("<li class='msgOhter'>liOther"+msg+"</li>");
		};
		
		


// 		$("#testTa").append(msg);
	}
	
</script>
</body>
</html>
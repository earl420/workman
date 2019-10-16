<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>workman</title>
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/icons/logo1.png">
<!-- Custom Stylesheet -->
<style>
.card-body{
position:relative;
height:900;
}
.slimScrollDiv{
height:800px;
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
				
					<div class="col col-lg-3" style="height:1000px;">
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
								<div class="slimScrollDiv">
									<ul class="chat_box"></ul>
								</div>
								<div class="input-group msgInputDiv">
									<input type="text" id="msgInput" class="form-control">
									<span class="input-group-addon">@전송</span>
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
$(function(){
	var chatBox=$('.chat_box');
	var messageInput =$('input[name="message"]');
	
	
	
})



</script>
</body>
</html>
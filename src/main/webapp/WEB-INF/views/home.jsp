<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.Date, java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="ko">
<head>
<title>workman</title>

<link rel="icon" type="image/png" sizes="16x16"
	href="resources/icons/logo1.png">

<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<!-- <link rel='stylesheet' type='text/css' media='screen' href='main.css'> -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<!-- <script src='main.js'></script> -->


<style>
.outdiv {
	margin-left: 130px;
	margin-top: 40px;
	height: 600px;
	width: 80%;
}

.topdiv {
	height: 200px;
}

.middiv {
	height: 200px;
}

.botdiv {
	height: 200px;
}

.indiv {
	display: inline-block;
}

.paddiv:hover {
	cursor: pointer;
	opacity: 0.5;
}

#div1 {
	width: 65.6%;
	height: 98%;
}

#div2 {
	width: 32.62%;
	height: 98%;
}

.paddiv {
	height: 100%;
	padding-left: 40px;
	padding-top: 90px;
}

#h2 {
	font-family: "NanumSquare-EB", "나눔고딕", "Dotum", "돋움", "Helvetica",
		"Arial", "AppleSDGothicNeo", sans-serif;
	color: white;
}

p {
	font-family: "NanumSquare-EB", "나눔고딕", "Dotum", "돋움", "Helvetica",
		"Arial", "AppleSDGothicNeo", sans-serif;
	font-weight: bold;
	color: white;
}
</style>
</head>
<body>
	<!-- preloader -->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50"> 
			<circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10" /> </svg>
		</div>
	</div>
	<!-- /preloader -->


	<!-- main wrapper -->
	<div id="main-wrapper" style="background: white;">
		<c:import url="common/header.jsp"></c:import>
		<!-- content-body -->
		<div class="content-body">
			<div class="content-fluid" style="height: 100px">

				<div class="outdiv">

					<div class="topdiv">
						<div class="indiv" id="div1"
							style="background: rgb(133, 133, 173)">
							<div class="paddiv">
								<a href="notice.wo">
									<h2 id="h2">공지사항</h2>
									<p>새로운 공지사항을 확인하세요.</p>
								</a>
							</div>
						</div>
						<div class="indiv" id="div2" style="background: rgb(153, 0, 204)">
							<div class="paddiv">
								<a href="allList.wo">
									<h2 id="h2">전자결재</h2>
									<p>전자결재 바로가기</p>
								</a>
							</div>
						</div>
					</div>

					<div class="middiv">
						<div class="indiv" id="div2" style="background: rgb(204, 0, 0)">
							<div class="paddiv">
								<c:choose>
									<c:when
										test="${loginMan.deftNum eq 100 || loginMan.deftNum eq 200 || loginMan.deftNum eq 302 || loginMan.deftNum eq 304 || loginMan.deftNum eq 305 }">
										<a href="acnoticeList.wo">
											<h2 id="h2">총무/회계</h2>
											<p>총부/회계부 바로가기</p>
										</a>
									</c:when>
									<c:otherwise>
										<a href="#" onclick="alert('회계부서에 접근할 수 없습니다.');"
											style="pointer-events: none; cursor: default;">
											<h2 id="h2">총무/회계</h2>
											<p>총부/회계부 바로가기</p>
										</a>
									</c:otherwise>
								</c:choose>

							</div>
						</div>

						<div class="indiv" id="div2" style="background: rgb(255, 153, 0)">
							<div class="paddiv">

								<a href="hrNotice.wo">
									<h2 id="h2">인사</h2>
									<p>인사부 바로가기</p>
								</a>


							</div>
						</div>

						<div class="indiv" id="div2" style="background: rgb(255, 214, 51)">
							<div class="paddiv">
								<a href="mypageView.wo">
									<h2 id="h2">마이페이지</h2>
									<p>마이페이지 바로가기</p>
								</a>
							</div>
						</div>
					</div>

					<div class="botdiv">
						<div class="indiv" id="div2" style="background: rgb(0, 179, 0)">
							<div class="paddiv">
								<a href="chatting.wo">
									<h2 id="h2">사내메신저</h2>
									<p>메신저 바로가기</p>
								</a>
							</div>
						</div>

						<div class="indiv" id="div1" style="background: rgb(51, 153, 255)">
							<div class="paddiv">
								<a href="calDetailView.wo">
									<h2 id="h2">일정</h2>
									<p>새로운 일정을 확인하세요.</p>
								</a>
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
		<c:import url="common/footer.jsp"></c:import>
	</div>
	<!-- /main-wrapper -->


	<script>

	   $(function(){
		   if(${!empty success}){
			   swal.fire({
				type: 'success',
				title : '${success}',
				confirmButtonText: '확인'
			   });
		   }
	   });
	   $(function(){
		   if(${!empty error}){
			   swal.fire({
				type: 'error',
				title : '${error}',
				confirmButtonText: '확인'
			   });
		   }
	   });
	   
	   
	   
	   $(function(){
		   if(${!empty login}){
			  /*  Swal.fire({
				   type: 'success',
				   title: '${login}',
				   text: '반갑습니다.',
				   padding: '3em',
				   background: 'white',
				   backdrop: `
				     rgba(0,0,123,0.4)
				     url("resources/icons/login.gif")
				     center 
				     no-repeat'
				   confirmButtonText: '확인',
				   animation: false,
				   customClass: {
				     popup: 'animated heartBeat'
				   }
				 }); */
				 Swal.fire({
				 position: 'center',
				 type: 'success',
				 title: '${login}',
				 text: '반갑습니다.',
				  width: 500,
				  height: 50,
				  padding: '3em',
				  /* background-color: '#ffffff', /*url(/images/trees.png)', */
				  backdrop: `rgba(0,0,123,0.4) center top no-repeat `
				});
		   }
	   })
	   
	</script>


</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	div{
		border : 1px solid;
	}
	
</style>
<title>마이 페이지</title>
</head>
<body>

	
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
	<div id="main-wrapper" style="background: white;">
		<c:import url="../common/header.jsp"></c:import>
		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div div class="content-fluid" style="height: 100px;" align="center">
					<div>
						<img src="" alt=""> <!--프로필 사진-->프로필 사진
						<br><br>
						
						<c:out value="">이름</c:out>
						<c:out value="">직급</c:out>
						<br><br>
						
						<c:out value="">부서</c:out>
						<c:out value="">직책</c:out>
						<br><br>
						
						사내전화 : <c:out value=""></c:out> <br>
						휴대전화 : <c:out value=""></c:out> <br>
						이메일 :  <c:out value=""></c:out> <br>
						<br><br>
						
						<h3>남은휴가 <c:out value=""></c:out></h3>
					</div>
					<div>
					<div>
						결제 처리
						<br><br><br><br><br>
						<br>
					</div>
	
					<div>
						내 프로젝트
						<br><br><br><br><br>
						<br>
					</div>
				</div>
			</div>
			<!-- row -->

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
</body>
</html>
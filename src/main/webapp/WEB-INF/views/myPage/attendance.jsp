<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출/퇴근 현황</title>
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
			<div class="content-fluid" style="height: 100px;" align="center">
				
				<h1>출/퇴근 현황</h1>
				<br><br>
				
				<h5 align="left">올해 근퇴 통계</h3>
				
				<table align="center" cellspacing="0" border="1" width="1200">
					<tr>
						<th width="150" height="50">근무시간</th>
						<td colspan="3"></td>
					</tr>
					<tr>
						<th height="50">지각</th>
						<td width="300"></td>
						<th width="150">월 평균 지각</th>
						<td width="300"></td>
					</tr>
					<tr>
						<th height="50">미체크</th>
						<td></td>
						<th>비정상 퇴근</th>
						<td></td>
					</tr>
				</table>
				
				<br><br>
				
				<h5 align="left">올해 근퇴 통계</h3>
				
				<table align="center" cellspacing="0" border="1" width="1200">
					<tr>
						<th height="50">이름</th>
						<th>소속</th>
						<th>지각/미체크</th>
						<th>상세</th>
					</tr>
				
				</table>


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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보</title>
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
				<h1>내 정보관리</h1>
				
				<form action="empUpdate.wo">
					<table width="600" celspacing="5">
						<tr>
							<td width="150">사번</td>
							<td><c:out value=""/></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><c:out value=""></c:out></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><c:out value=""></c:out></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><c:out value=""></c:out></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="phone" value=""></td>
						</tr>
						<tr>
							<td>직급</td>
							<td><c:out value=""></c:out></td>
						</tr>
						<tr>
							<td>부서</td>
							<td><c:out value=""></c:out></td>
						</tr>
						<tr>
							<td>입사일</td>
							<td><c:out value=""></c:out></td>
						</tr>
					</table>
					<button type="button">수정</button>
				</form>
				<br><br><br><br>
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
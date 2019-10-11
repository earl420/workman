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
		<c:import url="common/header.jsp"></c:import>
		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="content-fluid" style="height: 100px;" align="center">
				<form action="empUpdate.wo">
					<table>
						<tr>
							<td>사번</td>
							<td><input type="number" name="eNum" value="${ loginEmp.eNum }" readonly></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="eName" value="${ loginEmp.name }" readonly></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" name="email" value="${ loginEmp.email }"></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input type="text" name="birth" value="${ loginEmp.birth }"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="phone" value="${ liginEmp.phone }"></td>
						</tr>
						<tr>
							<td>직급</td>
							<td></td>
						</tr>
						<tr>
							<td>부서</td>
							<td></td>
						</tr>
						<tr>
							<td>입사일</td>
							<td></td>
						</tr>
					</table>
				</form>
			</div>
			<!-- row -->
	
			<!-- #/ container -->
		</div>
		<!--**********************************
            Content body end
        ***********************************-->
		<c:import url="common/footer.jsp"></c:import>	
	</div>
	<!--**********************************
        Main wrapper end
    ***********************************--> url="../common/footer.jsp"/>
</body>
</html>
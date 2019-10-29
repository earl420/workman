<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/account/css/insertNotice.css" rel="stylesheet">
<script type="text/javascript" src="resources/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
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

			<div class="content-fluid">
				<div class="row">
					<div class="table-responsive col-12"
						style="text-align: center; padding-left: 50px; padding-right: 50px;">
						<h3 style="padding-top: 40px; padding-bottom: 30px;">월급 상세 조회</h3>
						<br />
						<div class="row">
							<div class="col-sm-6" align="right" style="padding-left: 5%;">
								<table class="table"
									style="border: 1px solid lightgray;">
									<tr>
										<th width="20px;">사원번호</th>
										<td width="30px">${list.get(0).empNum }</td>
									</tr>
									<tr>
										<th>부서</th>
										<td>${list.get(0).deptName }</td>
									</tr>
									<tr>
										<th>사원명</th>
										<td>${list.get(0).empName }</td>
									</tr>
									<tr>
										<th>현재연봉</th>
										<td>${list.get(0).yearSalary }</td>
									</tr>
								</table>
							</div>
							<div class="col-sm-6" style="padding-right: 5%;">
								<table  class="table"
									style="border: 1px solid lightgray;">
										<tr>
											<th>연도</th>
											<th>연봉</th>
										</tr>
										<c:forEach var="i" items="${list }">
											<tr>
												<th>${i.salYear }</th>
												<th>${i.yearSalary }</th>
											</tr>
										</c:forEach>
								</table>

							</div>

						</div>
						<div class="row" style="padding-top:50px;">
							<table class="table">
								<thead>
								<tr>
									<th>전체 평균대비 연봉</th>
									<th>부서 평균대비 연봉</th>
									<th>직급 평균대비연봉</th>
								</tr>
								</thead>
								<tbody>
									<tr>
										<td>${list.get(0).yearSalary/avg.avgTotal*100}%</td>
										<td>${list.get(0).yearSalary/avg.avgDept*100}%</td>
										<td>${list.get(0).yearSalary/avg.avgGrade*100}%</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="row" style="padding-left: 48%; padding-top: 70px;">
							<button class="btn mb-1 btn-rounded btn-outline-warning">연봉수정하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--**********************************
            Content body end
        ***********************************-->
		<c:import url="../common/footer.jsp"></c:import>
	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	<script src="resources/account/js/salaryDetail.js"></script>


</body>
</html>
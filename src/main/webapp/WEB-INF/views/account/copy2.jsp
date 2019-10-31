<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="resources/account/css/salaryList.css" rel="stylesheet">
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
			<div class="content-fluid" style="height: 100px; padding-left: 100px; padding-right: 100px;" align="center">
				
				
				<div class="table-responsive" style="text-align: center;">
					<h3 style="padding-top: 40px; padding-bottom: 10px;">월급관리</h3>
					<table class="table table-bordered verticle-middle" id="acList" style="border: 1px solid black; padding-left: 10px; padding-right:10px;">
						<thead>
							<tr>
								<th width="10%">직원번호</th>
								<th width="15%">부서</th>
								<th width="15%">이름</th>
								<th width="10%">직책</th>
								<th width="10%">월급</th>
								<th width="15%">연봉</th>
								<th width="15%">작년대비인상률</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" items="${list }">
								<tr>
									<td>${i.empNum }</td>
									<td>${i.deptName }</td>
									<td>${i.empName }</td>
									<td>${i.gradeName }</td>
									<td>${i.monSalary }</td>
									<td>${i.yearSalary }</td>
									<td>${i.increaseRate }%</td>
								</tr>
							</c:forEach>							
						</tbody>
					</table>
					
						
				</div>
				<div align="center" style="padding-top: 20px;" >
					<div class="pages" onclick="paging(${1});">&lt;&lt;</div>
					<c:choose>
						<c:when test="${pi.currentPage eq 1 }">
							<div class="pages" onclick="paging(1);">&lt;</div>
						</c:when>
						<c:otherwise>
							<div class="pages" onclick="paging(${pi.currentPage-1});">&lt;</div>
						</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="1" end="${pi.endPage }">
						<div class="pages" onclick="paging(this.innerText);">${ i }</div>
					</c:forEach>
					<div class="pages" onclick="paging(${i+1});">&gt;</div>
					<div class="pages" onclick="paging(${pi.maxPage});">&gt;&gt;</div>
				</div>
				
			</div>
			<!-- /.container -->
			
			<!-- #/ container -->
		</div>
		<!--**********************************
            Content body end
        ***********************************-->
        <div style="float: left; padding-left: 30%;">
		<c:import url="../common/footer.jsp"></c:import>	
        </div>
	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->
	 <script src="resources/account/js/salaryList.js"></script>
</body>
</html>
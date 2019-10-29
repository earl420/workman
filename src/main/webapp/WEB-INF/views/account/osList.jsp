<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="resources/account/css/osList.css" rel="stylesheet">
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
					<h3 style="padding-top: 40px; padding-bottom: 10px;">OS관리</h3>
					<table class="table table-bordered verticle-middle" id="acList" style="border: 1px solid black; padding-left: 10px; padding-right:10px;">
						<thead>
							<tr>
								<th width="20%">O/S번호</th>
								<th width="30%">제품명</th>
								<th width="20%">라이센스번호</th>
								<th width="15%">사용시작일</th>
								<th width="15%">만료일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" items="${list }">
								<tr>
									<td>${i.licenseManage }</td>
									<td>${i.productName }</td>
									<td>${i.licenseNum }</td>
									<td>${i.licenseStart }</td>
									<td>${i.licenseEnd }</td>
								</tr>
							</c:forEach>
							
							
						</tbody>
					</table>
					
						
				</div>
				<div class="row" align="right" style="padding-left:85%;">
					<button class="btn mb-1 btn-rounded btn-outline-warning"
					onclick="location.href='expenseWrite.wo'" style="width: 140px; height: 50px;">OS등록하기</button>
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
	 <script src="resources/account/js/osList.js"></script>
</body>
</html>
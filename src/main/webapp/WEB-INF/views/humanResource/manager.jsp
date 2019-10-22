<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>wework</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="images/favicon.png">
<!-- Custom Stylesheet -->
<link
	href="resources/plugins/tables/css/datatable/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>

<body>
	<!-- preloader -->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50"> <circle
					class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3"
					stroke-miterlimit="10" /> </svg>
		</div>
	</div>
	<!-- /preloader -->


	<!-- main wrapper -->
	<div id="main-wrapper" style="">
		<c:import url="../common/header.jsp"></c:import>
		<!-- content-body -->
		<div class="content-body" style="min-height: 889px;">

			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="hrNotice.wo">인사</a></li>
						<li class="breadcrumb-item active"><a href="mngEmpChart.wo">인사관리</a></li>
						<li class="breadcrumb-item active"><a href="manager.wo">인사관리자 관리</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h5>인사 관리자 관리</h5>
								<br>
								<form action="">
									추가할 인사관리자 사번 입력 : 
									<input type="text" name="empNum">
									<a href="">입력</a>
								</form>
								<br>
								<table class="table header-border">
									<thead>
										<tr style="background: #f9f9f9;">
											<th scope="col" style="width:100px;">이름</th>
											<th scope="col" style="width:130px;">ID</th>
											<th scope="col">소속</th>
											<th scope="col">직위</th>
											<th scope="col">등록일</th>	
											<th scope="col">삭제하기</th><!-- *** 전체관리자 일 경우 '전체관리자' 글씨 표시 -->
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>1</th>
											<td>Jacklyn</td>
											<td>ㅇㅇ</td>
											<td>ㅇㅇ</td>
											<td>ㅇㅇ</td>
											<td><input type="button" value="삭제하기"
												class="btn mb-1 btn-warning"
												onclick=""
												style="height:20px; padding-top:0"></td>
										</tr>
										<tr>
											<th>2</th>
											<td>Nancy</td>
											<td>J. Daniels</td>
											<td>@daniels</td>
											<td>@daniels</td>
											<td>@daniels</td>
										</tr>
										<tr>
											<th>3</th>
											<td>Betty</td>
											<td>R. Christensen</td>
											<td>@betty</td>
											<td>@betty</td>
											<td>@betty</td>
										</tr>
										<tr>
											<th>4</th>
											<td>Lucinda</td>
											<td>D. Sears</td>
											<td>@lucinda</td>
											<td>@lucinda</td>
											<td>@lucinda</td>
										</tr>
										<tr>
											<th>5</th>
											<td>William</td>
											<td>T. Marks</td>
											<td>@william.marks</td>
											<td>@william.marks</td>
											<td>@william.marks</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- #/ container -->
		</div>
		<!-- /content-body -->
		<c:import url="../common/footer.jsp"></c:import>
	</div>
	<!-- /main-wrapper -->

</body>
<iframe id="google_esf" name="google_esf"
	src="https://googleads.g.doubleclick.net/pagead/html/r20191003/r20190131/zrt_lookup.html#"
	data-ad-client="ca-pub-2783044520727903" style="display: none;"></iframe>
</html>
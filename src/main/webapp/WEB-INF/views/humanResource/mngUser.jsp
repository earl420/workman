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
						<li class="breadcrumb-item active"><a href="mngUser.wo">사용자관리</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h5>사용자 관리</h5>
								<br>
								<button type="button" class="btn mb-1 btn-rounded btn-warning"
									onclick="location.href='addEmpForm.wo';">사용자 추가</button>
								<div class="input-group icons"
									style="width: 200px; float: right;">
									<div class="input-group-prepend">
										<span
											class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"
											id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
									</div>
									<input type="search" class="form-control" placeholder="이름 검색"
										aria-label="Search Dashboard">
								</div>
								<br>
								<br> 소속 직원 수 : <br>
								<br>
								<table class="table header-border">
									<thead>
										<tr style="background: #f9f9f9;">
											<th scope="col" style="width:100px;">이름</th>
											<th scope="col" style="width:130px;">ID</th>
											<th scope="col">휴대전화</th>
											<th scope="col">소속</th>
											<th scope="col">직위</th>
											<th scope="col">입사일</th>	
											<th scope="col">수정하기</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>1</th>
											<td>Jacklyn</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td><input type="button" value="수정하기"
												class="btn mb-1 btn-warning"
												onclick="location.href='updateEmpForm.wo';"
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>마이페이지</title>
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
				<div class="col p-md-0"></div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-md-4">
						<div class="card">
							<div class="card-body">
								<h5>내 정보</h5>
								<br>
								<div class="form-validation">
									
									<div class="form-group row">
										<div class="col-lg-6">
											<p>
												<c:out value="${ loginMan.name }"></c:out>
												<c:out value="${ loginMan.gradeName }"></c:out>
											</p>
												<c:out value="${ loginMan.deptName }"></c:out>
										</div>
									</div>
									<div class="form-group row">
									</div>
									<div class="form-group row">
										<div class="col-lg-6">
											사번 : <br>
											<c:out value="${ loginMan.num }"></c:out><br>
											입사일 : <br>
											<c:out value="${ loginMan.enrollDate }"></c:out><br>
											전화번호 : <br>
											<c:out value="${ loginMan.phone }"></c:out><br>
											이메일 : <br>
											<c:out value="${ loginMan.email }"></c:out>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-6">
											남은휴가 : <br>
											<c:out value="${ loginMan.holidayLeft }일"></c:out>
										</div>
									</div>
										
								</div>
							</div>
						</div>
					</div>
					
				
				
					<div class="col-md-8">
						<div class="card">
							<div class="card-body">
								<h5></h5>
								<br>
								<div class="form-validation">
									
									<div class="form-group row">
										
										<div class="col-lg-6">
											
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-8 ml-auto">
											
										</div>
									</div>
										
								</div>
							</div>
						</div>
					
						<div class="card">
							<div class="card-body">
								<h5></h5>
								<br>
								<div class="form-validation">
									
									<div class="form-group row">
										
										<div class="col-lg-6">
											
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-8 ml-auto">
											
										</div>
									</div>
										
								</div>
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
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
<link href="resources/plugins/sweetalert/css/sweetalert.css"
	rel="stylesheet">

<style>
.level-2 {
	padding-left: 30px;
}

.level-3 {
	padding-left: 60px;
}
</style>

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
						<li class="breadcrumb-item active"><a href="mngEmpChart.wo">조직관리</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">부서 삭제</h5>
								<br>
								<div class="sweetalert m-t-30">
									<button class="btn btn-warning btn sweet-confirm">삭제</button>
								</div>
								<br> <br>
								<form action="deleteDept.wo" method="post">
									<div class="table-responsive">
										삭제하고자 하는 부서 선택 : <select name="deptNum">
											<c:forEach items="${ list }" var="d">
												<option value="${ d.deptNum }">${ d.deptName }</option>
											</c:forEach>
										</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<div class="sweet-alert hideSweetAlert" data-custom-class=""
											data-has-cancel-button="true" data-has-confirm-button="true"
											data-allow-outside-click="false"
											data-has-done-function="true" data-animation="pop"
											data-timer="null"
											style="display: none; margin-top: -169px; opacity: -0.04;">
											<div class="sa-icon sa-error" style="display: none;">
												<span class="sa-x-mark"> <span
													class="sa-line sa-left"></span> <span
													class="sa-line sa-right"></span>
												</span>
											</div>
											<div class="sa-icon sa-warning" style="display: block;">
												<span class="sa-body"></span> <span class="sa-dot"></span>
											</div>
											<div class="sa-icon sa-info" style="display: none;"></div>
											<div class="sa-icon sa-success" style="display: none;">
												<span class="sa-line sa-tip"></span> <span
													class="sa-line sa-long"></span>

												<div class="sa-placeholder"></div>
												<div class="sa-fix"></div>
											</div>
											<div class="sa-icon sa-custom" style="display: none;"></div>
											<h2>Are you sure to delete ?</h2>
											<p style="display: block;">정말로 삭제하시겠습니까?</p>
											<fieldset>
												<input type="text" tabindex="3" placeholder="">
												<div class="sa-input-error"></div>
											</fieldset>
											<div class="sa-error-container">
												<div class="icon">!</div>
												<p>Not valid!</p>
											</div>
											<div class="sa-button-container">
												<button class="cancel" tabindex="2"
													style="display: inline-block; box-shadow: none;">Cancel</button>
												<div class="sa-confirm-button-container">
													<button type="submit" class="confirm" tabindex="1"
														style="display: inline-block; background-color: rgb(221, 107, 85); box-shadow: none;">Yes,
														delete it !!</button>
													<div class="la-ball-fall">
														<div></div>
														<div></div>
														<div></div>
													</div>
												</div>
											</div>
										</div>	
									</div>
								</form>
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
	<script src="resources/plugins/sweetalert/js/sweetalert.min.js"></script>
	<script>
		document.querySelector(".sweet-confirm").onclick = function() {
			swal({
				title : "Are you sure to delete ?",
				text : "정말로 삭제하시겠습니까?",
				type : "warning",
				showCancelButton : !0,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "Yes, delete it !!",
				closeOnConfirm : !1
			})
		}
	</script>

	<div class="sweet-overlay" tabindex="-1"
		style="opacity: -0.02; display: none;"></div>


</body>
</html>
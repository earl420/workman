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
								<h5 class="card-title">부서 추가</h5>
								<br> <br> <br>
								<div class="table-responsive">
									<div>
										추가할 부서 이름 : <input type="text" id="deptName"
											style="width: 200px;">
										<button id="btn"
											class="btn mb-1 btn-rounded btn-warning btn-xs">추가</button>
									</div>
									<br>
									<div class="row" id="row">
										
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
		<script>
		$(function() {

			getDeptList();

			$("#btn").on("click", function() {

				var deptName = $("#deptName").val();

				$.ajax({
					url : "addDept.wo",
					data : {
						deptName : deptName
					},
					type : "post",
					success : function(data) {
						if (data == "success") {
							getDeptList();
							$("#deptName").val("");
						} else {
							alert("부서 리스트 출력 실패!");
						}
					},
					error : function() {
						console.log("서버와의 통신 실패");
					}
				});
			});
		});

		function getDeptList() {

			$.ajax({

				url : "dlist.wo",
				dataType : "json",
				success : function(data) {

					var $row = $("#row");
					$row.html("");

					if (data.length > 0) {

						$.each(data,
								function(index, value) {

									var $widget = $('<div class="col-2" style="padding:5px"> <div class="card card-widget"> <div class="card-body gradient-9"> <div class="media"><span class="card-widget__icon"><i class="icon-ghost"></i></span><div class="media-body"><h5 style="font-size:13px; color:white;">'+ value.deptName + '</h5><h5 class="card-widget__subtitle">'+ value.deptNum +'</h5>')
								
									$row.append($widget);
						});
					} else {

						$row.append("부서없음");
					}
				},
				error : function() {
					console.log("ajax 통신 실패");
				}
			});
		}
	</script>
</body>
</html>
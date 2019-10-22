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

<link href="resources/css/style.css" rel="stylesheet">
<style>
.sideDept2 {
	padding-left: 20px;
}

.sideDept3 {
	padding-left: 40px;
}

#nameLabel {
	font-weight: bold;
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
						<li class="breadcrumb-item active"><a href="empChart.wo">인사정보</a></li>
						<li class="breadcrumb-item active"><a href="empList.wo">직원목록</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-2" style="border: 1px solid black">
						<div class="sideDept1">부서1</div>
						<div class="sideDept2">부서 1-1</div>
						<div class="sideDept2">부서 1-2</div>
						<div class="sideDept3">부서 1-2-1</div>
						<div class="sideDept1">부서2</div>
						<div class="sideDept2">부서 2-1</div>
						<div class="sideDept1">부서3</div>
						<div class="sideDept1">부서4</div>
					</div>
					<div class="col-lg-10">
						<h3>부서1</h3>
						<button type="button" class="btn mb-1 btn-flat btn-info"
							data-toggle="modal" data-target="#basicModal"
							style="margin-right: 20px;">
							<label id="nameLabel">이름</label><br> 부서<br> 직위
						</button>
						<!-- modal -->
						<div class="modal fade" id="basicModal" style="display: none;"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">사원 정보</h5>
										<button type="button" class="close" data-dismiss="modal">
											<span>×</span>
										</button>
									</div>
									<div class="modal-body">
										<table width="450px" height="300px">
											<tr>
												<td style="font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;강연재</td>
											</tr>
											<tr>
												<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사장>마케팅사업부</td>
											</tr>
											<tr>
												<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이사</td>
											</tr>
											<tr>
												<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일</td>
												<td>kos8148@naver.com</td>
											</tr>
											<tr>
												<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;휴대전화</td>
												<td>010-2222-2222</td>
											</tr>
											<tr>
												<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㅇ</td>
												<td>ㅇ</td>
											</tr>
											<tr>
												<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㅇ</td>
												<td>ㅇ</td>
											</tr>
										</table>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary" onclick="location.href='empList.wo';">Send Email</button>
									</div>
								</div>
							</div>
						</div>
						<!-- /modal -->
						<button type="button" class="btn mb-1 btn-flat btn-info"
							style="margin-right: 20px;">
							<label id="nameLabel">이름</label><br> 부서<br> 직위
						</button>
						<button type="button" class="btn mb-1 btn-flat btn-info"
							style="margin-right: 20px;">
							<label id="nameLabel">이름</label><br> 부서<br> 직위
						</button>
						<button type="button" class="btn mb-1 btn-flat btn-info"
							style="margin-right: 20px;">
							<label id="nameLabel">이름</label><br> 부서<br> 직위
						</button>
						<button type="button" class="btn mb-1 btn-flat btn-info"
							style="margin-right: 20px;">
							<label id="nameLabel">이름</label><br> 부서<br> 직위
						</button>
						<button type="button" class="btn mb-1 btn-flat btn-info"
							style="margin-right: 20px;">
							<label id="nameLabel">이름</label><br> 부서<br> 직위
						</button>
						<button type="button" class="btn mb-1 btn-flat btn-info"
							style="margin-right: 20px;">
							<label id="nameLabel">이름</label><br> 부서<br> 직위
						</button>
						<button type="button" class="btn mb-1 btn-flat btn-info"
							style="margin-right: 20px;">
							<label id="nameLabel">이름</label><br> 부서<br> 직위
						</button>

					</div>
				</div>
			</div>
			<!-- #/ container -->
		</div>
		<!-- /content-body -->
		<c:import url="../common/footer.jsp"></c:import>
	</div>
	<!-- /main-wrapper -->

	<script src="resources/plugins/nestable/js/jquery.nestable.js"></script>
	<script src="resources/plugins/nestable/js/nestable.init.js"></script>


</body>
</html>
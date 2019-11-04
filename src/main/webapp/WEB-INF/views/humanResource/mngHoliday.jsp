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
						<li class="breadcrumb-item active"><a href="mngHoliday.wo">휴가/근태
								조회</a></li>
						<li class="breadcrumb-item active"><a href="mngHoliday.wo">직원
								휴가 조회</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h5>직원 휴가 조회</h5>
								<br>

								<div class="form-group row">
									<div class="col-lg-1">
										<div class="bootstrap-modal">
											<!-- Button trigger modal -->
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#exampleModalCenter1">부서
												검색</button>
											<!-- Modal -->
											<div class="modal fade" id="exampleModalCenter1"
												aria-hidden="true" style="display: none;">
												<div class="modal-dialog modal-dialog-centered"
													role="document">
													<div class="modal-content" style="width: 500px;">
														<div class="modal-header">
															<h5 class="modal-title">부서 검색</h5>
															<button type="button" class="close" data-dismiss="modal">
																<span>×</span>
															</button>
														</div>
														<div class="modal-body">
															<div class="row">
																<ul class="nav nav-pills mb-3">
																	<c:forEach items="${ dlist }" var="d">
																		<li class="nav-item a"><a class="nav-link"
																			data-toggle="tab" aria-expanded="true" href="">${d.deptName}</a></li>
																		<input type="hidden" id="dd" name="dd"
																			value="${ d.deptName }">
																	</c:forEach>
																</ul>
															</div>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">취소</button>
															<button type="button" class="btn btn-primary" id="btn"
																onclick="modalSubmit1();" data-dismiss="modal">완료</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-3">
										<input type="text" class="form-control" id="a">
									</div>
								</div>

								<div class="dropdown custom-dropdown">
									<div data-toggle="dropdown" aria-expanded="false"
										style="color: #F36F30;">
										보기 <i class="fa fa-angle-down m-l-5"></i>
									</div>
									<div class="dropdown-menu dropdown-menu-right"
										x-placement="bottom-end"
										style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(83px, 21px, 0px);">
										<a class="dropdown-item" href="#">Last 1 Month</a> <a
											class="dropdown-item" href="#">Last 6 Month</a> <a
											class="dropdown-item" href="#">Last 10 Month</a>
									</div>
								</div>
								<br>
								<table class="table header-border" style="text-align: center;">
									<thead>
										<tr style="background: #f9f9f9; border: 1px solid lightgray;">
											<th scope="col"
												style="width: 100px; border: 1px solid lightgray;"
												rowspan="">이름</th>
											<!-- 	<th scope="col"
												style="width: 130px; border: 1px solid lightgray;"
												rowspan="2">입사일</th> -->
											<th scope="col" style="border: 1px solid lightgray;"
												rowspan="">올해생성</th>
											<!-- <th scope="col" style="border: 1px solid lightgray;">생성내역</th> -->
											<!-- <th scope="col" style="border: 1px solid lightgray;"
												colspan="3">사용현황</th> -->
											<th scope="col" style="border: 1px solid lightgray;"
												rowspan="2">잔여</th>
											<th scope="col" style="border: 1px solid lightgray;"
												rowspan="">상세</th>
										</tr>
										<!-- <tr>
											<td style="background: #f9f9f9; border: 1px solid lightgray;">정기연차</td>
											<td style="background: #f9f9f9; border: 1px solid lightgray;">개인사유</td>
											<td style="background: #f9f9f9; border: 1px solid lightgray;">훈련</td>
											<td style="background: #f9f9f9; border: 1px solid lightgray;">경조사</td>
										</tr> -->
									</thead>
									<tbody id="tbody">
										

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
	<script type="text/javascript">
		function modalSubmit1() {

			$("#a").val($(".a>.active").text());
		}

		$("#btn")
				.on(
						"click",
						function() {

							var deptName = $("#a").val();

							$
									.ajax({
										url : "allHoliday.wo",
										data:{deptName:deptName},
										type : "post",
										dataType : "json",
										success : function(data) {

											console.log(data);
											var $tbody = $("#tbody");
											$tbody.html("");

											if (data.length > 0) {

												$
														.each(
																data,
																function(index,
																		value) {

																	var $tr = $('<tr><td><a data-toggle="modal" data-target="#basicModal1">'
																			+ value.empName
																			+ '</a></td><td>'
																			+ value.holiCount
																			+ '</td><td>'
																			+ value.holiLeft
																			+ '</td><td><button type="button" class="btn btn-primary goBtn" style="padding-top: 0; height: 20px;">상세</button></td></tr>');

																	$tbody
																			.append($tr);
																});
											}
										},
										error : function() {
											alert("ajax 통신실패");
										}
									});
						});
		$("#tbody").on("click", ".goBtn", function(){
		//$("#goBtn").on("click", function(){
			
			var deptName = $("#a").val();
			
			console.log(deptName);
			
			location.href="mngHoliDetail.wo?deptName="+deptName;
		});
	</script>

</body>
<iframe id="google_esf" name="google_esf"
	src="https://googleads.g.doubleclick.net/pagead/html/r20191003/r20190131/zrt_lookup.html#"
	data-ad-client="ca-pub-2783044520727903" style="display: none;"></iframe>
</html>
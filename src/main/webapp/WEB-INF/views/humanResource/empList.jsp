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
					<div class="col-md-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">직원 목록</h4>
								<br> <br>

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
																		<li class="nav-item"><a class="nav-link"
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
								<div>
									소속 직원 수 : <label id="count"></label>
								</div>

								<div id="here"></div>
								<!-- modal -->
								<c:forEach items="${ elist }" var="e">
										<div class="modal fade" id="basicModal${ e.empNum }"
											style="display: none;" aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">직원정보</h5>
														<button type="button" class="close" data-dismiss="modal">
															<span>×</span>
														</button>
													</div>
													<div class="modal-body">
														<table width="450px" height="300px">
															<tbody>
																<tr>
																	<td><h5>&nbsp;&nbsp;&nbsp;&nbsp;${ e.empName }</h5></td>
																	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ e.gradeName }&gt;</td>
																</tr>
																<tr>
																	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;부서명</td>
																	<td>${ e.deptName }</td>
																</tr>
																<tr>
																	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;입사일</td>
																	<td>${ e.enrollDate }</td>
																</tr>
																<tr>
																	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일</td>
																	<td>${ e.email }</td>
																</tr>
																<tr>
																	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호</td>
																	<td>${ e.empPhone }</td>
																</tr>

															</tbody>
														</table>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Close</button>
														<button type="button" class="btn btn-primary" onclick="location.href='chatting.wo';">Send
															Message</button>
													</div>
												</div>
											</div>
										</div>
										<!-- /modal -->
								</c:forEach>
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

	<!-- /main-wrapper -->

	<script type="text/javascript">
		function modalSubmit1() {

			$("#a").val($(".nav-item>.active").text());
		}

		$("#btn")
				.on(
						"click",
						function() {

							var deptName = $("#a").val();

							$
									.ajax({
										url : "elistByName.wo",
										data : {
											deptName : deptName
										},
										dataType : "json",
										success : function(data) {
											console.log(data);

											var $here = $("#here");
											$here.html("");

											if (data.length > 0) {

												$("#count").text(data.length);
												$.each(data, function(index, value) {

													var $button = $('<button type="button" class="btn mb-1 btn-flat btn-info" data-toggle="modal" data-target = "#basicModal0" style="margin-right: 20px; cursor:pointer;">').attr("data-target", "#basicModal"+value.empNum);
													
				
														var $label = $('<label id="nameLabel">'+ value.empName
																	+ '</label><br> '
																	+ value.deptName
																	+ '<br> '
																	+ value.gradeName
																	+ '</button>');

																	$button.append($label);
																	$here.append($button);
																});
											} else {
												$here.append("직원 리스트 불러오기 실패");
											}
										},
										error : function() {
											alert("ajax통신실패");
										}
									});
						});
	</script>



</body>
</html>
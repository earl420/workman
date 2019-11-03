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
<link href="resources/plugins/sweetalert/css/sweetalert.css"
	rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">

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
						<li class="breadcrumb-item"><a href="showHoliday.wo">휴가/근태</a></li>
						<li class="breadcrumb-item active"><a href="showHoliday.wo">휴가
								현황</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<div class="custom-tab-1">
									<ul class="nav nav-tabs mb-3">
										<li class="nav-item"><a class="nav-link active show"
											data-toggle="tab" href="#home1">내 휴가</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#profile1">휴가신청 관리</a></li>
									</ul>
									<div class="tab-content">
										<div class="tab-pane fade active show" id="home1"
											role="tabpanel">
											<div class="p-t-15">
												<h4>휴가 신청 내역</h4>
												<br>
												<h5 align="center">올해 휴가 현황 : 총 휴가 00일 / 사용 00일 / 잔여
													00일</h5>
												<br>
											</div>
										</div>
										<table class="table header-border">
											<thead>
												<tr style="background: #f9f9f9;">
													<th scope="col">번호</th>
													<th scope="col">휴가 종류</th>
													<th scope="col">일수</th>
													<th scope="col">기간</th>
													<th scope="col">상태</th>
													<th scope="col">상세보기</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th>1</th>
													<td>G.Bearden</td>
													<td>@jacklyn</td>
													<td>@jacklyn</td>
													<td>@jacklyn</td>
													<td>@jacklyn</td>
												</tr>
												<tr>
													<th>2</th>
													<td>Nancy</td>
													<td>@daniels</td>
													<td>@daniels</td>
													<td>@daniels</td>
													<td>@daniels</td>
												</tr>
												<tr>
													<th>3</th>
													<td>Betty</td>
													<td>@betty</td>
													<td>@betty</td>
													<td>@betty</td>
													<td>@betty</td>
												</tr>
												<tr>
													<th>4</th>
													<td>D. Sears</td>
													<td>@lucinda</td>
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
								<div class="tab-pane fade" id="profile1">
									<div class="p-t-15">
										<h4>휴가 신청 관리</h4>
										<br>
										<button class="label label-pill label-warning"
											style="cursor: pointer; border: none; float: left;">&lt;</button>
										&nbsp;&nbsp;
										<div class="date" style="float: left; font-size: 20px;">&nbsp;&nbsp;&nbsp;2019-09</div>
										<button class="label label-pill label-warning"
											style="cursor: pointer; border: none;">&gt;</button>

										<br> <br>

										<div class="dropdown custom-dropdown">
											<div data-toggle="dropdown" aria-expanded="false"
												style="color: #F36F30;">
												Last 7 days <i class="fa fa-angle-down m-l-5"></i>
											</div>
											<div class="dropdown-menu dropdown-menu-right"
												x-placement="bottom-end"
												style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(83px, 21px, 0px);">
												<a class="dropdown-item" href="#">Last 1 Month</a> <a
													class="dropdown-item" href="#">Last 6 Month</a> <a
													class="dropdown-item" href="#">Last 10 Month</a>
											</div>
										</div>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<div class="dropdown custom-dropdown">
											<div data-toggle="dropdown" aria-expanded="false"
												style="color: #F36F30;">
												Last 7 days <i class="fa fa-angle-down m-l-5"></i>
											</div>
											<div class="dropdown-menu dropdown-menu-right"
												x-placement="bottom-end"
												style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(83px, 21px, 0px);">
												<a class="dropdown-item" href="#">Last 1 Month</a> <a
													class="dropdown-item" href="#">Last 6 Month</a> <a
													class="dropdown-item" href="#">Last 10 Month</a>
											</div>
										</div>

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
										<br> <br>

										<table class="table header-border">
											<thead>
												<tr style="background: #f9f9f9;">
													<th scope="col">신청자</th>
													<th scope="col">소속</th>
													<th scope="col">휴가 종류</th>
													<th scope="col">일수</th>
													<th scope="col">기간</th>
													<th scope="col">상태</th>
													<th scope="col">상세보기</th>
													<th scope="col">휴가신청취소</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th>1</th>
													<td>Jacklyn</td>
													<td>G.Bearden</td>
													<td>@jacklyn</td>
													<td>@jacklyn</td>
													<td>@jacklyn</td>
													<td>
														<div class="bootstrap-modal">
															<!-- Button trigger modal -->
															<button type="button" class="btn btn-warning"
																data-toggle="modal" data-target="#basicModal"
																style="height: 30px; padding-top: 4px;">상세</button>
															<!-- Modal -->
															<div class="modal fade" id="basicModal"
																style="display: none;" aria-hidden="true">
																<div class="modal-dialog" role="document">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title">Modal title</h5>
																			<button type="button" class="close"
																				data-dismiss="modal">
																				<span>×</span>
																			</button>
																		</div>
																		<div class="modal-body">Modal body text goes
																			here.</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary"
																				data-dismiss="modal">Close</button>
																			<button type="button" class="btn btn-primary">Save
																				changes</button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</td>
													<td>
														<div class="card-content">
															<div class="sweetalert m-t-30">
																<button class="btn btn-warning btn sweet-confirm"
																	style="height: 30px; padding-top: 4px;">신청 취소</button>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th>2</th>
													<td>Nancy</td>
													<td>J. Daniels</td>
													<td>@daniels</td>
													<td>@daniels</td>
													<td>@daniels</td>
													<td><div class="bootstrap-modal">
															<!-- Button trigger modal -->
															<button type="button" class="btn btn-warning"
																data-toggle="modal" data-target="#basicModal"
																style="height: 30px; padding-top: 4px;">상세</button>
															<!-- Modal -->
															<div class="modal fade" id="basicModal"
																style="display: none;" aria-hidden="true">
																<div class="modal-dialog" role="document">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title">Modal title</h5>
																			<button type="button" class="close"
																				data-dismiss="modal">
																				<span>×</span>
																			</button>
																		</div>
																		<div class="modal-body">Modal body text goes
																			here.</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary"
																				data-dismiss="modal">Close</button>
																			<button type="button" class="btn btn-primary">Save
																				changes</button>
																		</div>
																	</div>
																</div>
															</div>
														</div></td>
													<td>
														<div class="sweetalert m-t-30">
															<button class="btn btn-warning btn sweet-confirm"
																style="height: 30px; padding-top: 4px;">신청취소</button>
														</div>
													</td>
												</tr>
												<tr>
													<th>3</th>
													<td>Betty</td>
													<td>R. Christensen</td>
													<td>@betty</td>
													<td>@betty</td>
													<td>@betty</td>
													<td><div class="bootstrap-modal">
															<!-- Button trigger modal -->
															<button type="button" class="btn btn-warning"
																data-toggle="modal" data-target="#basicModal"
																style="height: 30px; padding-top: 4px;">상세</button>
															<!-- Modal -->
															<div class="modal fade" id="basicModal"
																style="display: none;" aria-hidden="true">
																<div class="modal-dialog" role="document">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title">Modal title</h5>
																			<button type="button" class="close"
																				data-dismiss="modal">
																				<span>×</span>
																			</button>
																		</div>
																		<div class="modal-body">Modal body text goes
																			here.</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary"
																				data-dismiss="modal">Close</button>
																			<button type="button" class="btn btn-primary">Save
																				changes</button>
																		</div>
																	</div>
																</div>
															</div>
														</div></td>
													<td>
														<div class="sweetalert m-t-30">
															<button class="btn btn-warning btn sweet-confirm"
																style="height: 30px; padding-top: 4px;">신청취소</button>
														</div>
													</td>
												</tr>
												<tr>
													<th>4</th>
													<td>Lucinda</td>
													<td>D. Sears</td>
													<td>@lucinda</td>
													<td>@lucinda</td>
													<td>@lucinda</td>
													<td><div class="bootstrap-modal">
															<!-- Button trigger modal -->
															<button type="button" class="btn btn-warning"
																data-toggle="modal" data-target="#basicModal"
																style="height: 30px; padding-top: 4px;">상세</button>
															<!-- Modal -->
															<div class="modal fade" id="basicModal"
																style="display: none;" aria-hidden="true">
																<div class="modal-dialog" role="document">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title">Modal title</h5>
																			<button type="button" class="close"
																				data-dismiss="modal">
																				<span>×</span>
																			</button>
																		</div>
																		<div class="modal-body">Modal body text goes
																			here.</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary"
																				data-dismiss="modal">Close</button>
																			<button type="button" class="btn btn-primary">Save
																				changes</button>
																		</div>
																	</div>
																</div>
															</div>
														</div></td>
													<td>
														<div class="sweetalert m-t-30">
															<button class="btn btn-warning btn sweet-confirm"
																style="height: 30px; padding-top: 4px;">신청취소</button>
														</div>
													</td>
												</tr>
												<tr>
													<th>5</th>
													<td>William</td>
													<td>T. Marks</td>
													<td>@william.marks</td>
													<td>@william.marks</td>
													<td>@william.marks</td>
													<td><div class="bootstrap-modal">
															<!-- Button trigger modal -->
															<button type="button" class="btn btn-warning"
																data-toggle="modal" data-target="#basicModal"
																style="height: 30px; padding-top: 4px;">상세</button>
															<!-- Modal -->
															<div class="modal fade" id="basicModal"
																style="display: none;" aria-hidden="true">
																<div class="modal-dialog" role="document">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title">Modal title</h5>
																			<button type="button" class="close"
																				data-dismiss="modal">
																				<span>×</span>
																			</button>
																		</div>
																		<div class="modal-body">Modal body text goes
																			here.</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary"
																				data-dismiss="modal">Close</button>
																			<button type="button" class="btn btn-primary">Save
																				changes</button>
																		</div>
																	</div>
																</div>
															</div>
														</div></td>
													<td>
														<div class="sweetalert m-t-30">
															<button class="btn btn-warning btn sweet-confirm"
																style="height: 30px; padding-top: 4px;">신청취소</button>
														</div>
													</td>
												</tr>
											</tbody>
										</table>

									</div>
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

	<!-- script -->
	<script src="resources/plugins/sweetalert/js/sweetalert.min.js"></script>
	<script>
		$(function() {
			document.querySelector(".sweet-confirm").onclick = function() {
				swal({
					title : "Are you sure to delete ?",
					text : "신청했던 휴가를 취소하시겠습니까?",
					type : "warning",
					showCancelButton : !0,
					confirmButtonColor : "#DD6B55",
					confirmButtonText : "yes",
					closeOnConfirm : !1
				}, function() {
					swal("Deleted !!", "휴가 신청이 취소되었습니다.", "success")
				})
			};
		});
	</script>

	<div class="sweet-overlay" tabindex="-1"
		style="opacity: -0.03; display: none;"></div>
	<div class="sweet-alert hideSweetAlert" data-custom-class=""
		data-has-cancel-button="true" data-has-confirm-button="true"
		data-allow-outside-click="false" data-has-done-function="true"
		data-animation="pop" data-timer="null"
		style="display: none; margin-top: -169px; opacity: -0.03;">
		<div class="sa-icon sa-error" style="display: none;">
			<span class="sa-x-mark"> <span class="sa-line sa-left"></span>
				<span class="sa-line sa-right"></span>
			</span>
		</div>
		<div class="sa-icon sa-warning" style="display: block;">
			<span class="sa-body"></span> <span class="sa-dot"></span>
		</div>
		<div class="sa-icon sa-info" style="display: none;"></div>
		<div class="sa-icon sa-success" style="display: none;">
			<span class="sa-line sa-tip"></span> <span class="sa-line sa-long"></span>

			<div class="sa-placeholder"></div>
			<div class="sa-fix"></div>
		</div>
		<div class="sa-icon sa-custom" style="display: none;"></div>
		<h2>Are you sure to delete ?</h2>
		<p style="display: block;">You will not be able to recover this
			imaginary file !!</p>
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
				<button class="confirm" tabindex="1"
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
	<!-- /script -->

</body>

<iframe id="google_esf" name="google_esf"
	src="https://googleads.g.doubleclick.net/pagead/html/r20191003/r20190131/zrt_lookup.html#"
	data-ad-client="ca-pub-2783044520727903" style="display: none;"></iframe>
</html>
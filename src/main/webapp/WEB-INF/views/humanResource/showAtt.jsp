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
						<li class="breadcrumb-item active"><a href="showAtt.wo">근태
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
											data-toggle="tab" href="#home1">근태 현황</a></li>
									<!-- 	<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#profile1">근태 수정 내역</a></li> -->
									</ul>
									<div class="tab-content">
										<div class="tab-pane fade active show" id="home1"
											role="tabpanel">
											<div class="p-t-15">
												<h4>근태 현황</h4>
												<br>
												<h5 align="center">이번 달 근태 현황</h5>
												<br>
												<table
													class="table table-bordered zero-configuration dataTable"
													id="DataTables_Table_0" role="grid"
													aria-describedby="DataTables_Table_0_info">

													<tbody>
														<tr>
															<td
																style="background: #f9f9f9; text-align: center; width: 120px">근무시간</td>
															<td colspan="3">09:00 ~ 18:00</td>
														</tr>
														<tr>
															<td style="background: #f9f9f9; text-align: center;">지각</td>
															<td colspan="3">${ late }</td>
														</tr>
														<tr>
															<td style="background: #f9f9f9; text-align: center;">비정상
																출근</td>
															<td>${ noOn }</td>
															<td
																style="background: #f9f9f9; text-align: center; width: 200px">비정상
																퇴근</td>
															<td style="width: 300px;">${ noOff }</td>
														</tr>

													</tbody>
												</table>

												<br> <br>

												<h4 align="center">2019</h4>
												<p align="center">해당 월을 선택하면 일별 근태현황을 볼 수 있습니다.</p>
												<table
													class="table table-bordered zero-configuration dataTable"
													id="DataTables_Table_0" role="grid"
													aria-describedby="DataTables_Table_0_info"
													style="text-align: center;">
													<thead style="background: #f9f9f9;">
														<tr>
															<td></td>
															<td><div class="bootstrap-modal">
																	<!-- Button trigger modal -->
																	<button type="button" data-toggle="modal"
																		data-target="#exampleModalLong"
																		style="border: none; cursor: pointer;">1월</button>
																	<!-- Modal -->
																	<div class="modal fade" id="exampleModalLong"
																		aria-hidden="true" style="display: none;">
																		<div class="modal-dialog">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h5 class="modal-title" style="float: left;">일별
																						근태 상세</h5>

																					<button type="button" class="close"
																						data-dismiss="modal">
																						<span>×</span>
																					</button>
																				</div>
																				<div class="modal-body" style="text-align: left;">

																					<p>
																						${ m.name }(${ m.num })<br> 근무시간 : 09:00 ~
																						18:00 / 퇴근 체크 대상
																					</p>

																					<select name="year">
																						<option value="2019" selected>2019년</option>
																						<option value="2018">2018년</option>
																						<option value="2017">2017년</option>
																						<option value="2016">2016년</option>
																					</select>&nbsp; <select name="month">
																						<option value="1">1월</option>
																						<option value="2">2월</option>
																						<option value="3">3월</option>
																						<option value="4">4월</option>
																						<option value="5">5월</option>
																						<option value="6">6월</option>
																						<option value="7">7월</option>
																						<option value="8">8월</option>
																						<option value="9">9월</option>
																						<option value="10" selected>10월</option>
																						<option value="11">11월</option>
																						<option value="12">12월</option>
																					</select> <br> <br>
																					<div class="table-responsive">
																						<table class="table">
																							<thead>
																								<tr>
																									<th>날짜</th>
																									<th>출근(시간 / 결과)</th>
																									<th>퇴근(시간 / 결과)</th>
																									<th>수정</th>
																								</tr>
																							</thead>
																							<tbody>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>
																								<tr>
																									<td>2019-10-01</td>
																									<td>08:40 / 〇</td>
																									<td>18:30 / 〇</td>
																									<td><a href="">요청</a></td>
																								</tr>

																							</tbody>
																						</table>
																					</div>
																				</div>

																				<div class="modal-footer">
																					<button type="button" class="btn btn-secondary"
																						data-dismiss="modal">Close</button>
																				</div>
																			</div>
																		</div>
																	</div>
																</div></td>
															<td>2월</td>
															<td>3월</td>
															<td>4월</td>
															<td>5월</td>
															<td>6월</td>
															<td>7월</td>
															<td>8월</td>
															<td>9월</td>
															<td><button type="button" data-toggle="modal"
																	data-target="#exampleModalLong1"
																	style="border: none; cursor: pointer;"
																	>10월</button>
																 <!-- Modal -->
																<div class="modal fade" id="exampleModalLong1"
																	aria-hidden="true" style="display: none;">
																	<div class="modal-dialog">
																		<div class="modal-content">
																			<div class="modal-header">
																				<h5 class="modal-title" style="float: left;">일별
																					근태 상세</h5>

																				<button type="button" class="close"
																					data-dismiss="modal">
																					<span>×</span>
																				</button>
																			</div>
																			<div class="modal-body" style="text-align: left;">

																				<p>
																					${ m.name }(${ m.num })<br> 근무시간 : 09:00 ~
																					18:00 / 퇴근 체크 대상
																				</p>

																				<select name="year">
																					<option value="2019" selected>2019년</option>
																					<option value="2018">2018년</option>
																					<option value="2017">2017년</option>
																					<option value="2016">2016년</option>
																				</select>&nbsp; <select name="month">
																					<option value="1">1월</option>
																					<option value="2">2월</option>
																					<option value="3">3월</option>
																					<option value="4">4월</option>
																					<option value="5">5월</option>
																					<option value="6">6월</option>
																					<option value="7">7월</option>
																					<option value="8">8월</option>
																					<option value="9">9월</option>
																					<option value="10" selected>10월</option>
																					<option value="11">11월</option>
																					<option value="12">12월</option>
																				</select> <br> <br>
																				<div class="table-responsive">
																					<table class="table">
																						<thead>
																							<tr>
																								<th>날짜</th>
																								<th>출근(시간 / 결과)</th>
																								<th>퇴근(시간 / 결과)</th>
																							</tr>
																						</thead>
																						<tbody>
																							<c:forEach items="${ att }" var="a">
																								<tr>
																									<td>${ a.attDate }</td>
																									<td>${ a.timeOn }</td>
																									<td>${ a.timeOff }</td>
																								</tr>
																							</c:forEach>

																						</tbody>
																					</table>
																				</div>
																			</div>

																			<div class="modal-footer">
																				<button type="button" class="btn btn-secondary"
																					data-dismiss="modal">Close</button>
																			</div>
																		</div>
																	</div>
																</div></td>

															<td><button type="button" data-toggle="modal"
																	data-target="#exampleModalLong2"
																	style="border: none; cursor: pointer;"
																	>11월</button>
																 <!-- Modal -->
																<div class="modal fade" id="exampleModalLong2"
																	aria-hidden="true" style="display: none;">
																	<div class="modal-dialog">
																		<div class="modal-content">
																			<div class="modal-header">
																				<h5 class="modal-title" style="float: left;">일별
																					근태 상세</h5>

																				<button type="button" class="close"
																					data-dismiss="modal">
																					<span>×</span>
																				</button>
																			</div>
																			<div class="modal-body" style="text-align: left;">

																				<p>
																					${ m.name }(${ m.num })<br> 근무시간 : 09:00 ~
																					18:00 / 퇴근 체크 대상
																				</p>

																				<select name="year">
																					<option value="2019" selected>2019년</option>
																					<option value="2018">2018년</option>
																					<option value="2017">2017년</option>
																					<option value="2016">2016년</option>
																				</select>&nbsp; <select name="month">
																					<option value="1">1월</option>
																					<option value="2">2월</option>
																					<option value="3">3월</option>
																					<option value="4">4월</option>
																					<option value="5">5월</option>
																					<option value="6">6월</option>
																					<option value="7">7월</option>
																					<option value="8">8월</option>
																					<option value="9">9월</option>
																					<option value="10" selected>10월</option>
																					<option value="11">11월</option>
																					<option value="12">12월</option>
																				</select> <br> <br>
																				<div class="table-responsive">
																					<table class="table">
																						<thead>
																							<tr>
																								<th>날짜</th>
																								<th>출근(시간 / 결과)</th>
																								<th>퇴근(시간 / 결과)</th>
																							</tr>
																						</thead>
																						<tbody>
																							<c:forEach items="${ att }" var="a">
																								<tr>
																									<td>${ a.attDate }</td>
																									<td>${ a.timeOn }</td>
																									<td>${ a.timeOff }</td>
																								</tr>
																							</c:forEach>

																						</tbody>
																					</table>
																				</div>
																			</div>

																			<div class="modal-footer">
																				<button type="button" class="btn btn-secondary"
																					data-dismiss="modal">Close</button>
																			</div>
																		</div>
																	</div>
																</div></td>
															<td>12월</td>
															<td>합계</td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td style="background: #f9f9f9;">지각</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>${ late }</td>
															<td></td>
															<td></td>
														</tr>
														<tr>
															<td style="background: #f9f9f9;">비정상 출근</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>${ noOn }</td>
															<td></td>
															<td></td>
														</tr>
														<tr>
															<td style="background: #f9f9f9;">비정상 퇴근</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td>${ noOff }</td>
															<td></td>
															<td></td>
														</tr>


													</tbody>
												</table>
											</div>
										</div>
										<div class="tab-pane fade" id="profile1">
											<div class="p-t-15">

												<br>

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

												<br> <br>

												<table class="table header-border">
													<thead>
														<tr style="background: #f9f9f9;">
															<th scope="col">요청 날짜</th>
															<th scope="col">종류</th>
															<th scope="col">기존 시간</th>
															<th scope="col">요청 시간</th>
															<th scope="col">사유</th>
															<th scope="col">결과</th>
															<th scope="col">상세보기</th>
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
																	<button type="button" class="btn btn-primary"
																		data-toggle="modal" data-target="#exampleModalCenter">상세</button>
																	<!-- Modal -->
																	<div class="modal fade" id="exampleModalCenter"
																		style="display: none;" aria-hidden="true">
																		<div class="modal-dialog modal-dialog-centered"
																			role="document">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h5 class="modal-title">Modal title</h5>
																					<button type="button" class="close"
																						data-dismiss="modal">
																						<span>×</span>
																					</button>
																				</div>
																				<div class="modal-body">
																					<p>Cras mattis consectetur purus sit amet
																						fermentum. Cras justo odio, dapibus ac facilisis
																						in, egestas eget quam. Morbi leo risus, porta ac
																						consectetur ac, vestibulum at eros.</p>
																				</div>
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
														</tr>
														<tr>
															<th>2</th>
															<td>Nancy</td>
															<td>J. Daniels</td>
															<td>@daniels</td>
															<td>@daniels</td>
															<td>@daniels</td>
															<td>
																<div class="bootstrap-modal">
																	<!-- Button trigger modal -->
																	<button type="button" class="btn btn-primary"
																		data-toggle="modal" data-target="#exampleModalCenter">상세</button>
																	<!-- Modal -->
																	<div class="modal fade" id="exampleModalCenter"
																		style="display: none;" aria-hidden="true">
																		<div class="modal-dialog modal-dialog-centered"
																			role="document">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h5 class="modal-title">Modal title</h5>
																					<button type="button" class="close"
																						data-dismiss="modal">
																						<span>×</span>
																					</button>
																				</div>
																				<div class="modal-body">
																					<p>Cras mattis consectetur purus sit amet
																						fermentum. Cras justo odio, dapibus ac facilisis
																						in, egestas eget quam. Morbi leo risus, porta ac
																						consectetur ac, vestibulum at eros.</p>
																				</div>
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
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
						<li class="breadcrumb-item active"><a href="mngAtt.wo">직원
								근태 조회</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h5>직원 근태 조회</h5>
								<br>
								<div class="dropdown custom-dropdown">
									<div data-toggle="dropdown" aria-expanded="false"
										style="color: #F36F30;">
										조직 <i class="fa fa-angle-down m-l-5"></i>
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
								<table class="table header-border" style="text-align: center;">
									<thead>
										<tr style="background: #f9f9f9; border: 1px solid lightgray;">
											<th scope="col"
												style="width: 100px; border: 1px solid lightgray;">이름</th>
											<th scope="col"
												style="width: 130px; border: 1px solid lightgray;">소속</th>
											<th scope="col" style="border: 1px solid lightgray;">지각/미체크</th>
											<th scope="col" style="border: 1px solid lightgray;">상세보기</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>d</td>
											<td>d</td>
											<td>d</td>
											<td>
												<div class="bootstrap-modal">
													<!-- Button trigger modal -->
													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#exampleModalLong"
														style="padding-top: 0; height: 20px;">상세</button>
													<!-- Modal -->
													<div class="modal fade" id="exampleModalLong"
														aria-hidden="true" style="display: none;">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" style="float: left;">일별 근태
																		상세</h5>
																	<button type="button" class="close"
																		data-dismiss="modal">
																		<span>×</span>
																	</button>
																</div>
																<div class="modal-body" style="text-align: left;">

																	<p>
																		강연재(사번)<br> 근무시간 : 09:00 ~ 18:00 / 퇴근 체크 대상
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
												</div>
											</td>
										</tr>
										<tr>
											<td>d</td>
											<td>d</td>
											<td>d</td>
											<td>
												<div class="bootstrap-modal">
													<!-- Button trigger modal -->
													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#basicModal"
														style="padding-top: 0; height: 20px;">상세</button>
													<!-- Modal -->
													<div class="modal fade" id="basicModal"
														style="display: none;" aria-hidden="true">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title">Modalㅇ맂,ㅣ</h5>
																	<button type="button" class="close"
																		data-dismiss="modal">
																		<span>×</span>
																	</button>
																</div>
																<div class="modal-body">Modal body text goes
																	here.ㅇㅇ</div>
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
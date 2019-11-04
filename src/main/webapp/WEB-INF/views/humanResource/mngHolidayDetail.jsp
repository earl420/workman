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
									<div class="col-lg-3">
										<input type="text" class="form-control" id="a" value="${ deptName }">
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
										<c:forEach items="${ allHoli }" var="a" varStatus="status">
											<tr>
												<td class="name">
												<input type="hidden" name="empName" value="${a.empNum }">
												${ a.empName }</td>
												<td>${ a.holiCount }</td>
												<td>${ a.holiLeft }</td>
												
												
												<td><div class="bootstrap-modal">
														<!-- Button trigger modal -->
														<button type="button" class="btn btn-primary"
															data-toggle="modal" data-target="#basicModal${ status.index }"
															style="padding-top: 0; height: 20px;">상세</button>
														<!-- Modal -->
														<div class="modal fade" id="basicModal${ status.index }"
															style="display: none;" aria-hidden="true">
															<div class="modal-dialog" role="document">
																<div class="modal-content">
																	<div class="modal-header">
																		<h5 class="modal-title">휴가 상세</h5>
																		<button type="button" class="close"
																			data-dismiss="modal">
																			<span>×</span>
																		</button>
																	</div>
																	<div class="modal-body">
																		<div class="default-tab">
																			<ul class="nav nav-tabs mb-3" role="tablist">
																				<li class="nav-item"><a class="nav-link active"
																					data-toggle="tab" href="#home${ status.index }">생성 내역</a></li>
																				<li class="nav-item"><a class="nav-link"
																					data-toggle="tab" href="#profile${ status.index }">사용 내역</a></li>
																			</ul>
																			<div class="tab-content">
																				<div class="tab-pane fade show active" id="home${ status.index }"
																					role="tabpanel">
																					<div class="p-t-15" style="text-align: left;">
																						${ a.empName }(${ a.empNum }) 님의 휴가 생성 내역 [2019.01~2019.12]<br>
																						<br>
																						<table class="table header-border"
																							style="text-align: center;">
																							<thead>
																								<tr
																									style="background: #f9f9f9; border: 1px solid lightgray;">
																									<th scope="col"
																										style="width: 100px; border: 1px solid lightgray;"
																										rowspan="2">이름</th>
																									<th scope="col"
																										style="border: 1px solid lightgray;"
																										colspan="2">사용현황</th>
																									<th scope="col"
																										style="border: 1px solid lightgray;"
																										rowspan="2">내용</th>
																								</tr>
																								<tr>
																									<td
																										style="background: #f9f9f9; border: 1px solid lightgray;">발생</td>
																									<td
																										style="background: #f9f9f9; border: 1px solid lightgray;">최종</td>
																								</tr>
																							</thead>
																							
																							<tbody>
																								<tr>
																									<td>${ a.empName }</td>
																									<td>${ a.holiLeft }</td>
																									<td>${ a.holiCount }</td>
																									<td>개인사유</td>
																								</tr>
																								
																							</tbody>

																						</table>
																					</div>
																				</div>
																				<div class="tab-pane fade" id="profile${ status.index }">
																					<div class="p-t-15">
																						<div class="p-t-15" style="text-align: left;">
																							<br>
																							${ a.empName }(${ a.empNum }) 님의 휴가 생성 내역 [2019.01~2019.12] / 입사일 : <br>
																							<table class="table header-border"
																								style="text-align: center;">
																								<thead>
																									<tr
																										style="background: #f9f9f9; border: 1px solid lightgray;">
																										<th scope="col"
																											style="border: 1px solid lightgray;">번호</th>
																										<th scope="col"
																											style="border: 1px solid lightgray;">휴가
																											종류</th>
																										<th scope="col"
																											style="border: 1px solid lightgray;">일수</th>
																										<th scope="col"
																											style="border: 1px solid lightgray;">기간</th>
																										<th scope="col"
																											style="border: 1px solid lightgray;">상태</th>
																									</tr>
																								</thead>

																							</table>
																						</div>
																					</div>
																				</div>
																			</div>
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
											</tr>
										</c:forEach>




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
		
	</script>

</body>
<iframe id="google_esf" name="google_esf"
	src="https://googleads.g.doubleclick.net/pagead/html/r20191003/r20190131/zrt_lookup.html#"
	data-ad-client="ca-pub-2783044520727903" style="display: none;"></iframe>
</html>
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


	<!-- main-wrapper -->
	<div id="main-wrapper" style="">
		<c:import url="../common/header.jsp"></c:import>
		<!-- content-body -->
		<div class="content-body" style="min-height: 889px;">

			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="fixturelist.wo">총무회계</a></li>
						<li class="breadcrumb-item active"><a href="fixturelist.wo">사내물품관리</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">월급관리</h4>
								<div class="table-responsive">
									<div id="DataTables_Table_0_wrapper"
										class="dataTables_wrapper container-fluid dt-bootstrap4">
										<div class="row">
											<%-- <div class="col-sm-12 col-md-6">총 게시글 갯수 : ${ pi.listCount }
											</div> --%>
											<div class="col-sm-12 col-md-6">
												<!-- <div id="DataTables_Table_0_filter"
													class="dataTables_filter">
													<label>Search:<input type="search"
														class="form-control form-control-sm" placeholder="게시물 검색"
														aria-controls="DataTables_Table_0"></label>
												</div> -->
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<table
													class="table table-striped table-bordered zero-configuration dataTable"
													id="DataTables_Table_0" role="grid"
													aria-describedby="DataTables_Table_0_info">
													<thead>
														<tr role="row">
															<th style="width: 10%; text-align: center;">직원번호</th>
															<th rowspan="1" colspan="1"
																style="width: 15%; text-align: center;">부서</th>
															<th rowspan="1" colspan="1"
																style="width: 25%; text-align: center;">이름</th>
															<th rowspan="1" colspan="1"
																style="width: 10%; text-align: center;">직책</th>
															<th rowspan="1" colspan="1"
																style="width: 10%; text-align: center;">월급</th>
															<th rowspan="1" colspan="1"
																style="width: 15%; text-align: center;">연봉</th>
															<th rowspan="1" colspan="1"
																style="width: 15%; text-align: center;">작년대비인상률</th>
														</tr>
													</thead>

													<tbody>
														<c:forEach items="${ list }" var="i">
															<tr role="row" class="odd">
																<td class="sorting_1">${ i.empNum }</td>
																<td>${ i.deptName }</td>
																<td>${ i.empName }</td>
																<td>${ i.gradeName }</td>
																<td>${ i.monSalary }</td>
																<td>${ i.yearSalary }</td>
																<td>${ i.increaseRate }%</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
										<div align="right" style="padding-right: 50px; padding-top: 10px;">
											<button type="button" onclick="location.href='expenseWrite.wo'" class="btn mb-1 btn-outline-warning"  id="insertSale"
											 style="border-radius: 5px; width:10em;">
												<strong>등록</strong>
											</button>
										</div>
										
										<div class="row">
											<div class="col-sm-12 col-md-5">
											</div>
											<div class="col-sm-12 col-md-7">
												<div class="dataTables_paginate paging_simple_numbers"
													id="DataTables_Table_0_paginate">
													<ul class="pagination">

														<!-- 이전 -->
														<c:if test="${ pi.currentPage eq 1 }">
															<li class="paginate_button page-item previous disabled"
																id="DataTables_Table_0_previous">Previous</li>
														</c:if>
														<c:if test="${ pi.currentPage ne 1 }">
															<c:url value="hrNotice.wo" var="before">
																<c:param name="currentPage"
																	value="${ pi.currentPage - 1 }" />
															</c:url>
															<li class="paginate_button page-item previous"
																id="DataTables_Table_0_previous"><a
																href="${ before }" aria-controls="DataTables_Table_0"
																data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
														</c:if>

														<!-- 번호들 -->
														<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }"
															var="p">
															<c:if test="${ p eq pi.currentPage }">
																<li class="paginate_button page-item active"><a
																	href="#" aria-controls="DataTables_Table_0"
																	data-dt-idx="1" tabindex="0" class="page-link">${ p }</a></li>
															</c:if>
															<c:if test="${ p ne pi.currentPage }">
																<c:url value="hrNotice.wo" var="page">
																	<c:param name="currentPage" value="${ p }" />
																</c:url>
																<li class="paginate_button page-item "><a
																	href="${ page }" aria-controls="DataTables_Table_0"
																	data-dt-idx="${ page }" tabindex="0" class="page-link">${ p }</a></li>
															</c:if>
														</c:forEach>


														<!-- 다음 -->
														<c:if test="${ pi.currentPage eq pi.maxPage }">
															<li class="paginate_button page-item next disabled"
																id="DataTables_Table_0_next">Next</li>
														</c:if>
														<c:if test="${ pi.currentPage ne pi.maxPage }">
															<c:url value="hrNotice.wo" var="next">
																<c:param name="currentPage"
																	value="${ pi.currentPage + 1 }" />
															</c:url>
															<li class="paginate_button page-item next"
																id="DataTables_Table_0_next"><a href="${ next }"
																aria-controls="DataTables_Table_0"
																data-dt-idx="${ page }" tabindex="0" class="page-link">Next</a>
														</c:if>
													</ul>
												</div>
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
		<!-- footer -->
		<c:import url="../common/footer.jsp"></c:import>
		<!-- /footer -->
	</div>
		
	<!-- /main-wrapper -->
	<script src="resources/account/js/salaryList.js"></script>
	
</body>
</html>
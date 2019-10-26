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
						<li class="breadcrumb-item"><a href="hrNotice.wo">인사관리</a></li>
						<li class="breadcrumb-item active"><a href="hrNotice.wo">공지사항</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">공지사항</h4>
								<button class="btn mb-1 btn-rounded btn-warning" onclick="location.href='ninsert.wo';">글 작성</button>
								<div class="table-responsive">
									<div id="DataTables_Table_0_wrapper"
										class="dataTables_wrapper container-fluid dt-bootstrap4">
										<div class="row">
											<div class="col-sm-12 col-md-6">총 게시글 갯수 : ${ pi.listCount }
											</div>
											<div class="col-sm-12 col-md-6">
												<div id="DataTables_Table_0_filter"
													class="dataTables_filter">
													<label>Search:<input type="search"
														class="form-control form-control-sm" placeholder="게시물 검색"
														aria-controls="DataTables_Table_0"></label>
												</div>
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
															<th class="sorting_asc" tabindex="0"
																aria-controls="DataTables_Table_0" rowspan="1"
																colspan="1" aria-sort="ascending"
																aria-label="Name: activate to sort column descending"
																style="width: 70px; text-align: center;">번호</th>
															<th class="sorting" tabindex="0"
																aria-controls="DataTables_Table_0" rowspan="1"
																colspan="1"
																aria-label="Position: activate to sort column ascending"
																style="width: 446px; text-align: center;">제목</th>
															<th class="sorting" tabindex="0"
																aria-controls="DataTables_Table_0" rowspan="1"
																colspan="1"
																aria-label="Office: activate to sort column ascending"
																style="width: 111px; text-align: center;">작성자</th>
															<th class="sorting" tabindex="0"
																aria-controls="DataTables_Table_0" rowspan="1"
																colspan="1"
																aria-label="Age: activate to sort column ascending"
																style="width: 69px; text-align: center;">작성일</th>
														</tr>
													</thead>

													<tbody>
														<c:forEach items="${ list }" var="n">
															<tr role="row" class="odd">
																<td class="sorting_1">${ n.noticeNum }</td>
																<td><c:if test="${ empty loginUser }">
																	${ n.noticeTitle }
																</c:if> <c:if test="${ !empty loginUser }">
																		<c:url value="hrnDetail.wo" var="hrnDetail">
																			<c:param name="noticeNum" value="${ n.noticeNum }" />
																		</c:url>
																		<a href="${ hrnDetail }">${ n.noticeTitle }</a>
																	</c:if></td>
																<td>${ n.empName }</td>
																<td>${ n.noticeDate }</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
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
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<title>마이페이지</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/icons/logo1.png">
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
	<div id="main-wrapper">
		<c:import url="../common/header.jsp"></c:import>
		<!-- content-body -->
		<div class="content-body" style="min-height: 889px;">

			<div class="row page-titles mx-0">
				<div class="col p-md-0"></div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3">
						<div class="card">
							<div class="card-body" style="height: 700px;">
								<h5>내 정보</h5>
								<br>
								<div class="form-validation">
									
									<div class="form-group row">
										<div class="col-lg-6">
											<p>
												<c:out value="${ loginMan.name }"></c:out>
												<c:out value="${ loginMan.gradeName }"></c:out>
											</p>
												<c:out value="${ loginMan.deptName }"></c:out>
										</div>
									</div>
									<div class="form-group row">
									</div>
									<div class="form-group row">
										<div class="col-lg-6">
											사번 : <br>
											<c:out value="${ loginMan.num }"></c:out><br>
											입사일 : <br>
											<c:out value="${ loginMan.enrollDate }"></c:out><br>
											전화번호 : <br>
											<c:out value="${ loginMan.phone }"></c:out><br>
											이메일 : <br>
											<c:out value="${ loginMan.email }"></c:out>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-6">
											남은휴가 : <br>
											<c:out value="${ loginMan.holidayLeft }일"></c:out>
										</div>
									</div>
										
								</div>
							</div>
						</div>
					</div>
					
				
				
					<div class="col-md-8">
						<div class="card">
							<div class="card-body" style="height: 700px;">
								<h4 class="card-title">직원</h4>
								<div class="table-responsive">
									<div id="DataTables_Table_0_wrapper"
										class="dataTables_wrapper container-fluid dt-bootstrap4">
										<div class="row">
											<div class="col-sm-12 col-md-6">
												<c:out value="총 직원 수 : ${ pi.listCount }"></c:out>
												
											</div>
											<div class="col-sm-12 col-md-6">
												<div id="DataTables_Table_0_filter"
													class="dataTables_filter">
													<form action="empSearch.wo" method="post">
														<label>직원 검색:
															<input type="search" name="emp"
															class="form-control form-control-sm" placeholder="직원명"
															aria-controls="DataTables_Table_0">
															<button type="submit" class="btn mb-1">검색</button>
														</label>
													</form>
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
															<th style="width: 10%; text-align: center;">이름</th>
															<th rowspan="1" colspan="1"
																style="width: 15%; text-align: center;">부서</th>
															<th rowspan="1" colspan="1"
																style="width: 15%; text-align: center;">직급</th>
															<th rowspan="1" colspan="1"
																style="width: 20%; text-align: center;">전화번호</th>
															<th rowspan="1" colspan="1"
																style="width: 40%; text-align: center;">이메일</th>
														</tr>
													</thead>

													<tbody>
														<c:forEach items="${ list }" var="m">
															<tr role="row" class="odd">
																<td>${ m.name }</td>
																<td>${ m.deptName }</td>
																<td>${ m.gradeName }</td>
																<td>${ m.phone }</td>
																<td>${ m.email }</td>
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
															<c:url value="mypageView.wo" var="before">
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
																<c:url value="mypageView.wo" var="page">
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
															<c:url value="mypageView.wo" var="next">
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
					
						<div class="card">
							<div class="card-body">
								<h5></h5>
								<br>
								<div class="form-validation">
									
									<div class="form-group row">
										
										<div class="col-lg-6">
											
										</div>
									</div>
									<div class="form-group row">
										<div class="col-lg-8 ml-auto">
											
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
	
	<script type="text/javascript">
			
	
	
	
		/* $(function(){
			$('#emp').on('keyup', function(){
				
				var emp = $(this).val();
				
				$.ajax({
					url:"empSearch.wo",
					data:{id:emp},
					type:"post",
					data:params,
					success: function(data){
						
					},
					error: function(){
						swal.fire({
							type: 'error',
							title: '없는 직원 입니다.',
							confirmButtonText: '확인'
						});
					}
				});
				
				
			});
			
			
		}); */
		
	
	
	</script>
	

</body>
<iframe id="google_esf" name="google_esf"
	src="https://googleads.g.doubleclick.net/pagead/html/r20191003/r20190131/zrt_lookup.html#"
	data-ad-client="ca-pub-2783044520727903" style="display: none;"></iframe>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>마이페이지</title>
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
				<div class="col p-md-0"></div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-md-4">
						<div class="card">
							<div class="card-body">
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
							<div class="card-body">
								<h5>결제처리</h5>
								<br>
								<div class="form-validation">
									
									<div class="form-group row">
										<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th width="10%">문서번호</th>
												<th width="15%">문서종류</th>
												<th width="30%">내용</th>
												<th width="15%">진행상황</th>
												<th width="15%">등록일</th>
												<th width="15%">작성자</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th>1</th>
												<td>기안서</td>
												<td>문서기안</td>
												<td><span class="label label-info">진행</span></td>
												<td>2018-09-04</td>
												<td>나나나</td>
											</tr>
											<tr>
												<th>2</th>
												<td>기안서</td>
												<td>문서 기안</td>
												<td><span class="label label-info">진행</span></td>
												<td>2018-10-11</td>
												<td>작성이요</td>
											</tr>
											<tr>
												<th>3</th>
												<td>기안서</td>
												<td>제품구입기안</td>
												<td><span class="label label-info">진행</span></td>
												<td>2018-09-25</td>
												<td>민병현</td>
											</tr>
											<tr>
												<th>4</th>
												<td>품의서</td>
												<td>제품구입품의</td>
												<td><span class="label label-info">진행</span></td>
												<td>January 25</td>
												<td>민병현</td>
											</tr>
											<tr>
												<th>5</th>
												<td>품의서</td>
												<td>제품구입품의</td>
												<td><span class="label label-info">진행</span></td>
												<td>January 25</td>
												<td>민병현</td>
											</tr>
											<tr>
												<th>6</th>
												<td>품의서</td>
												<td>제품구입품의</td>
												<td><span class="label label-info">진행</span></td>
												<td>January 25</td>
												<td>민병현</td>
											</tr>
											<tr>
												<th>7</th>
												<td>품의서</td>
												<td>제품구입품의</td>
												<td><span class="label label-info">진행</span></td>
												<td>January 25</td>
												<td>민병현</td>
											</tr>
											<tr>
												<th>8</th>
												<td>품의서</td>
												<td>제품구입품의</td>
												<td><span class="label label-info">진행</span></td>
												<td>January 25</td>
												<td>민병현</td>
											</tr>
											<tr>
												<th>9</th>
												<td>품의서</td>
												<td>제품구입품의</td>
												<td><span class="label label-info">진행</span></td>
												<td>January 25</td>
												<td>민병현</td>
											</tr>
											<tr>
												<th>10</th>
												<td>품의서</td>
												<td>제품구입품의</td>
												<td><span class="label label-info">진행</span></td>
												<td>January 25</td>
												<td>민병현</td>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="3" align="center">
												<div class="bootstrap-pagination">
														<nav>
															<ul class="pagination justify-content-end">
																<li class="page-item disabled"><a class="page-link"	href="#" tabindex="-1">Previous</a></li>
																<li class="page-item"><a class="page-link" href="#">1</a>
																</li>
																<li class="page-item"><a class="page-link" href="#">2</a>
																</li>
																<li class="page-item"><a class="page-link" href="#">3</a>
																</li>
																<li class="page-item"><a class="page-link" href="#">4</a>
																</li>
																<li class="page-item"><a class="page-link" href="#">5</a>
																</li>
																<li class="page-item"><a class="page-link" href="#">6</a>
																</li>
																<li class="page-item"><a class="page-link" href="#">7</a>
																</li>
																<li class="page-item"><a class="page-link" href="#">8</a>
																</li>
																<li class="page-item"><a class="page-link" href="#">9</a>
																</li>
																<li class="page-item"><a class="page-link" href="#">10</a>
																</li>
																<li class="page-item"><a class="page-link" href="#">Next</a>
																</li>
															</ul>
														</nav>
													</div>
												</td>
												<th colspan="3">
												<div>
													<div style="display: inline-block;">													
														<select name="" aria-controls="DataTables_Table_0" style=" height:26px; min-height: 26px;" class="form-control form-control-sm">
															<option value="10">선택</option>
															<option value="25">문서종류</option>
															<option value="50">내용</option>
															<option value="100">작성자</option>
														</select>
													</div>
													<div style="display: inline-block;">	
														<input type="text">
													</div>
													<div style="display: inline-block;">	
														<button class="btn mb-1 btn-rounded btn-outline-dark">검색</button>
													</div>
												</div>
												</th>
											</tr>
											
										</tfoot>
										
									</table>
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

</body>
<iframe id="google_esf" name="google_esf"
	src="https://googleads.g.doubleclick.net/pagead/html/r20191003/r20190131/zrt_lookup.html#"
	data-ad-client="ca-pub-2783044520727903" style="display: none;"></iframe>
</html>
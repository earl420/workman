<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<meta charset="UTF-8">
<title>전자결재</title>
</head>
<body>
	<div id="main-wrapper">
		<c:import url="../common/header.jsp" />
		<div class="content-body" style="min-height: 884px;">
			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">문서목록</a></li>
						<li class="breadcrumb-item active"><a href="javascript:void(0)">대기문서목록</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<!-- 사이즈 설정   -->
						<div class="card">
							<div class="card-body">
								<div class="card-title">
									<h4>전체리스트</h4>
								</div>
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
												<td><span class="label label-warning">대기</span></td>
												<td>2018-09-04</td>
												<td>나나나</td>
											</tr>
											<tr>
												<th>2</th>
												<td>기안서</td>
												<td>문서 기안</td>
												<td><span class="label label-warning">대기</span></td>
												<td>2018-10-11</td>
												<td>작성이요</td>
											</tr>
											<tr>
												<th>3</th>
												<td>기안서</td>
												<td>제품구입기안</td>
												<td><span class="label label-warning">대기</span></td>
												<td>2018-09-25</td>
												<td>민병현</td>
											</tr>
											<tr>
												<th>4</th>
												<td>품의서</td>
												<td>제품구입품의</td>
												<td><span class="label label-warning">대기</span></td>
												<td>January 25</td>
												<td>민병현</td>
											</tr>
											<tr>
												<th>5</th>
												<td>품의서</td>
												<td>제품구입품의</td>
												<td><span class="label label-warning">대기</span></td>
												<td>January 25</td>
												<td>민병현</td>
											</tr>
											<tr>
												<th>6</th>
												<td>품의서</td>
												<td>제품구입품의</td>
												<td><span class="label label-warning">대기</span></td>
												<td>January 25</td>
												<td>민병현</td>
											</tr>
											<tr>
												<th>7</th>
												<td>품의서</td>
												<td>제품구입품의</td>
												<td><span class="label label-warning">대기</span></td>
												<td>January 25</td>
												<td>민병현</td>
											</tr>
											<tr>
												<th>8</th>
												<td>품의서</td>
												<td>제품구입품의</td>
												<td><span class="label label-warning">대기</span></td>
												<td>January 25</td>
												<td>민병현</td>
											</tr>
											<tr>
												<th>9</th>
												<td>품의서</td>
												<td>제품구입품의</td>
												<td><span class="label label-warning">대기</span></td>
												<td>January 25</td>
												<td>민병현</td>
											</tr>
											<tr>
												<th>10</th>
												<td>품의서</td>
												<td>제품구입품의</td>
												<td><span class="label label-warning">대기</span></td>
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
			</div>
		</div>
	<c:import url="../common/footer.jsp"></c:import>
	</div>
</body>
</html>
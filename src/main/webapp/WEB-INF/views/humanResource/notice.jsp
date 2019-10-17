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
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="resources/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

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
								<div class="table-responsive">
									<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
										<div class="row">
											<div class="col-sm-12 col-md-6">
												<div class="dataTables_length" id="DataTables_Table_0_length">
													<label>Show
													<select name="DataTables_Table_0_length" aria-controls="DataTables_Table_0" class="form-control form-control-sm">
														<option value="10">10</option>
														<option value="25">25</option>
														<option value="50">50</option>
														<option value="100">100</option>
														</select> entries
													</label>
												</div>
											</div>
											<div class="col-sm-12 col-md-6">
												<div id="DataTables_Table_0_filter"
													class="dataTables_filter">
													<label>Search:<input type="search"
														class="form-control form-control-sm" placeholder=""
														aria-controls="DataTables_Table_0"></label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<table class="table table-striped table-bordered zero-configuration dataTable"
													id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info">
													<thead>
														<tr role="row">
															<th class="sorting_asc" tabindex="0"
																aria-controls="DataTables_Table_0" rowspan="1"
																colspan="1" aria-sort="ascending"
																aria-label="Name: activate to sort column descending"
																style="width: 70px; text-align:center;">번호</th>
															<th class="sorting" tabindex="0"
																aria-controls="DataTables_Table_0" rowspan="1"
																colspan="1"
																aria-label="Position: activate to sort column ascending"
																style="width: 446px; text-align:center;">제목</th>
															<th class="sorting" tabindex="0"
																aria-controls="DataTables_Table_0" rowspan="1"
																colspan="1"
																aria-label="Office: activate to sort column ascending"
																style="width: 111px; text-align:center;">작성자</th>
															<th class="sorting" tabindex="0"
																aria-controls="DataTables_Table_0" rowspan="1"
																colspan="1"
																aria-label="Age: activate to sort column ascending"
																style="width: 69px; text-align:center;">작성일</th>
															<th class="sorting" tabindex="0"
																aria-controls="DataTables_Table_0" rowspan="1"
																colspan="1"
																aria-label="Start date: activate to sort column ascending"
																style="width: 50px; text-align:center;">조회수</th>
														</tr>
													</thead>
													<tbody>
														<tr role="row" class="odd">
															<td class="sorting_1">Airi Satou</td>
															<td>Accountant</td>
															<td>Tokyo</td>
															<td>33</td>
															<td>2008/11/28</td>
														</tr>
														<tr role="row" class="even">
															<td class="sorting_1">Angelica Ramos</td>
															<td>Chief Executive Officer (CEO)</td>
															<td>London</td>
															<td>47</td>
															<td>2009/10/09</td>
														</tr>
														<tr role="row" class="odd">
															<td class="sorting_1">Ashton Cox</td>
															<td>Junior Technical Author</td>
															<td>San Francisco</td>
															<td>66</td>
															<td>2009/01/12</td>
														</tr>
														<tr role="row" class="even">
															<td class="sorting_1">Bradley Greer</td>
															<td>Software Engineer</td>
															<td>London</td>
															<td>41</td>
															<td>2012/10/13</td>
														</tr>
														<tr role="row" class="odd">
															<td class="sorting_1">Brenden Wagner</td>
															<td>Software Engineer</td>
															<td>San Francisco</td>
															<td>28</td>
															<td>2011/06/07</td>
														</tr>
														<tr role="row" class="even">
															<td class="sorting_1">Brielle Williamson</td>
															<td>Integration Specialist</td>
															<td>New York</td>
															<td>61</td>
															<td>2012/12/02</td>
														</tr>
														<tr role="row" class="odd">
															<td class="sorting_1">Bruno Nash</td>
															<td>Software Engineer</td>
															<td>London</td>
															<td>38</td>
															<td>2011/05/03</td>
														</tr>
														<tr role="row" class="even">
															<td class="sorting_1">Caesar Vance</td>
															<td>Pre-Sales Support</td>
															<td>New York</td>
															<td>21</td>
															<td>2011/12/12</td>
														</tr>
														<tr role="row" class="odd">
															<td class="sorting_1">Cara Stevens</td>
															<td>Sales Assistant</td>
															<td>New York</td>
															<td>46</td>
															<td>2011/12/06</td>
														</tr>
														<tr role="row" class="even">
															<td class="sorting_1">Cedric Kelly</td>
															<td>Senior Javascript Developer</td>
															<td>Edinburgh</td>
															<td>22</td>
															<td>2012/03/29</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12 col-md-5">
												<div class="dataTables_info" id="DataTables_Table_0_info"
													role="status" aria-live="polite">Showing 1 to 10 of
													57 entries</div>
											</div>
											<div class="col-sm-12 col-md-7">
												<div class="dataTables_paginate paging_simple_numbers"
													id="DataTables_Table_0_paginate">
													<ul class="pagination">
														<li class="paginate_button page-item previous disabled"
															id="DataTables_Table_0_previous"><a href="#"
															aria-controls="DataTables_Table_0" data-dt-idx="0"
															tabindex="0" class="page-link">Previous</a></li>
														<li class="paginate_button page-item active"><a
															href="#" aria-controls="DataTables_Table_0"
															data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
														<li class="paginate_button page-item "><a href="#"
															aria-controls="DataTables_Table_0" data-dt-idx="2"
															tabindex="0" class="page-link">2</a></li>
														<li class="paginate_button page-item "><a href="#"
															aria-controls="DataTables_Table_0" data-dt-idx="3"
															tabindex="0" class="page-link">3</a></li>
														<li class="paginate_button page-item "><a href="#"
															aria-controls="DataTables_Table_0" data-dt-idx="4"
															tabindex="0" class="page-link">4</a></li>
														<li class="paginate_button page-item "><a href="#"
															aria-controls="DataTables_Table_0" data-dt-idx="5"
															tabindex="0" class="page-link">5</a></li>
														<li class="paginate_button page-item "><a href="#"
															aria-controls="DataTables_Table_0" data-dt-idx="6"
															tabindex="0" class="page-link">6</a></li>
														<li class="paginate_button page-item next"
															id="DataTables_Table_0_next"><a href="#"
															aria-controls="DataTables_Table_0" data-dt-idx="7"
															tabindex="0" class="page-link">Next</a></li>
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
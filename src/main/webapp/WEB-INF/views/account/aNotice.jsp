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
<link href="resources/account/css/salaryList.css" rel="stylesheet">

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	
		var data2 =new Array();
		data2.push(${graphList.get(0).year});
		data2.push(${graphList.get(0).quarter});
		data2.push(${graphList.get(1).year});
		data2.push(${graphList.get(1).quarter});
		data2.push(${graphList.get(2).year});
		data2.push(${graphList.get(2).quarter});
		data2.push(${graphList.get(3).year});
		data2.push(${graphList.get(3).quarter});
		
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth()+1;
		var quarter;
		if(month<=3){
			quarter =1;
		}else if(month<=6){
			quarter =2;
		}else if(month<=9){
			quarter =3;
		}else{
			quarter=4;
		}
		console.log(quarter);	
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawVisualization);
	
		function drawVisualization() { 
			var data = google.visualization.arrayToDataTable([
					['분기', '비용', '매출','순이익'],
					[year+'/'+quarter +"분기" ,  data2[0],data2[1], (data2[1]-data2[0])],
					[((quarter-1)>0) ? year+'/'+(quarter-1) +"분기" : (year-1)+'/4' +"분기",  data2[2],data2[3], (data2[3]-data2[2])],
					[((quarter-2)>0) ? year+'/'+(quarter-2) +"분기" : (year-1)+'/4' +"분기",  data2[4],data2[5], (data2[5]-data2[4])],
					[((quarter-3)>0) ? year+'/'+(quarter-3) +"분기" : (year-1)+'/4' +"분기",  data2[6],data2[7], (data2[7]-data2[6])],
					
				]);
			var options = {
					title : '분기별 매출/비용 동향',
					vAxis: {title: '액수'},
					hAxis: {title: '분기'}, 
					seriesType: 'bars',
					series: {2: {type: 'line'}}
				};
			
			var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
			chart.draw(data, options);
		}
	</script>

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
						<li class="breadcrumb-item"><a href="acnoticeList.wo">총무회계</a></li>
						<li class="breadcrumb-item active"><a href="acnoticeList.wo">공지사항</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->
	
			<div class="container-fluid">
				<div class="row">
				
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">회계 공지사항</h4>
								<div class="row">
					<div id="chart_div" style="height: 300px; width: 100%;">
					</div>
				</div>
								<div class="table-responsive">
									<div id="DataTables_Table_0_wrapper"
										class="dataTables_wrapper container-fluid dt-bootstrap4">
										<div class="row">
											<div class="col-sm-12 col-md-6">총 게시글 갯수 : ${ pi.listCount }
											</div>
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
													class="table table-bordered zero-configuration dataTable"
													id="DataTables_Table_0" role="grid"
													aria-describedby="DataTables_Table_0_info">
													<thead>
														<tr role="row">
															<th style="width: 70px; text-align: center;">공지 번호</th>
															<th rowspan="1" colspan="1"
																style="width: 446px; text-align: center;">제목</th>
															<th rowspan="1" colspan="1"
																style="width: 111px; text-align: center;">게시자</th>
															<th rowspan="1" colspan="1"
																style="width: 69px; text-align: center;">등록일</th>
														</tr>
													</thead>

													<tbody>
														<c:forEach items="${ list }" var="i">
															<tr role="row" class="odd">
																<td class="sorting_1">${ i.noticeNum }</td>
																<td>${ i.noticeTitle }</td>
																<td>${ i.empName }</td>
																<td>${ i.noticeDate }</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
										<div align="right" style="padding-right: 50px; padding-top: 10px;">
											<button type="button" class="btn mb-1 btn-outline-warning"  onclick="location.href='aninsertpage.wo'"
											 style="border-radius: 5px; width:10em;">
												<strong>공지사항 등록</strong>
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
															<c:url value="acnoticeList.wo" var="before">
																<c:param name="page"
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
																<c:url value="acnoticeList.wo" var="page">
																	<c:param name="page" value="${ p }" />
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
															<c:url value="acnoticeList.wo" var="next">
																<c:param name="page"
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
	<script src="resources/account/js/aNotice.js"></script>
	
</body>
</html>
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

<style>
.level-2 {
	padding-left: 30px;
}

.level-3 {
	padding-left: 60px;
}
</style>

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
						<li class="breadcrumb-item active"><a href="mngEmpChart.wo">인사관리</a></li>
						<li class="breadcrumb-item active"><a href="mngEmpChart.wo">조직관리</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h5>부서 추가/수정/삭제</h5>
								<br>
								<form action="updateDept.wo" method="post">
									<button type="submit" class="btn mb-1 btn-rounded btn-warning">저장</button>
									<br> <br>
									<div class="table-responsive">
										<table class="table">
											<colgroup>
												<col>
											</colgroup>
											<tbody class="org">
											<c:forEach items="${ list }" var="d"></c:forEach>
												<tr class="level-1">
													<th scope="row" style="width: 300px;">${ d.deptName }</th>
													
													<c:forEach items="${ eList }" var="e" varStatus="status">
														<c:if test="${ e.deptNum eq d.deptNum }">
															<td><input type="text" value="${ e.empName } "></td>
														</c:if>
													</c:forEach>
													
												</tr>

												<tr class="level-2">
													<th scope="row"><span class="level-2">마케팅사업부
															(4)</span></th>
													<td><input type="text" value="강연재, "></td>
												</tr>

												<tr class="level-3">
													<th scope="row"><span class="level-3">영업팀 (2)</span></th>
													<td><input type="text" value="강정학, "></td>
												</tr>
											</tbody>
										</table>
									</div>
								</form>
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
	<script>
		jQuery(document).ready(function() {

			/* Custom jQuery for the example */

			$('#list-html').text($('#org').html());

			$("#org").bind("DOMSubtreeModified", function() {
				$('#list-html').text('');

				$('#list-html').text($('#org').html());

				prettyPrint();
			});
		});
	</script>

</body>
<iframe id="google_esf" name="google_esf"
	src="https://googleads.g.doubleclick.net/pagead/html/r20191003/r20190131/zrt_lookup.html#"
	data-ad-client="ca-pub-2783044520727903" style="display: none;"></iframe>
</html>
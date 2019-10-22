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
						<li class="breadcrumb-item active"><a href="empChart.wo">인사정보</a></li>
						<li class="breadcrumb-item active"><a href="empChart.wo">조직도</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
							<h5>조직도</h5>
								<div class="input-group icons"
									style="width: 200px; float: right;">
									<div class="input-group-prepend">
										<span
											class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"
											id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
									</div>
									<input type="search" class="form-control"
										placeholder="이름, 조직 검색" aria-label="Search Dashboard">
								</div>
								<br>
								<br>
								<br>
								<div class="table-responsive">

									<table class="table">
										<colgroup>
											<col>
										</colgroup>
										<tbody class="org">
											<tr class="level-1">
												<th scope="row" style="width: 300px;">사장 (6)</th>
												<td><span data-toggle="modal" data-target="#basicModal"
													style="cursor: pointer;">민병현</span>
													<div class="modal fade" id="basicModal"
														style="display: none;" aria-hidden="true">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title">직원정보</h5>
																	<button type="button" class="close"
																		data-dismiss="modal">
																		<span>×</span>
																	</button>
																</div>
																<div class="modal-body">
																	<table width="450px" heigh="300px">
																		<tbody>
																			<tr>
																				<td><h5>&nbsp;&nbsp;&nbsp;&nbsp;민병현</h5></td>
																				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사장&gt;</td>
																			</tr>
																			<tr>
																				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일</td>
																				<td>kos8148@naver.com</td>
																			</tr>
																			<tr>
																				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;휴대전화</td>
																				<td>010-2222-2222</td>
																			</tr>
																			<tr>
																				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㅇ</td>
																				<td>ㅇ</td>
																			</tr>
																			<tr>
																				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㅇ</td>
																				<td>ㅇ</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal">Close</button>
																	<button type="button" class="btn btn-primary">Send
																		Email</button>
																</div>
															</div>
														</div>
													</div></td>
											</tr>

											<tr class="level-2">
												<th scope="row"><span class="level-2">마케팅사업부 (4)</span></th>
												<td><span data-toggle="modal" data-target="#basicModal"
													style="cursor: pointer;">강연재</span>
													<div class="modal fade" id="basicModal"
														style="display: none;" aria-hidden="true">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title">직원정보</h5>
																	<button type="button" class="close"
																		data-dismiss="modal">
																		<span>×</span>
																	</button>
																</div>
																<div class="modal-body">
																	<table width="450px" height="300px">
																		<tbody>
																			<tr>
																				<td><h5>&nbsp;&nbsp;&nbsp;&nbsp;민병현</h5></td>
																			</tr>
																			<tr>
																				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사장&gt;</td>
																			</tr>
																			<tr>
																				<td></td>
																			</tr>
																			<tr>
																				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일</td>
																				<td>kos8148@naver.com</td>
																			</tr>
																			<tr>
																				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;휴대전화</td>
																				<td>010-2222-2222</td>
																			</tr>
																			<tr>
																				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㅇ</td>
																				<td>ㅇ</td>
																			</tr>
																			<tr>
																				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㅇ</td>
																				<td>ㅇ</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal">Close</button>
																	<button type="button" class="btn btn-primary">Send
																		Email</button>
																</div>
															</div>
														</div>
													</div></td>
											</tr>

											<tr class="level-3">
												<th scope="row"><span class="level-3">영업팀 (2)</span></th>
												<td><span data-toggle="modal" data-target="#basicModal"
													style="cursor: pointer;">강정학</span>
													<div class="modal fade" id="basicModal"
														style="display: none;" aria-hidden="true">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title">직원정보</h5>
																	<button type="button" class="close"
																		data-dismiss="modal">
																		<span>×</span>
																	</button>
																</div>
																<div class="modal-body">
																	<table width="450px" height="300px">
																		<tbody>
																			<tr>
																				<td><h5>&nbsp;&nbsp;&nbsp;&nbsp;민병현</h5></td>
																			</tr>
																			<tr>
																				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사장&gt;</td>
																			</tr>
																			<tr>
																				<td></td>
																			</tr>
																			<tr>
																				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일</td>
																				<td>kos8148@naver.com</td>
																			</tr>
																			<tr>
																				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;휴대전화</td>
																				<td>010-2222-2222</td>
																			</tr>
																			<tr>
																				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㅇ</td>
																				<td>ㅇ</td>
																			</tr>
																			<tr>
																				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㅇ</td>
																				<td>ㅇ</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal">Close</button>
																	<button type="button" class="btn btn-primary">Send
																		Email</button>
																</div>
															</div>
														</div>
													</div></td>
											</tr>
										</tbody>
									</table>
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
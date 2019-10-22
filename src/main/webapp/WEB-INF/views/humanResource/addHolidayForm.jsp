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
						<li class="breadcrumb-item"><a href="showHoliday.wo">휴가/근태</a></li>
						<li class="breadcrumb-item active"><a href="addHoliday.wo">휴가신청</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h5>휴가 신청하기</h5>
								<br>
								<form action="">
									<div style="padding-left: 30px">
										<button type="submit"
											class="btn mb-1 btn-rounded btn-outline-info">기안하기</button>
										<button type="button"
											class="btn mb-1 btn-rounded btn-outline-danger"
											onclick="location.href='showHoliday.wo';">취소</button>
									</div>
									<div class="table-responsive">
										<div id="DataTables_Table_0_wrapper"
											class="dataTables_wrapper container-fluid dt-bootstrap4">
											<div class="row">
												<div class="col-sm-12">
													<table
														class="table table-bordered zero-configuration dataTable"
														id="DataTables_Table_0" role="grid"
														aria-describedby="DataTables_Table_0_info">

														<tbody>
															<tr>
																<td
																	style="background: #f9f9f9; text-align: center; width: 80px">현황</td>
																<td colspan="3"></td>
															</tr>
															<tr>
																<td style="background: #f9f9f9; text-align: center;">작성자</td>
																<td></td>
																<td
																	style="background: #f9f9f9; text-align: center; width: 80px">사용자</td>
																<td><input type="radio" name="user" value="본인">&nbsp;&nbsp;본인
																	&nbsp;&nbsp;&nbsp; <input type="radio" name="user"
																	value="동료">&nbsp;&nbsp;동료</td>
															</tr>
															<tr>
																<td style="background: #f9f9f9; text-align: center;">신청</td>
																<td>Junior Technical Author</td>
																<td
																	style="background: #f9f9f9; text-align: center; width: 80px">처리</td>
																<td><input type="text" style="width: 250px;">
																	&nbsp;&nbsp;&nbsp; <!-- Button trigger modal --> <a
																	href="" data-toggle="modal" data-target="#basicModal">결제선
																		선택</a> <!-- Modal -->
																	<div class="modal fade" id="basicModal"
																		aria-hidden="true" style="display: none;">
																		<div class="modal-dialog" role="document">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h5 class="modal-title">처리 결재선 선택</h5>
																					<button type="button" class="close"
																						data-dismiss="modal">
																						<span>×</span>
																					</button>
																				</div>
																				<div class="modal-body"></div>
																				<div class="modal-footer">
																					<button type="button" class="btn btn-secondary"
																						data-dismiss="modal">취소</button>
																					<button type="button" class="btn btn-primary">확인</button>
																				</div>
																			</div>
																		</div>
																	</div>
															</tr>
															<tr>
																<td
																	style="background: #f9f9f9; text-align: center; width: 80px">참조</td>
																<td colspan="3"></td>
															</tr>
															<tr>

																<td
																	style="background: #f9f9f9; text-align: center; width: 80px">휴가
																	기간</td>
																<td colspan="3"></td>
															</tr>
															<tr>

																<td
																	style="background: #f9f9f9; text-align: center; width: 80px">종류</td>
																<td colspan="3"></td>
															</tr>
															<tr>

																<td
																	style="background: #f9f9f9; text-align: center; width: 80px">사유</td>
																<td colspan="3"></td>
															</tr>
														</tbody>
													</table>

												</div>
											</div>
										</div>
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

</body>
<iframe id="google_esf" name="google_esf"
	src="https://googleads.g.doubleclick.net/pagead/html/r20191003/r20190131/zrt_lookup.html#"
	data-ad-client="ca-pub-2783044520727903" style="display: none;"></iframe>
</html>
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
				<div class="col p-md-0"></div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h5>직원 등록</h5>
								<br>
								<div class="form-validation">
									<form class="form-valide" action="insertEmp.wo" method="get"
										novalidate="novalidate">

										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="val-username">이름
												<span class="text-danger">*</span>
											</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" id="val-username"
													name="empName" placeholder="이름을 입력하세요." required>
											</div>
										</div>

										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="val-password">비밀번호
												<span class="text-danger">*</span>
											</label>
											<div class="col-lg-6">
												<input type="password" class="form-control"
													id="val-password" placeholder="비밀번호를 입력하세요." required>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-4 col-form-label"
												for="val-confirm-password">비밀번호 확인 <span
												class="text-danger">*</span>
											</label>
											<div class="col-lg-6">
												<input type="password" class="form-control"
													id="val-confirm-password" name="empPwd" required>
											</div>
										</div>

										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="val-currency">부서
												<span class="text-danger">*</span>
											</label>
											<div class="col-lg-1">
												<div class="bootstrap-modal">
													<!-- Button trigger modal -->
													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#exampleModalCenter1">부서
														검색</button>
													<!-- Modal -->
													<div class="modal fade" id="exampleModalCenter1"
														aria-hidden="true" style="display: none;">
														<div class="modal-dialog modal-dialog-centered"
															role="document">
															<div class="modal-content" style="width: 500px;">
																<div class="modal-header">
																	<h5 class="modal-title">부서 검색</h5>
																	<button type="button" class="close"
																		data-dismiss="modal">
																		<span>×</span>
																	</button>
																</div>
																<div class="modal-body">
																	<div class="row">
																		<ul class="nav nav-pills mb-3">
																			<c:forEach items="${ dlist }" var="d">
																				<li class="nav-item"><a class="nav-link"
																					data-toggle="tab" aria-expanded="true" href="">${d.deptName}</a></li>
																			</c:forEach>
																		</ul>
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal">취소</button>
																	<button type="button" class="btn btn-primary"
																		onclick="modalSubmit1();" data-dismiss="modal">완료</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-lg-3">
												<input type="text" class="form-control" id="deptName"
													name="deptName" required>
											</div>
										</div>

										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="val-currency">직급
												<span class="text-danger">*</span>
											</label>
											<div class="col-lg-1">
												<div class="bootstrap-modal">
													<!-- Button trigger modal -->
													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#exampleModalCenter2">직급
														검색</button>
													<!-- Modal -->
													<div class="modal fade" id="exampleModalCenter2"
														aria-hidden="true" style="display: none;">
														<div class="modal-dialog modal-dialog-centered"
															role="document">
															<div class="modal-content" style="width: 500px;">
																<div class="modal-header">
																	<h5 class="modal-title">직급 검색</h5>
																	<button type="button" class="close"
																		data-dismiss="modal">
																		<span>×</span>
																	</button>
																</div>
																<div class="modal-body">
																	<div class="row">
																		<ul class="nav nav-pills mb-3">
																			<c:forEach items="${ glist }" var="g">
																				<li class="nav-item"><a class="ab nav-link"
																					data-toggle="tab" aria-expanded="true" href="">${g.gradeName}</a></li>
																			</c:forEach>
																		</ul>
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal">취소</button>
																	<button type="button" class="btn btn-primary"
																		onclick="modalSubmit2();" data-dismiss="modal">완료</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-lg-3">
												<input type="text" class="form-control" id="gradeName"
													name="gradeName" required>
											</div>
										</div>

										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="val-phoneus">이메일
												<span class="text-danger">*</span>
											</label>
											<div class="col-lg-6">
												<input type="email" class="form-control" id="" name="email"
													placeholder="kkkk@kkkkk.com" required>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="val-digits">휴대전화
												<span class="text-danger">*</span>
											</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" id=""
													name="empPhone" placeholder="010-2222-2222" required>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="val-number">성별
											</label>
											<div class="col-lg-6">
												<input type="radio" id="" name="gender" value="남">&nbsp;&nbsp;남
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
													id="" name="gender" value="여">&nbsp;&nbsp;여
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="birth">생년월일
											</label>
											<div class="col-lg-6">
												<input type="text" min="1960-01-01" max="1999-12-12"
													class="form-control" id="birth" name="birth"
													placeholder="YY/MM/DD 형식">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="val-range">연봉<span
												class="text-danger">*</span>
											</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" id=""
													name="empSalary" placeholder="연봉을 입력하세요." required>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="val-range">급여수령은행
											</label>
											<div class="col-lg-3">
												<input type="text" class="form-control" id="" name="empBank"
													placeholder="급여를 수령할 은행명을 입력하세요.">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="val-range">급여수령계좌
											</label>
											<div class="col-lg-3">
												<input type="text" class="form-control" id=""
													name="empAccount" placeholder="급여를 수령할 계좌번호를 입력하세요.">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="adress1">주소
											</label>
											<div class="col-lg-6">
												<input type="text" class="form-control postcodify_address"
													id="address1" name="address1">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="adress2">상세주소
											</label>
											<div class="col-lg-6">
												<input type="text"
													class="form-control postcodify_extra_info" id="adress2"
													name="address2">
											</div>
										</div>

										<div class="form-group row">
											<div class="col-lg-8 ml-auto">
												<button type="submit" class="btn btn-primary"
													style="float: right;">등록</button>
											</div>
										</div>

									</form>
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

	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".postcodify_address").postcodifyPopUp();
		});

		function modalSubmit1() {

			$("#deptName").val($(".active").text());
		}
		
		function modalSubmit2() {

			$("#gradeName").val($("a.ab.nav-link.active").text());
		}
	</script>

</body>
<iframe id="google_esf" name="google_esf"
	src="https://googleads.g.doubleclick.net/pagead/html/r20191003/r20190131/zrt_lookup.html#"
	data-ad-client="ca-pub-2783044520727903" style="display: none;"></iframe>
</html>
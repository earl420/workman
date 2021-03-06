<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>내 정보</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
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
								<h5>내 정보</h5>
								<br>
								<div class="form-validation">
									<form class="form-valide" action="empUpdate.wo" method="post">
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="num">사번
												<span class="text-danger"></span>
											</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" id="num"
													name="num" value="${ loginMan.num }" readonly>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="name">이름
												<span class="text-danger"></span>
											</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" id="name"
													name="name" value="${ loginMan.name }" readonly>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="enrollDate">입사일
												<span class="text-danger"></span>
											</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" id="enrollDate"
													name="enrollDate" value="${ loginMan.enrollDate }" readonly>
											</div>
										</div>
										
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="birth">생년월일
											</label>
											<div class="col-lg-6">
												<input type="text" min="1960-01-01" max="1999-12-12" class="form-control" id="birth"
													name="birth" value="${ loginMan.birth }" readonly>
											</div>
										</div>
										
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="dept">소속
												<span class="text-danger"></span>
											</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" id="dept"
													name="deptName" value="${ loginMan.deptName }" readonly>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="grade">직위
												<span class="text-danger"></span>
											</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" id="grade"
													name="gradeName" value="${ loginMan.gradeName }" readonly>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="email">이메일
												<span class="text-danger"></span>
											</label>
											<div class="col-lg-6">
												<input type="email" class="form-control" id="email"
													name="email"  value="${ loginMan.email }">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="phone">휴대전화
												<span class="text-danger"></span>
											</label>
											<div class="col-lg-6">
												<input type="text" class="form-control" id="phone"
													name="phone" value="${ loginMan.phone }">
											</div>
										</div>
										<!-- <div class="form-group row">
											<label class="col-lg-4 col-form-label" for="val-number">성별
											</label>
											<div class="col-lg-6">
												<input type="radio" id=""
													name="gender" value="남">&nbsp;&nbsp;남 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="radio" id=""
													name="gender" value="여">&nbsp;&nbsp;여
											</div>
										</div> -->
										
										
										<%-- <c:if test="${ empty loginMan.address }">
											<div class="form-group row">
												<label class="col-lg-4 col-form-label" for="birth">생년월일
												</label>
												<div class="col-lg-6">
													<input type="date" class="form-control" id="birth"
														name="birth" value="1000-01-01">
												</div>
											</div>											
										</c:if> --%>
										
										<c:if test="${ empty loginMan.address }">
											<div class="form-group row">
												<label class="col-lg-4 col-form-label" for="adress1">주소
												</label>
												<div class="col-lg-6">
													<input type="text" class="form-control postcodify_address" id="adress1"
														name="address1">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-lg-4 col-form-label" for="adress2">상세주소
												</label>
												<div class="col-lg-6">
													<input type="text" class="form-control postcodify_extra_info" id="adress2"
														name="address2">
												</div>
											</div>
										</c:if>
										<c:if test="${ !empty loginMan.address }">
											<c:forTokens items="${ loginMan.address }" delims="," var="addr" varStatus="status">
												<c:if test="${ status.index eq 0 }">
													<div class="form-group row">
														<label class="col-lg-4 col-form-label" for="adress1">주소
														</label>
														<div class="col-lg-6">
															<input type="text" class="form-control postcodify_address" id="adress1"
																name="address1" value="${ addr }">
														</div>
													</div>
												</c:if>
												<c:if test="${ status.index eq 1 }">
													<div class="form-group row">
														<label class="col-lg-4 col-form-label" for="adress2">상세주소
														</label>
														<div class="col-lg-6">
															<input type="text" class="form-control postcodify_extra_info" id="adress2"
																name="address2" value="${ addr }">
														</div>
													</div>
												</c:if>
											</c:forTokens>
										</c:if>
										<div class="form-group row">
											<div class="col-lg-8 ml-auto">
												<button type="submit" class="btn btn-primary">저장</button>
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
	<script>
		$(function(){
			$(".postcodify_address").postcodifyPopUp();
		});
		
		/* function appendYear(){
			var date = new Date();
			var year = date.getFullYear();
			var selectValue = document.getElementById("year");
			var optionIndex = 0;
			for(var i=year-100;i<=year;i++){
				selectValue.add(new Option(i+"년",i),optionIndex++);                        
			}
		}

		function appendMonth(){
			var selectValue = document.getElementById("month"); 
			var optionIndex = 0;
			for(var i=1;i<=12;i++){
				selectValue.add(new Option(i+"월",i),optionIndex++);
			}
		}
		
		function appendDay(){
			var selectValue = document.getElementById("day");
			var optionIndex = 0;
			for(var i=1;i<=31;i++){
			selectValue.add(new Option(i+"일",i),optionIndex++);
			}
		}  */

	</script>

</body>
<iframe id="google_esf" name="google_esf"
	src="https://googleads.g.doubleclick.net/pagead/html/r20191003/r20190131/zrt_lookup.html#"
	data-ad-client="ca-pub-2783044520727903" style="display: none;"></iframe>
</html>
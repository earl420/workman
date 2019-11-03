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
						<li class="breadcrumb-item active"><a href="mngEmpChart.wo">인사관리</a></li>
						<li class="breadcrumb-item active"><a href="mngUser.wo">사용자관리</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h5>사용자 관리</h5>
								<br>
								<button type="button" class="btn mb-1 btn-rounded btn-warning"
									onclick="location.href='addEmpForm.wo';">사용자 추가</button>
								<div class="input-group icons"
									style="width: 200px; float: right;">
									<div class="input-group-prepend">
										<span
											class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"
											id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
									</div>
									<input type="search" class="form-control" placeholder="이름 검색"
										aria-label="Search Dashboard">
								</div>
								<br> <br>
								<div class="form-group row">
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
															<button type="button" class="close" data-dismiss="modal">
																<span>×</span>
															</button>
														</div>
														<div class="modal-body">
															<div class="row">
																<ul class="nav nav-pills mb-3">
																	<c:forEach items="${ dlist }" var="d">
																		<li class="nav-item"><a class="nav-link"
																			data-toggle="tab" aria-expanded="true" href="">${d.deptName}</a></li>
																		<input type="hidden" id="dd" name="dd" value="${ d.deptName }">
																	</c:forEach>
																</ul>
															</div>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">취소</button>
															<button type="button" class="btn btn-primary" id="btn"
																onclick="modalSubmit1();" data-dismiss="modal">완료</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-3">
										<input type="text" class="form-control" id="a">
									</div>
								</div>
								<div>소속 직원 수 : <label id="count"></label></div>
								
								<table class="table header-border">
									<thead>
										<tr style="background: #f9f9f9;">
											<th scope="col" style="width: 100px;">이름</th>
											<th scope="col" style="width: 130px;">ID</th>
											<th scope="col">휴대전화</th>
											<th scope="col">소속</th>
											<th scope="col">직위</th>
											<th scope="col">입사일</th>
											<th scope="col">수정하기</th>
										</tr>
									</thead>
									<tbody id="tbody">

									</tbody>
								</table>
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
		function modalSubmit1() {

			$("#a").val($(".nav-item>.active").text());
		}
		
		$("#btn").on("click", function(){
			
			elistByName();
			
		});
		
		//$('#updateBtn').on("click", function(){
		$("#tbody").on("click", ".updateBtn", function(){
			var empNum = $(this).parent().parent().children().eq(1).text();
			var updateDeptName = $(this).parent().parent().children().eq(3).children().val();
			var updateGradeName = $(this).parent().parent().children().eq(4).children().val();
			
			$.ajax({
				url : "updateEmp.wo",
				data : {empNum : empNum, deptName : updateDeptName, gradeName : updateGradeName},
				success:function(data){
					
					if(data=="success"){
					alert("부서/직급 수정 성공");
					elistByName();
					}else{
						alert("부서/직급 수정 실패");
					}
					
				},
				error:function(){
					alert("ajax 통신실패");
				}
			});
		});
		
		function elistByName(){
			
			var deptName = $("#a").val();
			
			$.ajax({
				
				url : "elistByName.wo",
				data : {deptName : deptName},
				dataType : "json",
				success : function(data){
					
					console.log(data);
					
					getlist(data);
					
				},
				error : function(){
					console.log("ajax 통신 실패");
				}
			});
		}
		
		function getlist(data){
			
			$.ajax({
				url:"dlist.wo",
				dataType : "json",
				success: function(dlist){
					console.log(dlist);
					console.log(data);
					
					var $tbody = $("#tbody");
					$tbody.html("");
					
					if(data.length > 0){
						
						$("#count").text(data.length);
						$.each(data,function(index, value){
							
							var $tr = $('<tr>');
							var $td = $('<td>' + value.empName + '</td><td id="empNum">' + value.empNum + '</td><td>' + value.empPhone + '</td>');
							var $td1 = $('<td>');
							var $select = $('<select id="select" name="deptName">');
							
							
							$.each(dlist, function(index, v){
								
								var $td2 = $('<option value="'+ v.deptName +'">'+ v.deptName +'</option></select></td>');
	/* 							var $td3 = $('</select></td>"<td><input type="text" id="gradeName" value="' + value.gradeName + '"></td><td>' + value.enrollDate + '</td><td><input type="button" value="수정하기" class="btn mb-1 btn-warning updateBtn" style="height: 20px; padding-top: 0"></td></tr>');
	 */							
								$tbody.append($tr).append($td).append($select.append($td2));
							});
						});
					}else{
						
						$tbody.append('<td colspan="6">등록된 직원이 없습니다.</td>');
					}
				},
				error : function(){
					console.log("ajax 통신실패2");
				}
				
			});
			
		}
	</script>

</body>
<iframe id="google_esf" name="google_esf"
	src="https://googleads.g.doubleclick.net/pagead/html/r20191003/r20190131/zrt_lookup.html#"
	data-ad-client="ca-pub-2783044520727903" style="display: none;"></iframe>
</html>
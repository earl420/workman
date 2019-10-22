<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="resources/plugins/tables/css/datatable/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<meta charset="UTF-8">
<script type="text/javascript" src="resources/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.tab-content div ul li {
	display: inline-table;
}

.box_from ul li {
	display: inline-table;
	padding: 0px;
}

.box_from ul {
	padding: 0px;
}
</style>
</head>
<body>
	<div id="main-wrapper">
		<c:import url="../common/header.jsp" />
		<div class="content-body" style="min-height: 884px;">
			<div class="container-fluid">
				<!-- row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="bootstrap-modal">
									<!-- Button trigger modal -->
									<button type="button" class="btn mb-1 btn-rounded btn-success"
										data-toggle="modal" data-target="#exampleModalCenter" id="select">
										<span class="btn-icon-left"> <i
											class="fa fa-share-alt color-secondary"></i>
										</span>결제자선택
									</button>
									<!-- Modal -->
									<div class="modal fade" id="exampleModalCenter"
										style="display: none;" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered"
											role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">직원선택</h5>
													<button type="button" class="close" data-dismiss="modal">
														<span>×</span>
													</button>
												</div>
												<div class="col-md-12">
													<div class="modal-body">
														<div class="row"id="deptList">
															<ul class="nav nav-pills mb-3">
																<li class="nav-item"><a href="#navpills-1"
																	class="nav-link active show" data-toggle="tab"
																	aria-expanded="true">전체직원</a></li>
																<li class="nav-item"><a href="#navpills-2"
																	class="nav-link" data-toggle="tab"
																	aria-expanded="false">인사과</a></li>
																<li class="nav-item"><a href="#navpills-3"
																	class="nav-link" data-toggle="tab"
																	aria-expanded="false">총무과</a></li>
																<li class="nav-item"><a href="#navpills-4"
																	class="nav-link" data-toggle="tab"
																	aria-expanded="false">품질부서</a></li>
																<li class="nav-item"><a href="#navpills-5"
																	class="nav-link" data-toggle="tab"
																	aria-expanded="false">국내영업</a></li>
																<li class="nav-item"><a href="#navpills-6"
																	class="nav-link" data-toggle="tab"
																	aria-expanded="false">해외영업</a></li>
																<li class="nav-item"><a href="#navpills-7"
																	class="nav-link" data-toggle="tab"
																	aria-expanded="false">인증부서</a></li>
																<li class="nav-item"><a href="#navpills-8"
																	class="nav-link" data-toggle="tab"
																	aria-expanded="false">연구소</a></li>
															</ul>
															<div class="tab-content br-n pn" id="nameList">
																<div id="navpills-1" class="tab-pane active show">
																	<ul>
																			<li><button type="button"
																					class="btn mb-1 btn-rounded btn-outline-primary">강정학</button></li>
																			<li><button type="button"
																					class="btn mb-1 btn-rounded btn-outline-primary">조용준</button></li>
																			<li><button type="button"
																					class="btn mb-1 btn-rounded btn-outline-primary">강연재</button></li>
																			<li><button type="button"
																					class="btn mb-1 btn-rounded btn-outline-primary">양정환</button></li>
																			<li><button type="button"
																					class="btn mb-1 btn-rounded btn-outline-primary">민병현</button></li>
																			<li><button type="button"
																					class="btn mb-1 btn-rounded btn-outline-primary">김사랑</button></li>
																		</ul>
																</div>
																<div id="navpills-2" class="tab-pane">
																	
																		<ul>
																			<li><button type="button"
																					class="btn mb-1 btn-rounded btn-outline-primary">강정학</button></li>
																			<li><button type="button"
																					class="btn mb-1 btn-rounded btn-outline-primary">민병현</button></li>
																			<li><button type="button"
																					class="btn mb-1 btn-rounded btn-outline-primary">강연재</button></li>
																			<li><button type="button"
																					class="btn mb-1 btn-rounded btn-outline-primary">양정환</button></li>
																		</ul>
																	
																</div>
																<div id="navpills-3" class="tab-pane">
																	
																		<ul>
																			<li><button type="button"
																					class="btn mb-1 btn-rounded btn-outline-primary">김사랑</button></li>
																			<li><button type="button"
																					class="btn mb-1 btn-rounded btn-outline-primary">민병현</button></li>
																			<li><button type="button"
																					class="btn mb-1 btn-rounded btn-outline-primary">조용준</button></li>
																			<li><button type="button"
																					class="btn mb-1 btn-rounded btn-outline-primary">양정환</button></li>
																		</ul>
																	
																</div>
															</div>
														</div>
														<div class="member box_from">
															<ul>
																<li class="alert"><button type="button"
																		class="btn mb-1 btn-rounded btn-secondary"
																		data-dismiss="alert" aria-label="Close">
																		강연재 <span><i class="fa fa-close"></i></span>
																	</button></li>
																<li class="alert"><button type="button"
																		class="btn mb-1 btn-rounded btn-secondary"
																		data-dismiss="alert" aria-label="Close">
																		민병현 <span><i class="fa fa-close"></i></span>
																	</button></li>
																<li class="alert"><button type="button"
																		class="btn mb-1 btn-rounded btn-secondary"
																		data-dismiss="alert" aria-label="Close">
																		김사랑 <span><i class="fa fa-close"></i></span>
																	</button></li>
																<li class="alert"><button type="button"
																		class="btn mb-1 btn-rounded btn-secondary"
																		data-dismiss="alert" aria-label="Close">
																		조용준 <span><i class="fa fa-close"></i></span>
																	</button></li>
															</ul>
														</div>

														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">취소</button>
															<button type="button" class="btn btn-primary">완료</button>
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
					<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div id="memberArray">
							
							</div>
							
						</div>
					</div>
					</div>
				</div>

			</div>
			<!-- #/ container -->
		</div>
		<c:import url="../common/footer.jsp" />
	</div>
<script>
	
	$(function getdeptList() {
		$("#select").on("click", function(){
			
			$.ajax({
				url : "empList.wo",
				dataTpy : "json",
				success:function(data){
					console.log(data);
					var $deptList = $("#deptList");
					$deptList.html("");
						$.each(data, function(index, value){
							var $ul = $("<ul class='nav nav-pills mb-3'>");
							var $li = $("<li class='nav-item'>");
							var $a= $("<a class='nav-link active show' data-toggle='tab' aria-expanded='true'>").text(value.deptName).attr("href", '#'+value.deptName);
							
							$li.append($a);
							$ul.append($li);
							$deptList.append($ul);
						});
				},	
				error:function(){
					console.log("ajax 통신실패");
				}
				
			});
			
		})
	}) 
	

</script>
</body>
</html>
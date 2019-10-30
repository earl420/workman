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

.box_from ul li button {
	padding: 7px 15px;
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
										data-toggle="modal" data-target="#exampleModalCenter"
										id="select">
										<span class="btn-icon-left"> <i
											class="fa fa-share-alt color-secondary"></i>
										</span>결제자선택
									</button>
									<!-- Modal -->
									<div class="modal fade" id="exampleModalCenter"
										style="display: none;" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered"
											role="document">
											<div class="modal-content" style="width: 500px;">
												<div class="modal-header">
													<h5 class="modal-title">직원선택</h5>
													<button type="button" class="close" data-dismiss="modal">
														<span>×</span>
													</button>
												</div>
												<div class="col-md-12">
													<div class="modal-body">
														<div class="row" id="deptList">
															<ul class="nav nav-pills mb-3">
																<c:forEach items="${ dlist }" var="d">
																	<li class="nav-item">
																		<a class="nav-link" data-toggle="tab" aria-expanded="true" href="#${d.deptName}">${d.deptName}</a>
																	</li>
																</c:forEach>
															</ul>
														</div>
														<div class="tab-content br-n pn" id="nameList">
															<c:forEach items="${ dlist }" var="d">
																<div class='tab-pane' id="${d.deptName}">
																	<ul class="nav nav-pills mb-3">
																		<c:forEach items="${ mlist }" var="m">
																			<c:if test="${d.deptName eq m.deptName }">
																				<li class="select">
																					<button type='button' class='btn mb-1 btn-rounded btn-outline-primary' value="${m.empNum}" >${m.empName}${m.gradeName}</button>
																				</li> 
																			</c:if>
																			<c:if test="${d.deptName eq '전체부서' }">
																				<li class="select">
																					<button type='button' class='btn mb-1 btn-rounded btn-outline-primary'  value="${m.empNum}" >${m.empName}${m.gradeName}</button>
																				</li>	
																			</c:if>
																		</c:forEach>
																	</ul>
																</div>
															</c:forEach>
														</div>
														<div class="member box_from">
															<ul>
															</ul>
														</div>

														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">취소</button>
															
															<button type="button" class="btn btn-primary" onclick="submit();" data-dismiss="modal" >완료</button>
															
														
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
									<ul>
									</ul>
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
		var empList = new Array();
		$(function(){
			
			$(".select").find("button").on("click" ,function() {
			var emp1 = $(this);
			if(empList.length >= 0 && empList.length < 4){
				 empList.push(emp1.val());
				 emp1.attr("disabled",true);
					 var $ul = $(".member ul");
					var $li = $("<li class='alert'>");
					var $button= $("<button type='button' class='btn mb-1 btn-rounded btn-primary'>").text(emp1.text()).val(emp1.val());
					
						$li.append($button);
						$ul.append($li);
				 
			} 
			else {
				alert("더이상 추가할수 없습니다.");
				
			}console.log(empList);

					$(".alert").find("button").on("click" ,function() {
						var emp2 = $(this).val();
						 
						 for(i=0; i<empList.length; i++){
							 if(empList[i] == emp2){
								 empList.splice(i,1);
								 emp1.attr("disabled",false);
								 $(this).attr("data-dismiss",'alert'); 
								 
							 }
						 }
					});
			});
		});
		
		function submit(){
			 
			$.ajax({
				 url: "submitEmpList.wo",
				 dataType : "json",
				 method : 'POST',
				 data: {"empList" : empList},
				 success : function(data) {
					 console.log(data);
					 var $ul = $("#memberArray ul");
					 $ul.html("");
					 $.each(data,function(index,value) {
						var $li = $("<li>");
						var $button= $("<button type='button' class='btn mb-1 btn-rounded btn-primary'>").text(value.empName + value.gradeName).val(value.empNum);
						$li.append($button);
						$ul.append($li);
					 });
				 },error : function() {
					 console.log("ajax 통신실패");
				 }
			 });
		}
	
	</script>
</body>
</html>
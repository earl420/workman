<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/plugins/clockpicker/dist/jquery-clockpicker.min.css" rel="stylesheet">
<link href="resources/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet">
<meta charset="UTF-8">
<style>
	.box_from ul li{
		display: inline-table;
		margin-bottom : 0px;
	}
	.box_from ul {
		margin-bottom : 0px;
		
	}
	.dataform div{
		display: inline-table;
	}
</style>
<script type="text/javascript" src="resources/se2/js/HuskyEZCreator.js"	charset="utf-8"></script>
<title>전자결재</title>
</head>
<body>
	<div id="main-wrapper">
		<c:import url="../common/header.jsp" />
		<div class="content-body" style="min-height: 884px;">
			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">결제문서등록</a></li>
						<li class="breadcrumb-item"><a href="javascript:void(0)">휴가작성</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->
			<div class="container-fluid">
			<form action="insertHoliday.wo" method="post" encType="multipart/form-data">
				<div class="row">
					<div class="col-lg-12">
					<div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>휴가신청</h4>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                    	<tr>
                                        	<td rowspan="2" align="center" width="10%">결재라인</td>
                                            <td width="10%">
                                           		<div class="bootstrap-modal1">
                                           			<!-- Button trigger modal1 -->
                                            		<button type="button" class="btn mb-1 btn-rounded btn-success"
														data-toggle="modal" data-target="#exampleModalCenter1" style="width: 138px;">
													<span class="btn-icon-left"><i class="fa fa-share-alt color-secondary"></i>
													</span>결제자선택
													</button>
                                            	</div>
                                            	<!-- Modal -->
												<div class="modal fade" id="exampleModalCenter1" style="display: none;" aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered"role="document">
														<div class="modal-content" style="width: 500px;">
															<div class="modal-header">
																<h5 class="modal-title">직원선택</h5>
																<button type="button" class="close" data-dismiss="modal"><span>×</span></button>
															</div>
															<div class="col-md-12">
																<div class="modal-body">
																	<div class="row">
																		<ul class="nav nav-pills mb-3">
																			<c:forEach items="${ dlist }" var="d">
																				<li class="nav-item">
																					<a class="nav-link" data-toggle="tab" aria-expanded="true" href="#${d.deptName}">${d.deptName}</a>
																				</li>
																			</c:forEach>
																		</ul>
																	</div>
																	<div class="tab-content br-n pn">
																		<c:forEach items="${ dlist }" var="d">
																			<div class='tab-pane' id="${d.deptName}">
																				<ul class="nav nav-pills mb-3">
																					<c:forEach items="${ mlist }" var="m">
																						<c:if test="${d.deptName eq m.deptName }">
																							<li class="applicantSelect">
																								<button type='button' class='btn mb-1 btn-rounded btn-outline-primary'  value="${m.empNum}" >${m.empName}${m.gradeName}</button>
																							</li>
																						</c:if>
																						<c:if test="${d.deptName eq '전체부서' }">
																							<li class="applicantSelect">
																							<button type='button' class='btn mb-1 btn-rounded btn-outline-primary' value="${m.empNum}" >${m.empName}${m.gradeName}</button>
																							</li>
																						</c:if>
																					</c:forEach>
																				</ul>
																			</div>
																		</c:forEach>
																	</div>
																	<div class="applicantMember box_from">
																		<ul>
																		</ul>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
																		<button type="button" class="btn btn-primary" onclick="modalSubmit1();" data-dismiss="modal" >완료</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											<!-- Modal -->
                                            </td>
                                            <th  width="80%">
                                            	<div class="applicant box_from" >
                                            		<ul>
                                            		</ul>
                                            	</div>
                                            </th>
                                        </tr>
                                        <tr>
                                        	<td>
                                        	<div class="bootstrap-modal2">
                                        	<!-- Button trigger modal2 -->
                                            		<button type="button" class="btn mb-1 btn-rounded btn-secondary"
														data-toggle="modal" data-target="#exampleModalCenter2"  style="width: 138px;">
													<span class="btn-icon-left"> <i	class="fa fa-share-alt color-secondary"></i>
													</span>참조자선택
													</button>
                                        	</div>
                                     		<!-- Modal -->
												<div class="modal fade" id="exampleModalCenter2" style="display: none;" aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered"role="document">
														<div class="modal-content" style="width: 500px;">
															<div class="modal-header">
																<h5 class="modal-title">직원선택</h5>
																<button type="button" class="close" data-dismiss="modal"><span>×</span></button>
															</div>
															<div class="col-md-12">
																<div class="modal-body">
																	<div class="row">
																		<ul class="nav nav-pills mb-3">
																			<c:forEach items="${ dlist }" var="d">
																				<li class="nav-item">
																					<a class="nav-link" data-toggle="tab" aria-expanded="true" href="#${d.deptName}referrer">${d.deptName}</a>
																				</li>
																			</c:forEach>
																		</ul>
																	</div>
																	<div class="tab-content br-n pn">
																		<c:forEach items="${ dlist }" var="d">
																			<div class='tab-pane' id="${d.deptName}referrer">
																				<ul class="nav nav-pills mb-3">
																					<c:forEach items="${ mlist }" var="m">
																						<c:if test="${d.deptName eq m.deptName }">
																							<li class="referrerSelect">
																								<button type='button' class='btn mb-1 btn-rounded btn-outline-primary' value="${m.empNum}" >${m.empName}${m.gradeName}</button>
																							</li>
																						</c:if>
																						<c:if test="${d.deptName eq '전체부서' }">
																							<li class="referrerSelect">
																							<button type='button' class='btn mb-1 btn-rounded btn-outline-primary' value="${m.empNum}"  >${m.empName}${m.gradeName}</button>
																							</li>
																						</c:if>
																					</c:forEach>
																				</ul>
																			</div>
																		</c:forEach>
																	</div>
																	<div class="referrerMember box_from">
																		<ul>
																		</ul>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
																		<button type="button" class="btn btn-primary" onclick="modalSubmit2();" data-dismiss="modal" >완료</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											<!-- Modal -->   	
                                            </td>
                                            <th>
                                            	<div class="referrer box_from">
                                            		<ul>
                                            		</ul>
                                            	</div>
                                            </th>
                                        </tr>
										<tr>
											<td align="center">휴가일시</td>
											<td colspan="2">
												<div class="dataform">
													<div id="date-range" class="input-daterange" align="center" > 
														<label>날짜선택</label> <br>
                                                		<input type="text" class="form-control" name="daterangepicker_start"  style="display:inline-table; width:200px;"> <span class="input-group-addon bg-info b-0 text-white">~</span>
                                                		<input type="text" class="form-control" name="daterangepicker_end" style="display:inline-table; width:200px;">
                                            		</div>
													<div align="center"> 
														<label>휴가종류</label><br>
														<select name="holiType"	 style="width:100px; height:45px; min-height: 30px;">
															<option value="개인사유">개인사유</option>
															<option value="훈련">훈련</option>
															<option value="경조사">경조사</option>
														</select>
													</div>
												</div>
											</td>
										</tr>
										<tr>
                                        	<td align="center" >파일첨부</td>
                                        	<td>
                                        		<label class="btn mb-1 btn-rounded btn-primary" for="file-input">
                                        			<span class="btn-icon-left"><i class="fa fa-upload color-success"></i> 
                                        		</span>Upload</label>
                                        		<input id='file-input' type='file' name="file" style= "display:none;">
                                        	</td>
                                        	<th>
                                        		<div class="files box_from">
                                            		<ul id="fileName">
                                   						
                                            		</ul>
                                            	</div>
                                        	</th>
										</tr>
										<tr>
                                        	<td colspan="7" align="center">
                                        		<button type="submit" id="saveBtn" class="btn mb-1 btn-outline-primary btn-lg">&nbsp;등록 &nbsp;</button> &nbsp;&nbsp;
                                        		<button type="reset" onclick="location.href='allList.wo'" class="btn mb-1 btn-outline-primary btn-lg">&nbsp;취소&nbsp;</button> &nbsp;&nbsp;
                                        	</td>
										</tr>                                                                                 	
                                           
                                    </table>
                                </div>
                            </div>
                        </div>
					</div>
				</div>
			</form>
			</div>
		</div>
		
		
		<c:import url="../common/footer.jsp"></c:import>
	</div>
	
	<script src="resources/plugins/moment/moment.js"></script>
	<script	src="resources/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
	<script	src="resources/plugins/clockpicker/dist/jquery-clockpicker.min.js"></script>
	<script	src="resources/plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>
	<script src="resources/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script>
		$(function() {
	    	$('#date-range').datepicker({
	        	toggleActive: true
	    	});
		})
	
</script>

<script>
	var fileInput = document.getElementById('file-input');
  		fileInput.addEventListener('change', function(event) {
  			
    		var input = event.target;
      		var $ul = $(".files ul");
      		 $ul.html("");
			var $li = $("<li>");
			 $button= $("<button type='button' class='btn mb-1 btn-rounded btn-primary'>").text(input.files[0].name);
				$li.append($button);
				$ul.append($li);
    		
    		
  }); /* 파일 추가  */
  
  var empList = new Array();
  var empList2 = new Array();
	$(function(){
		$(".applicantSelect").find("button").on("click" ,function() {
		var emp1 = $(this);
		console.log(emp1.val());
		if(empList.length >= 0 && empList.length < 4){
			 empList.push(emp1.val());
			 emp1.attr("disabled",true);
				 var $ul = $(".applicantMember ul");
				var $li = $("<li class='applicantList alert'>");
				var $button= $("<button type='button' class='btn mb-1 btn-rounded btn-primary'>").text(emp1.text()).val(emp1.val());
				
					$li.append($button);
					$ul.append($li);
			 
		}
		else {
			alert("더이상 추가할수 없습니다.");
			
		}

				$(".applicantList").find("button").on("click" ,function() {
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
	
	function modalSubmit1(){
		 
		$.ajax({
			 url: "submitEmpList5.wo",
			 dataType : "json",
			 method : 'POST',
			 data: {"empList" : empList},
			 success : function(data) {
				 console.log(empList);
				
				 var $ul = $(".applicant ul");
				 $ul.html("");
				 $.each(data,function(index,value) {
					var $li = $("<li>");
					var $input = $("<input type='hidden' name='applicant'>").val(value.empNum);
					var $button= $("<button type='button' class='btn mb-1 btn-rounded btn-success'>").text(value.empName + value.gradeName).val(value.empNum);
					$li.append($button);
					$li.append($input);
					$ul.append($li);
				 });
			 },error : function() {
				 console.log("ajax 통신실패");
			 }
		 });
	}
	
	$(function(){
		
		$(".referrerSelect").find("button").on("click" ,function() {
		var emp3 = $(this);
		if(empList2.length >= 0 && empList2.length < 4){
			 empList2.push(emp3.val());
			 emp3.attr("disabled",true);
				 var $ul = $(".referrerMember ul");
				var $li = $("<li class='referrerList alert'>");
				var $button= $("<button type='button' class='btn mb-1 btn-rounded btn-primary'>").text(emp3.text()).val(emp3.val());
				
					$li.append($button);
					$ul.append($li);
			 
		}
		else {
			alert("더이상 추가할수 없습니다.");
			
		} console.log(empList2);

				$(".referrerList").find("button").on("click" ,function() {
					var emp4 = $(this).val();
					 
					 for(i=0; i<empList2.length; i++){
						 if(empList2[i] == emp4){
							 empList2.splice(i,1);
							 emp3.attr("disabled",false);
							 $(this).attr("data-dismiss",'alert'); 
							 
						 }
					 }
				});
		});
	});
	
	function modalSubmit2(){
		 
		$.ajax({
			 url: "submitEmpList6.wo",
			 dataType : "json",
			 method : 'POST',
			 data: {"empList2" : empList2},
			 success : function(data) {
				 console.log(data);
				 var $ul = $(".referrer ul");
				 $ul.html("");
				 $.each(data,function(index,value) {
					var $li = $("<li>");
					var $input = $("<input type='hidden' name='referrer'>").val(value.empNum);
					var $button= $("<button type='button' class='btn mb-1 btn-rounded btn-secondary'>").text(value.empName + value.gradeName).val(value.empNum);
					$li.append($button);
					$li.append($input);
					$ul.append($li);
				 });
			 },error : function() {
				 console.log("ajax 통신실패");
			 }
		 });
	}

		$(function(){
			console.log("${empName}");
			if("${empName}" !=null|| "${empName}"!=""){
				$('#ir1').val("${empName}"+" "+"${empNum}");
			}
			
		})
</script>
</body>
</html>
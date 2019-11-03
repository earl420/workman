<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<meta charset="UTF-8">
<title>전자결재</title>
</head>
<body>
	<div id="main-wrapper">
		<c:import url="../common/header.jsp" />
		<div class="content-body" style="min-height: 884px;">
			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">결제요청문서</a></li>
						<li class="breadcrumb-item active"><a href="javascript:void(0)">휴가</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<!-- 사이즈 설정   -->
						<div class="card">
							<div class="card-body">
								<div class="card-title">
									<h4>휴가 승인리스트</h4>
								</div>
								<div class="col-sm-12 col-md-6">총 문서 갯수 : 	${ pi.listCount }
								</div>
								<div class="table-responsive">
									<table class="table" id="listArea">
										<thead>
											<tr>
												<th width="15%" style="text-align: center;">문서번호</th>
												<th width="10%" style="text-align: center;">문서종류</th>
												<th  style="text-align: center;">제목</th>
												<th width="15%" style="text-align: center;">진행상황</th>
												<th width="15%" style="text-align: center;">등록일</th>
												<th width="15%" style="text-align: center;">작성자</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${ doclist }" var="d">
											<tr>
												<td align="left">${ d.docNum }</td>
												<c:set var = "name" value ="${d.docNum }" />
												<td align="left">휴가</td>
												
												<td align="left">${ d.docTitle }</td>
												
												<c:choose>
													<c:when test="${loginMan.num eq d.confirmEmp1 and d.confirmDate1 eq null}">
														<td align="center"><span class="label label-danger">승인대기</span></td>
													</c:when>
													<c:when test="${loginMan.num eq d.confirmEmp1 and d.confirmDate1 ne null}">
														<td align="center"><span class="label label-danger">승인완료</span></td>
													</c:when>
													<c:when test="${loginMan.num eq d.confirmEmp2 and d.confirmDate2 eq null}">
														<td align="center"><span class="label label-danger">승인대기</span></td>
													</c:when>
													<c:when test="${loginMan.num eq d.confirmEmp2 and d.confirmDate2 eq null}">
														<td align="center"><span class="label label-danger">승인완료</span></td>
													</c:when>
													<c:when test="${loginMan.num eq d.confirmEmp3 and d.confirmDate3 ne null}">
														<td align="center"><span class="label label-danger">승인대기</span></td>
													</c:when>
													<c:when test="${loginMan.num eq d.confirmEmp3 and d.confirmDate3 eq null}">
														<td align="center"><span class="label label-danger">승인완료</span></td>
													</c:when>
													<c:when test="${loginMan.num eq d.confirmEmp4 and d.confirmDate4 ne null}">
														<td align="center"><span class="label label-danger">승인대기</span></td>
													</c:when>
													<c:when test="${loginMan.num eq d.confirmEmp4 and d.confirmDate4 eq null}">
														<td align="center"><span class="label label-danger">승인완료</span></td>
													</c:when>
													
												</c:choose>
												
												<td align="center">${ d.docDate }</td>
												
												<td align="center">${ d.docEmpName }${ d.docGradeName }</td>
											</tr>
										</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="3" align="center">
												<div class="bootstrap-pagination">
														<nav>
															<ul class="pagination justify-content-end">
															<!-- 이전 -->
																<c:if test="${ pi.currentPage eq 1 }">
																	<li class="page-item disabled"><a class="page-link"	>이전</a></li>
																</c:if>
																<c:if test="${ pi.currentPage ne 1 }">
																	<c:url value="holiDayRequestList.wo" var="page">
																		<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
																	</c:url>
																	<li class="page-item" data-dt-idx="${ page }" tabindex="0" ><a class="page-link" href="${ page }">이전</a></li>
																</c:if>
															
															<!-- 번호들 -->
																<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
																	<c:if test="${ p eq pi.currentPage }">
																		<li  class="page-item disabled" data-dt-idx="1" tabindex="0" ><a class="page-link">${ p }</a></li>
																	</c:if>
																	
																	<c:if test="${p ne pi.currentPage }">
																		<c:url value="holiDayRequestList.wo" var="page">
																			<c:param name="currentPage" value="${ p }"/>
																		</c:url>
																		<li class="page-item" data-dt-idx="${ page }" tabindex="0" ><a class="page-link" href="${ page }">${ p }</a></li>
																	</c:if>
																</c:forEach>
																
																<!-- [다음] -->
																<c:if test="${ pi.currentPage eq pi.maxPage }">
																	<li class="page-item disabled"><a class="page-link">다음</a></li>
																</c:if>
																<c:if test="${ pi.currentPage ne pi.maxPage }">
																	<c:url value="holiDayRequestList.wo" var="next">
																		<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
																	</c:url>
																	<li class="page-item" data-dt-idx="${ page }" tabindex="0" ><a class="page-link" href="${ next }">다음</a></li>
																</c:if>
															</ul>
														</nav>
													</div>
												</td>
												<th colspan="3">
												<div>
													<div style="display: inline-block;">													
														<select name="" aria-controls="DataTables_Table_0" style=" height:26px; min-height: 26px;" class="form-control form-control-sm">
															<option value="10">선택</option>
															<option value="25">문서종류</option>
															<option value="50">내용</option>
															<option value="100">작성자</option>
														</select>
													</div>
													<div style="display: inline-block;">	
														<input type="text">
													</div>
													<div style="display: inline-block;">	
														<button class="btn mb-1 btn-rounded btn-outline-dark">검색</button>
													</div>
												</div>
												</th>
											</tr>
											
										</tfoot>
										
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<c:import url="../common/footer.jsp"></c:import>
	</div>
	<script>
	$(function(){
		
		$("#listArea").find("td").mouseenter(function() {
			$(this).parent().css({
				"cursor" : "pointer"
			});
		}).click(function(){
			var docNum=$(this).parent().children().eq(0).text();
			//var DRAFT = "DRAFT";
			//var DRAFT = "EXPENSE";
			//var DRAFT = "HOLI";
			//var DRAFT = "REQ";
			console.log(docNum);
			
			if(docNum.indexOf("DRAFT") != -1) {
				
				location.href="draftDetail.wo?draftNum="+docNum;
			}else if(docNum.indexOf("EXPENSE") != -1){
				
				location.href="expenseDetail.wo?expenseNum="+docNum;
			}else if(docNum.indexOf("HOLI") != -1){
				
				location.href="holiDayDetail.wo?holiNum="+docNum;
			}else if(docNum.indexOf("REQ") != -1){
				
				location.href="requestDetail.wo?requestNum="+docNum;
			}
			

		});
		
	})

	</script>
</body>
</html>
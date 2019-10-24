<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/account/css/detailNotice.css" rel="stylesheet">
<script type="text/javascript" src="resources/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50"> <circle
					class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3"
					stroke-miterlimit="10" /> </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper" style="background: white;">
		<c:import url="../common/header.jsp"></c:import>
		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">

			<div class="content-fluid">
				<div class="row">
					<div class="table-responsive col-12"
						style="text-align: center; padding-left: 50px; padding-right: 50px;">
						<h3 style="padding-top: 40px; padding-bottom: 10px;">회계 상세 조회</h3>
						<br />
						<form action="">
							<div class="form-group row" style="padding-left: 30px;">
								<label class="col-lg-2 col-form-label" for="title">제목</label>
								<div class="col-lg-8">
									<p class="form-group">${notice.noticeTitle }</p>
								</div>
							</div>
							<div class="form-group row" style="padding-left: 30px;">
								<label class="col-lg-2 col-form-label" for="title">공지유형</label>
								<div class="col-lg-2">
									<p class="form-group">
										<c:choose>
											<c:when test="${notice.noticeAccType eq 1 }">일반공지</c:when>
											<c:when test="${notice.noticeAccType eq 2}">재무상태표</c:when>
											<c:otherwise>손익계산서</c:otherwise>
										</c:choose>
									</p>
								</div>
							</div>
							<div class="form-group row" style="padding-left: 30px;">
								<label class="col-lg-2 col-form-label" for="title">파일</label><br />
								<div class="col-lg-2">
									<c:url var="downexcel" value="downexcel.wo">
										<c:param name="noticeNum" value="${notice.noticeNum }" />
										<c:param name="noticeContent" value="${notice.noticeContent}" />
										<c:param name="noticeAccType" value="${notice.noticeAccType }" />
									</c:url>
									<c:choose>
										<c:when test="${notice.noticeAccType eq 2 }"><a href="${downexcel }">excel다운로드</a></c:when>
										<c:when test="${notice.noticeAccType eq 3}"><a href="${downexcel }">excel다운로드</a></c:when>
										<c:otherwise><a href="경로+저장된파일명" download="다운로드될 파일명">filedownload</a></c:otherwise>
									</c:choose>
									
								</div>
							</div>
							<p align="left" style="padding-left: 8%; padding-bottom:40px;">
								<label>본문</label>
							</p>
							<c:choose>
								<c:when test="${notice.noticeAccType eq 2}">
									<div class="form-group row" style="padding-left: 30px;">
										<div class="col-2"></div>
										<div class="col-8">
											<div class="card">
												<div class="card-body">
													<h4 class="cart-title">${notice.noticeTitle }</h4>
													<div class="table-responsive">
														 <table class="table table-striped table-bordered zero-configuration">
														 	<thead>
														 		<tr>
														 			<td width="25%">계정과목</td>
														 			<td width="25%">금액</td>
														 			<td width="25%">계정과목</td>
														 			<td width="25%">금액</td>
														 		</tr>
														 	</thead>
														 	<tbody id="accountStatus">
														 	</tbody>
														 </table>
													</div>
												</div>
											</div>										
										</div>
										<div class="col-2"></div>
									</div>
								</c:when>
								<c:when test="${notice.noticeAccType eq 3}">
									<div class="form-group row" style="padding-left: 30px;">
									<div class="col-2"></div>
										<div class="col-8">
											<div class="card">
												<div class="card-body">
													<h4 class="cart-title">${notice.noticeTitle }</h4>
													<div class="table-responsive">
														 <table class="table table-striped table-bordered zero-configuration">
														 	<thead>
														 		<tr>
														 			<td width="25%">계정과목</td>
														 			<td width="25%">금액</td>
														 		</tr>
														 	</thead>
														 	<tbody id="incomeStatus">
														 	
														 	</tbody>
														 </table>
													</div>
												</div>
											</div>										
										</div>
										<div class="col-2"></div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="form-group row" style="padding-left: 30px;">
										<div class="col-lg-12" style="padding-left: 80px;">
											${notice.noticeContent }</div>
									</div>
								</c:otherwise>
							</c:choose>
							<!-- 일반 회계공지 
							 -->

							<div class="form-group row" style="padding-top: 50px;">
								<div class="col-lg-7" align="right">
									<button type="button" class="btn mb-1 btn-outline-warning"
										onclick="location.href='acupdate.wo'">수정하기</button>
									<button type="button" class="btn mb-1 btn-outline-warning"
										id="listBtn" onclick="location.href='acnoticeList.wo'">목록으로</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<input type="hidden" id="dataValue" />
		<!--**********************************
            Content body end
        ***********************************-->
		<c:import url="../common/footer.jsp"></c:import>
	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->
    
	<script src="resources/account/js/detailNotice.js"></script>
	<script>
		$(function(){
			 if(${notice.noticeAccType eq 3}){
				 saleList('${notice.noticeContent}');
			}
			 
			 
			if(${notice.noticeAccType eq 2}){
				accountList('${notice.noticeContent}');
			}			
		})
	</script>
	

</body>
</html>
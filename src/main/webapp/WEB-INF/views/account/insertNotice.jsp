<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/account/css/insertNotice.css" rel="stylesheet">
<script type="text/javascript" src="resources/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
	<link rel="icon" type="image/png" sizes="16x16"
	href="resources/icons/logo1.png">
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
						<h3 style="padding-top: 40px; padding-bottom: 10px;">회계 공지 작성</h3>
						<br />
						<form action="aninsert.wo" method="post" enctype="multipart/form-data" >
							<div class="form-group row" style="padding-left: 30px;">
								<label class="col-lg-2 col-form-label" for="title">제목</label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="noticeTitle" name="noticeTitle">
								</div>
							</div>
							<div class="form-group row" style="padding-left: 30px;">
								<label class="col-lg-2 col-form-label" for="title">공지유형</label>
								<div class="col-lg-2">
									<select class="form-control" name="noticeType" id="noticeType">
										<option value="1">일반공지</option>
										<option value="2">재무상태표</option>
										<option value="3">포괄손익계산서</option>
									</select>
								</div>
								
								
								<label class="col-lg-1 col-form-label" for="date" id="ldate" style="display: none">날짜</label>
								<div class="col-lg-2" id="date" style="display: none">
									<input type="date" class="form-control" id="inputDate"  name="date"/>
								</div>
								
								<label class="col-lg-1 col-form-label" id="lterm" for="lterm" style="display: none">기간</label>
								<div class="col-lg-2" id="term" style="display: none">
									<select class="form-control" name="termselect" id="termselect">
										<option value="">---</option>
										<option value="년">연간</option>
										<option value="분기">분기</option>
									</select>
								</div>
								<label class="col-lg-1 col-form-label" id="lchterm" for="chterm1" style="display: none">기간선택</label>
								<div class="col-lg-2" id="chterm1" style="display: none">
									<select class="form-control" name="quarter" id="quarter">
									</select>
								</div>
								<label class="col-lg-1 col-form-label" id="lchterm2" for="chterm2" style="display: none">기간선택</label>
								<div class="col-lg-2" id="chterm2" style="display: none">
									<select class="form-control" name="noticeYear" id="noticeYear">
									</select>
								</div>
							</div>
							<input type="hidden" name="noticeContent" id="noticeContent" value="" />
							<!-- 일반 회계공지 
							 -->
							<p align="left" style="padding-left: 8%; padding-bottom: 40px;">
								<label>본문</label>
							</p>
							<div class="col-lg-12" style="padding-left: 100px;" id="editor">
								<textarea name="ir1" id="ir1" class="col-lg-10" rows="15" cols="157"></textarea>
							</div>
								<!-- 재무상태표 -->
									<div class="form-group row" id="accountStatus" style="padding-left: 30px; display:none;">
										<div class="col-2"></div>
										
										<div class="col-8">
											<div class="card">
												<div class="card-body">
													<h4 class="cart-title">${notice.noticeTitle }</h4>
													<div class="table-responsive">
														<table
															class="table table-striped table-bordered zero-configuration">
															<thead>
																<tr>
																	<td width="25%">계정과목</td>
																	<td width="25%">금액</td>
																	<td width="25%">계정과목</td>
																	<td width="25%">금액</td>
																</tr>
															</thead>
															<tbody id="accountStatus1">
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									
									<div class="form-group row" id="incomeStatus" style="padding-left: 30px; display:none;">
										<div class="col-2"></div>
										<div class="col-8">
											<div class="card">
												<div class="card-body">
													<h4 class="cart-title">${notice.noticeTitle }</h4>
													<div class="table-responsive">
														<table
															class="table table-striped table-bordered zero-configuration">
															<thead>
																<tr>
																	<td width="25%">계정과목</td>
																	<td width="25%">금액</td>
																</tr>
															</thead>
															<tbody id="incomeStatus1">

															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										<div class="col-2"></div>
									</div>
									<div class="form-group row" style="padding-left: 30px;">

										

									</div>
									<div class="form-group row" id="insertFile" style="padding-left: 30px;">
										<label class="col-lg-1 col-form-label" for="file"></label>
										<div class="col-lg-8" align="left">
											<input type="file" id="file" name="file"
												value="파일">
										</div>
									</div>
								<div class="form-group row" style="padding-top: 30px;">
								<div class="col-lg-4"></div>
								<button type="button" class="col-lg-2 btn mb-1 btn-outline-warning" onclick="javascript:history.back();">이전페이지로</button>
								<button type="submit" class="col-lg-2 btn mb-1 btn-outline-warning"
									id="saveBtn" onclick="return check(); check2();">저장</button>
									<div class="col-lg-4"></div>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!--**********************************
            Content body end
        ***********************************-->
		<c:import url="../common/footer.jsp"></c:import>
	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	<script src="resources/account/js/insertNotice.js"></script>
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ir1",
			sSkinURI : "resources/se2/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		});
		$(function() {
			if($('#noticeType').val()=='1'){
				
			$('#saveBtn').on('click', function(elClickedObj) {
				// 에디터의 내용이 textarea에 적용된다.
				oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

				// 에디터의 내용에 대한 값 검증은 이곳에서
				console.log(document.getElementById("ir1").value);
				
				try {
					elClickedObj.form.submit();
				} catch (e) {
				}
			});
			}

		})
	</script>
</body>
</html>
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
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
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
						<form action="">
							<div class="form-group row" style="padding-left: 30px;">
								<label class="col-lg-2 col-form-label" for="title">제목</label>
								<div class="col-lg-8">
									<input type="text" class="form-control" id="title"
										name="title">
								</div>
							</div>
							<div class="form-group row" style="padding-left: 30px;">
								<label class="col-lg-2 col-form-label" for="title">공지유형</label>
								<div class="col-lg-2">
									<select class="form-control" name="noticeType" id="noticeType">
										<option value="일반공지">일반공지</option>
										<option value="재무상태표">재무상태표</option>
										<option value="포괄손익계산서">포괄손익계산서</option>
									</select>
								</div>
								<label class="col-lg-1 col-form-label" for="title">공지유형</label>
								<div class="col-lg-2">
									<select class="form-control" name="noticeType" id="noticeType">
										<option value="일반공지">일반공지</option>
										<option value="재무상태표">재무상태표</option>
										<option value="포괄손익계산서">포괄손익계산서</option>
									</select>
								</div>
								<label class="col-lg-1 col-form-label" for="title">공지유형</label>
								<div class="col-lg-2">
									<select class="form-control" name="noticeType" id="noticeType">
										<option value="일반공지">일반공지</option>
										<option value="재무상태표">재무상태표</option>
										<option value="포괄손익계산서">포괄손익계산서</option>
									</select>
								</div>
							</div>
							<p align="left" style="padding-left: 114px;"><label for="ir1">본문</label></p>
							<div class="form-group row" style="padding-left: 30px;">
								
								<div class="col-lg-12" style="padding-left: 80px;">
								<textarea name="ir1" id="ir1" rows="15" cols="148" >
								</textarea>
								</div>
								
							</div>
							<div class="form-group row" style="padding-left: 30px;">
								<label class="col-lg-1 col-form-label" for="file"></label>
								<div class="col-lg-8" align="left">
									<input multiple="multiple" type="file" id="file"
										name="file" value="파일">
								</div>
							</div>
							<button type="submit" class="btn mb-1 btn-outline-warning" id="saveBtn">저장</button>
						</form>
					</div>
				</div>
			</div>
			<!-- row -->

		</div>
		<!--**********************************
            Content body end
        ***********************************-->
		<c:import url="../common/footer.jsp"></c:import>
	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->
	<script src="resources/account/js/insertNotice.js"></script>
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "ir1",
 sSkinURI: "resources/se2/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});
$(function(){
	$('#saveBtn').on('click',function(elClickedObj){
		 // 에디터의 내용이 textarea에 적용된다.
		 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

		 // 에디터의 내용에 대한 값 검증은 이곳에서
		 console.log( document.getElementById("ir1").value)

		 try {
		     elClickedObj.form.submit();
		 } catch(e) {}
	})
})

</script>
</body>
</html>
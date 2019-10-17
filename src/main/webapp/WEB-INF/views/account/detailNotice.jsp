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
						<h3 style="padding-top: 40px; padding-bottom: 10px;">회계 상세 조회</h3>
						<br />
						<form action="">
							<div class="form-group row" style="padding-left: 30px;">
								<label class="col-lg-2 col-form-label" for="title">제목</label>
								<div class="col-lg-8">
									<p class="form-group">제목입니다.</p>
								</div>
							</div>
							<div class="form-group row" style="padding-left: 30px;">
								<label class="col-lg-2 col-form-label" for="title">공지유형</label>
								<div class="col-lg-2">
									<p class="form-group">일반공지</p>
								</div>
							</div>
							<div class="form-group row" style="padding-left: 30px;">
								<label class="col-lg-2 col-form-label" for="title">파일</label><br />
								<div class="col-lg-2">
									<a href="경로+저장된파일명" download="다운로드될 파일명">filedownload</a>
								</div>
							</div>
							<p align="left" style="padding-left: 114px;"><label>본문</label></p>
							<!-- 일반 회계공지 
							<div class="form-group row" style="padding-left: 30px;">
								
								<div class="col-lg-12" style="padding-left: 80px;">
									본문내용들어올곳
								</div>
								
							</div>
							<div class="form-group row" style="padding-left: 30px;">
								<label class="col-lg-1 col-form-label" for="file"></label>
								<div class="col-lg-8" align="left">
									<input multiple="multiple" type="file" id="file"
										name="file" value="파일">
								</div>
							</div> -->
							<div class="form-group row" style="padding-left: 30px;">
								
								<div class="col-lg-12" style="padding-left: 80px;">
									<div id="grid" style="background: white;"></div>
								</div>
								
							</div>
							<div class="form-group row">
								<div class="col-lg-7" align="right">
								<button type="button" class="btn mb-1 btn-outline-warning" onclick="location.href='acupdate.wo'">수정하기</button>
								<button type="button" class="btn mb-1 btn-outline-warning" id="listBtn" onclick="location.href='acnoticeList.wo'">목록으로</button>
								</div>
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


</body>
</html>
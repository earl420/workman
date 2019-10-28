<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>wework</title>
<script type="text/javascript" src="resources/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
</head>
<body>
	<!-- main-wrapper -->
	<div id="main-wrapper" style="">
		<c:import url="../common/header.jsp"></c:import>
		<!-- content-body -->
		<div class="content-body" style="min-height: 889px;">

			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="hrNotice.wo">인사관리</a></li>
						<li class="breadcrumb-item active"><a href="hrNotice.wo">공지사항</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">공지사항 등록</h5>
								<br>
								<form action="ninsert.wo" method="post"
									encType="multipart/form-data">
									제목 : <input type="text" name="noticeTitle"
										style="width: 600px;"><br> <br> 부서: <select
										name="noticeDept">
										<option value="" selected>전체부서</option>
										<c:forEach items="${ dlist }" var="d">

											<option value="${ d.deptNum }">${ d.deptName }</option>
										</c:forEach>
									</select><br> 작성자 : <%-- ${ loginUser.empName } --%> <br> 내용 :
									<textarea name="ir1" id="ir1" rows="15" cols="148">
	                            		
									</textarea>
									<button type="button" class="btn mb-1 btn-rounded btn-success">
										<span class="btn-icon-left"><i
											class="fa fa-upload color-success"></i> </span>Upload
									</button>
									<br> 첨부파일 : <input type="file" name="uploadFile">
									<div class="col-sm-12 col-md-12" align="right">

										<button type="submit" class="btn mb-1 btn-rounded btn-warning">등록하기</button>
										<button type="button" class="btn mb-1 btn-rounded btn-dark"
											onclick="location.href='hrNotice.wo';">목록</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /content-body -->
		<!-- footer -->
		<c:import url="../common/footer.jsp"></c:import>
		<!-- /footer -->
	</div>
	<!-- /main-wrapper -->

	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ir1",
			sSkinURI : "resources/se2/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		});
	</script>
</body>
</html>
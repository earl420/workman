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
<link href="resources/css/style.css" rel="stylesheet">

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


	<!-- main-wrapper -->
	<div id="main-wrapper" style="">
		<c:import url="../common/header.jsp"></c:import>
		<!-- content-body -->
		<div class="content-body" style="min-height: 889px;">

			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
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
								<h4 class="card-title">공지사항</h4>
								<div class="table-responsive">
									<div id="DataTables_Table_0_wrapper"
										class="dataTables_wrapper container-fluid dt-bootstrap4">
										<div class="row">
											<br>
											<div class="col-sm-12 col-md-6">공지사항 수정</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<form action="updateNotice.wo" method="post"
													encType="multipart/form-data">
													<div class="read-content">
														<hr>
														<div class="media mb-4 mt-1">
															<div class="media-body">
																<input type="hidden" name="noticeNum"
																	value="${ n.noticeNum }"> <span
																	class="float-right">${ n.noticeDate }</span> <input
																	type="text" name="noticeTitle"
																	value="${ n.noticeTitle }" class="m-0 text-primary" style="width:500px;">
																<small class="text-muted">작성자 : ${ n.empName }</small>
															</div>
														</div>
														<textarea cols="50" rows="7" name="noticeContent">${ n.noticeContent }"</textarea>
														<hr>
														<h6 class="p-t-15">
															<i class="fa fa-download mb-2"></i> Attachments <span><input
																type="file" name="uploadFile"></span>
														</h6>
														<div class="row m-b-30">
															<div class="col-auto">
																<label class="btn mb-1 btn-rounded btn-primary"
																	for="file-input"> <span class="btn-icon-left"><i
																		class="fa fa-upload color-success" aria-hidden="true"></i>
																</span>Upload
																<input id="file-input" type="file" multiple style="display:none;">
																</label> <a href="#" class="text-muted">My-Photo.png</a>
															</div>
															<div class="col-auto">
																<a href="#" class="text-muted">My-File.docx</a>
															</div>
															<div class="col-auto">
																<a href="#" class="text-muted">My-Resume.pdf</a>
															</div>
														</div>
														<hr>
													</div>
													<span class="float-right">
														<button type="button"
															class="btn mb-1 btn-rounded btn-warning"
															onclick="location.href='notice.wo';">취소</button> <c:url
															var="updateNotice" value="updateNotice.wo">
															<c:param name="n" value="${ n }" />
														</c:url>
														<button type="submit"
															class="btn mb-1 btn-rounded btn-dark">저장하기</button>
													</span>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- #/ container -->
		</div>
		<!-- /content-body -->
		<!-- footer -->
		<c:import url="../common/footer.jsp"></c:import>
		<!-- /footer -->
	</div>
	<!-- /main-wrapper -->
</body>
</html>